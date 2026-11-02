% Copyright 2026 Damian Arthur Palumbo
% SPDX-License-Identifier: Apache-2.0
%
% Ten tonnes of dust at rest in the ship, added to a metric that is already
% scored. The metric is not rebuilt. The shell integral is the shell mass.
% The dust is comoving: coordinate u^i = 0, so u^0 = 1/sqrt(-g_00).
% It is written on the coordinate tensor, then the frame transfer moves the sum.
function passenger_score(Mt, v, x, y, z, ix, zc, Xs, Ys, wvol, R2, tag, fid)
out = @(varargin) [fprintf(varargin{:}); fprintf(fid, varargin{:})];
tic;
W = evalMetric(Mt, 0, 1);
g = @(p, q) squeeze(Mt.tensor{p, q}(1, ix, ix, zc));
detg = g(2,2).*(g(3,3).*g(4,4) - g(3,4).^2) - g(2,3).*(g(2,3).*g(4,4) - g(3,4).*g(2,4)) + g(2,4).*(g(2,3).*g(3,4) - g(3,3).*g(2,4));
dV = wvol .* sqrt(max(detg, 0));
rhoShell = squeeze(W.energyTensorEulerian.tensor{1,1}(1, ix, ix, zc));
pkShell = max(abs(rhoShell(:)));
Eshell = sum(rhoShell(:) .* dV(:));
maps = {W.null, W.weak, W.strong, W.dominant};
worst = zeros(1, 4);
serious = zeros(1, 4);
for k = 1:4
  aa = squeeze(maps{k}(1, ix, ix, zc));
  worst(k) = max(0, -min(aa(:))) / pkShell;
  serious(k) = mean(aa(:) < -1e-3 * pkShell);
end
shift = max(abs(Mt.tensor{1, 2}(:)));
out('%s v=%.2f shell E=%.4e null=%.3e weak=%.3e strong=%.3e dom=%.3e ser=%.4f shift=%.3e %.1fs\n', ...
    tag, v, Eshell/c^2, worst(1), worst(2), worst(3), worst(4), max(serious), shift, toc);

g00 = Mt.tensor{1, 1};
mask = reshape((x.^2 + y.^2 + z.^2) <= 4, size(g00));
if ~any(mask(:))
  error('passenger: the 2 m ball missed the grid');
end
if any(g00(mask) >= 0)
  error('passenger: lapse is not negative inside the ball');
end
u0sq = zeros(size(g00));
u0sq(mask) = 1 ./ (-g00(mask));
dust = W.energyTensor;
for a = 1:4
  for b = 1:4
    dust.tensor{a, b} = zeros(size(g00));
  end
end
dust.tensor{1, 1} = u0sq;
if isfield(dust, 'frame')
  dust = rmfield(dust, 'frame');
end
Ed = doFrameTransfer(Mt, dust, 'Eulerian', 0);
rhoTrial = squeeze(Ed.tensor{1, 1}(1, ix, ix, zc));
Mtrial = sum(rhoTrial(:) .* dV(:)) / c^2;
if ~(Mtrial > 0)
  error('passenger: trial mass is not positive');
end
scale = 10000 / Mtrial;
dust.tensor{1, 1} = dust.tensor{1, 1} * scale;
Ed = doFrameTransfer(Mt, dust, 'Eulerian', 0);
rhoDust = squeeze(Ed.tensor{1, 1}(1, ix, ix, zc));
Mrec = sum(rhoDust(:) .* dV(:)) / c^2;
rc = hypot(Xs, Ys);
[~, i0] = min(rc(:));
[~, i1] = min(abs(rc(:) - 1));
nMid = sum(rc(:) <= 2);
out('%s v=%.2f passenger recovered=%.6f kg nMask=%d nMid=%d g00=[%.6f, %.6f] dustMax=%.6e kg/m3 dust/pk=%.3e\n', ...
    tag, v, Mrec, sum(mask(:)), nMid, min(g00(mask)), max(g00(mask)), max(rhoDust(:))/c^2, max(abs(rhoDust(:)))/pkShell);
out('%s v=%.2f center r=%.3f shell=%.6e dust=%.6e kg/m3 | near1 r=%.3f shell=%.6e dust=%.6e kg/m3\n', ...
    tag, v, rc(i0), rhoShell(i0)/c^2, rhoDust(i0)/c^2, rc(i1), rhoShell(i1)/c^2, rhoDust(i1)/c^2);

Esum = W.energyTensor;
Esum.tensor{1, 1} = Esum.tensor{1, 1} + dust.tensor{1, 1};
if isfield(Esum, 'frame')
  Esum = rmfield(Esum, 'frame');
end
tic;
Ee = doFrameTransfer(Mt, Esum, 'Eulerian', 0);
maps = { ...
  getEnergyConditions(Esum, Mt, 'Null', 100, 10, 0, 0), ...
  getEnergyConditions(Esum, Mt, 'Weak', 100, 10, 0, 0), ...
  getEnergyConditions(Esum, Mt, 'Strong', 100, 10, 0, 0), ...
  getEnergyConditions(Esum, Mt, 'Dominant', 100, 10, 0, 0)};
rhoE = squeeze(Ee.tensor{1, 1}(1, ix, ix, zc));
pk = max(abs(rhoE(:)));
Etot = sum(rhoE(:) .* dV(:));
labels = {'null', 'weak', 'strong', 'dominant'};
worst = zeros(1, 4);
serious = zeros(1, 4);
rrplane = hypot(Xs, Ys);
for k = 1:4
  aa = squeeze(maps{k}(1, ix, ix, zc));
  worst(k) = max(0, -min(aa(:))) / pk;
  serious(k) = mean(aa(:) < -1e-3 * pk);
  [vmin, lin] = min(aa(:));
  [ii, jj] = ind2sub(size(aa), lin);
  place = atan2(abs(Ys(ii, jj)), Xs(ii, jj)) * 180 / pi;
  out('  sample %s r=%.3f place=%.1f signed=%.3e\n', labels{k}, rrplane(ii, jj), place, vmin / pk);
end
sampleClean = all(worst < 1e-3) && all(serious == 0) && Etot > 0 && isfinite(pk) && abs(shift - v) < 1e-3;
if sampleClean
  slab = 'CLEAN';
else
  slab = 'FAIL';
end
out('%s v=%.2f with-passenger sample E=%.4e null=%.3e weak=%.3e strong=%.3e dom=%.3e ser=%.4f %s %.1fs\n', ...
    tag, v, Etot/c^2, worst(1), worst(2), worst(3), worst(4), max(serious), slab, toc);
out('%s v=%.2f center-sum r=%.3f rho=%.6e kg/m3 | near1-sum rho=%.6e kg/m3\n', ...
    tag, v, rc(i0), rhoE(i0)/c^2, rhoE(i1)/c^2);
Te = cell(4, 4);
for a = 1:4
  for b = 1:4
    Te{a, b} = squeeze(Ee.tensor{a, b}(1, ix, ix, zc));
  end
end
tic;
Ob = observer_lmi(Te, Xs, Ys, R2, pk);
exactClean = Ob.qNull > -1e-3 && Ob.qWeak > -1e-3 && Ob.qStrong > -1e-3 && Ob.dec > -1e-3 && Ob.serious == 0 && Ob.nType2 == 0 && Ob.nType4 == 0;
if exactClean
  elab = 'CLEAN';
else
  elab = 'FAIL';
end
out('%s v=%.2f with-passenger exact qN=%.3e qW=%.3e qS=%.3e dec=%.3e ser=%.4f type1=%d type2=%d type4=%d decMiss=%d %s %.1fs\n', ...
    tag, v, Ob.qNull, Ob.qWeak, Ob.qStrong, Ob.dec, Ob.serious, Ob.nType1, Ob.nType2, Ob.nType4, Ob.decMiss, elab, toc);
out('  worst null r=%.3f place=%.1f dir=%.1f type=%d weak r=%.3f place=%.1f dir=%.1f type=%d strong r=%.3f place=%.1f dir=%.1f type=%d dec r=%.3f place=%.1f dir=%.1f type=%d\n', ...
    Ob.rNull, Ob.pNull, Ob.aNull, Ob.tNull, Ob.rWeak, Ob.pWeak, Ob.aWeak, Ob.tWeak, Ob.rStrong, Ob.pStrong, Ob.aStrong, Ob.tStrong, Ob.rDec, Ob.pDec, Ob.aDec, Ob.tDec);
tailClean = Ob.tail.qNull > -1e-3 && Ob.tail.qWeak > -1e-3 && Ob.tail.qStrong > -1e-3 && Ob.tail.dec > -1e-3 && Ob.tail.serious == 0 && Ob.tail.nType2 == 0 && Ob.tail.nType4 == 0;
if tailClean
  tlab = 'CLEAN';
else
  tlab = 'FAIL';
end
out('%s v=%.2f tail n=%d qN=%.3e qW=%.3e qS=%.3e dec=%.3e ser=%.4f type4=%d dec r=%.3f place=%.1f dir=%.1f %s\n', ...
    tag, v, Ob.tail.n, Ob.tail.qNull, Ob.tail.qWeak, Ob.tail.qStrong, Ob.tail.dec, Ob.tail.serious, Ob.tail.nType4, Ob.tail.rDec, Ob.tail.pDec, Ob.tail.aDec, tlab);
fflush(fid);
end
