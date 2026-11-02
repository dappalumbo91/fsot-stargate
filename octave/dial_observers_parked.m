% Copyright 2026 Damian Arthur Palumbo
% SPDX-License-Identifier: Apache-2.0
%
% All-observer reading of the two parked failures.
% Half-compact wall at 0.11c. One-sixth bend window at 0.06c.
% The shapes are not retuned. These speeds are not a hunt.
% Does not edit ws_fast. Does not touch scored logs.
FW = fileparts(mfilename('fullpath')); addpath(fileparts(FW)); setup_wf; addpath(FW);
if observer_lmi("test") ~= 1
  error('observer self-test failed');
end
ell = 0.8573494832025231;
R2 = 20;
R1 = R2 * (1 - ell);
h = 2.5 * (R2/110);
L = 150 * (R2/110);
N = round(2*L/h); nz = 5;
gridSize = [1, N, N, nz];
gridScaling = [1/(1000*c), h, h, h];
worldCenter = [1, (N+1)/2*h, (N+1)/2*h, (nz+1)/2*h];
worldSize = sqrt((N*h - worldCenter(2))^2 + (N*h - worldCenter(3))^2 + (nz*h - worldCenter(4))^2);
rsample = linspace(0, worldSize*1.2, 1e5)';
drs = rsample(2) - rsample(1);
outDir = getenv('OUT');
if isempty(outDir), error('Set OUT to a writable directory'); end
if exist(outDir, 'dir') ~= 7, mkdir(outDir); end
fid = fopen(fullfile(outDir, 'dial_observers_parked.txt'), 'w');
out = @(varargin) [fprintf(varargin{:}); fprintf(fid, varargin{:})];
out('parked. ell=%.16f R2=%.3f R1=%.3f N=%d h=%.5f\n', ell, R2, R1, N, h);
out('half wall at 0.11c, one-sixth window at 0.06c. place is the cell: 0 nose, 90 side, 180 back. dir is the worst null vector.\n');
out('clean would require all four exact ratios > -1e-3, serious fraction 0, and no Type II or Type IV cell. A marked failure is the result.\n');
fflush(fid);

zc = (nz + 1) / 2;
ix = 3:N-2;
[X, Y] = ndgrid(((1:N)*h - worldCenter(2)), ((1:N)*h - worldCenter(3)));
Xs = X(ix, ix);
Ys = Y(ix, ix);
wvol = pi * abs(Ys) * h^2;

% --- half-compact wall, mix shift, builder mass ---
C = 1/2;
m = C * R2 * c^2 / (2*G);
rho = zeros(size(rsample)) + m / (4/3*pi*(R2^3 - R1^3)) .* (rsample > R1 & rsample < R2);
M = cumtrapz(rsample, 4*pi .* rho .* rsample.^2);
P = TOVconstDensity(R2, M, rho, rsample);
iEdge = find(rsample > R1, 1, 'first');
Pedge = P(iEdge);
Sprs = ones(size(rsample));
Sprs(rsample >= R2) = 0;
wall = rsample > R1 & rsample < R2;
Sprs(wall) = P(wall) / Pedge;
Sprs = smooth(smooth(Sprs, 4000), 4000);
f = compactSigmoid(rsample, R1, R2, 0, 0);
if f(1) < 0, Ssig = -f; else, Ssig = f; end
Ssig = smooth(smooth(Ssig, 4000), 4000);
wgt = ones(size(Ssig));
use = Sprs > 1e-8;
wgt(use) = min(1, Ssig(use) ./ Sprs(use));
Scap = Ssig .* (1 + (Sprs - Ssig) .* wgt);
Sblend = Ssig .* (1 + Sprs - Ssig);
S = Ssig .* Sblend + (1 - Ssig) .* Scap;
S(S < 0) = 0; S(S > 1) = 1;
out('\n-- half wall C=1/2 m=%.6e S(0)=%.5f\n', m, S(1));
for v = 0.11
  Mt = ws_fast(gridSize, worldCenter, m, R1, R2, 0, 0, 4000, v, 0, gridScaling);
  [I, J, K] = ndgrid(1:N, 1:N, 1:nz);
  x = I*h - worldCenter(2); y = J*h - worldCenter(3); z = K*h - worldCenter(4);
  rr = sqrt(x.^2 + y.^2 + z.^2);
  Sgrid = interp1(rsample, S, rr, 'linear', 0);
  bx = -Sgrid * v;
  Mt.tensor{1, 2} = reshape(bx, gridSize); Mt.tensor{2, 1} = Mt.tensor{1, 2};
  Mt.tensor{1, 3} = reshape(zeros(size(bx)), gridSize); Mt.tensor{3, 1} = Mt.tensor{1, 3};
  Mt.tensor{1, 4} = reshape(zeros(size(bx)), gridSize); Mt.tensor{4, 1} = Mt.tensor{1, 4};
  tic;
  W = evalMetric(Mt, 0, 1);
  g = @(p, q) squeeze(Mt.tensor{p, q}(1, ix, ix, zc));
  detg = g(2,2).*(g(3,3).*g(4,4)-g(3,4).^2) - g(2,3).*(g(2,3).*g(4,4)-g(3,4).*g(2,4)) + g(2,4).*(g(2,3).*g(3,4)-g(3,3).*g(2,4));
  dV = wvol .* sqrt(max(detg, 0));
  rhoE = squeeze(W.energyTensorEulerian.tensor{1,1}(1, ix, ix, zc));
  pk = max(abs(rhoE(:)));
  Etot = sum(rhoE(:) .* dV(:));
  maps = {W.null, W.weak, W.strong, W.dominant};
  worst = zeros(1, 4); serious = zeros(1, 4);
  for k = 1:4
    aa = squeeze(maps{k}(1, ix, ix, zc));
    worst(k) = max(0, -min(aa(:))) / pk;
    serious(k) = mean(aa(:) < -1e-3 * pk);
  end
  shift = max(abs(Mt.tensor{1, 2}(:)));
  sampleClean = all(worst < 1e-3) && all(serious == 0) && Etot > 0 && isfinite(pk) && abs(shift - v) < 1e-3;
  if sampleClean, slab = 'CLEAN'; else, slab = 'FAIL'; end
  out('half v=%.2f sample E=%.4e null=%.3e weak=%.3e strong=%.3e dom=%.3e ser=%.4f shift=%.3e %s %.1fs\n', ...
      v, Etot/c^2, worst(1), worst(2), worst(3), worst(4), max(serious), shift, slab, toc);
  labels = {'null', 'weak', 'strong', 'dominant'};
  rrplane = hypot(Xs, Ys);
  for k = 1:4
    aa = squeeze(maps{k}(1, ix, ix, zc));
    [vmin, lin] = min(aa(:));
    [ii, jj] = ind2sub(size(aa), lin);
    place = atan2(abs(Ys(ii, jj)), Xs(ii, jj)) * 180/pi;
    out('  sample %s r=%.3f place=%.1f signed=%.3e\n', labels{k}, rrplane(ii, jj), place, vmin/pk);
  end
  Te = cell(4, 4);
  for a = 1:4
    for b = 1:4
      Te{a, b} = squeeze(W.energyTensorEulerian.tensor{a, b}(1, ix, ix, zc));
    end
  end
  tic;
  Ob = observer_lmi(Te, Xs, Ys, R2, pk);
  exactClean = Ob.qNull > -1e-3 && Ob.qWeak > -1e-3 && Ob.qStrong > -1e-3 && Ob.dec > -1e-3 && Ob.serious == 0 && Ob.nType2 == 0 && Ob.nType4 == 0;
  if exactClean, elab = 'CLEAN'; else, elab = 'FAIL'; end
  out('half v=%.2f exact qN=%.3e qW=%.3e qS=%.3e dec=%.3e ser=%.4f type1=%d type2=%d type4=%d decMiss=%d %s %.1fs\n', ...
      v, Ob.qNull, Ob.qWeak, Ob.qStrong, Ob.dec, Ob.serious, Ob.nType1, Ob.nType2, Ob.nType4, Ob.decMiss, elab, toc);
  out('  worst null r=%.3f place=%.1f dir=%.1f type=%d weak r=%.3f place=%.1f dir=%.1f type=%d strong r=%.3f place=%.1f dir=%.1f type=%d dec r=%.3f place=%.1f dir=%.1f type=%d\n', ...
      Ob.rNull, Ob.pNull, Ob.aNull, Ob.tNull, Ob.rWeak, Ob.pWeak, Ob.aWeak, Ob.tWeak, Ob.rStrong, Ob.pStrong, Ob.aStrong, Ob.tStrong, Ob.rDec, Ob.pDec, Ob.aDec, Ob.tDec);
  tailClean = Ob.tail.qNull > -1e-3 && Ob.tail.qWeak > -1e-3 && Ob.tail.qStrong > -1e-3 && Ob.tail.dec > -1e-3 && Ob.tail.serious == 0 && Ob.tail.nType2 == 0 && Ob.tail.nType4 == 0;
  if tailClean, tlab = 'CLEAN'; else, tlab = 'FAIL'; end
  out('half v=%.2f tail n=%d qN=%.3e qW=%.3e qS=%.3e dec=%.3e ser=%.4f type4=%d dec r=%.3f place=%.1f dir=%.1f %s\n', ...
      v, Ob.tail.n, Ob.tail.qNull, Ob.tail.qWeak, Ob.tail.qStrong, Ob.tail.dec, Ob.tail.serious, Ob.tail.nType4, Ob.tail.rDec, Ob.tail.pDec, Ob.tail.aDec, tlab);
  fflush(fid);
  clear Mt W Te Ob;
end

% --- one-sixth bend window, same placement as dial_sixth_bend.m ---
C = 1/6;
m = C * R2 * c^2 / (2*G);
mHalf = 0.5 * R2 * c^2 / (2*G);
rhoHalf = mHalf / (4/3*pi*(R2^3 - R1^3));
rhoUni = m / (4/3*pi*(R2^3 - R1^3));
rho0 = rhoUni .* (rsample > R1 & rsample < R2);
M0 = cumtrapz(rsample, 4*pi .* rho0 .* rsample.^2);
Pball = TOVconstDensity(R2, M0, rho0, rsample);
Pball(~isfinite(Pball) | rsample >= R2) = 0;
Pedge = Pball(iEdge);
Sprs = ones(size(rsample));
Sprs(rsample >= R2) = 0;
Sprs(wall) = Pball(wall) / Pedge;
Sprs = smooth(smooth(Sprs, 4000), 4000);
f = compactSigmoid(rsample, R1, R2, 0, 0);
if f(1) < 0, Ssig = -f; else, Ssig = f; end
Ssig = smooth(smooth(Ssig, 4000), 4000);
wgt = ones(size(Ssig));
use = Sprs > 1e-8;
wgt(use) = min(1, Ssig(use) ./ Sprs(use));
Scap = Ssig .* (1 + (Sprs - Ssig) .* wgt);
Sblend = Ssig .* (1 + Sprs - Ssig);
S = Ssig .* Sblend + (1 - Ssig) .* Scap;
S(S < 0) = 0; S(S > 1) = 1;
dS = gradient(S, drs);
d2S = gradient(dS, drs);
dAbs = abs(dS);
[dMax, iMax] = max(dAbs);
rSlope = rsample(iMax);
outer = rsample > rSlope;
[d2Max, iCurv] = max(d2S .* outer);
rCurv = rsample(iCurv);
span = rCurv - rSlope;
rEnd = min(rCurv + span, rsample(end));
dEnd = interp1(rsample, dAbs, rEnd);
fracAll = (rsample - rSlope) / (rEnd - rSlope);
chord = dMax + (dEnd - dMax) .* fracAll;
w = dAbs;
selC = rsample >= rSlope & rsample <= rEnd;
w(selC) = max(dAbs(selC), chord(selC));
s1 = 1.79 * 4000;
sm4 = @(q) smooth(smooth(smooth(smooth(q, s1), s1), s1), s1);
rhoU = sm4(rhoUni .* wall);
rhoU(~isfinite(rhoU) | rhoU < 0) = 0;
rhoU = rhoU * (m / trapz(rsample, 4*pi .* rhoU .* rsample.^2));
rhoS = sm4(w .* wall);
rhoS(~isfinite(rhoS) | rhoS < 0) = 0;
rhoS = rhoS * (m / trapz(rsample, 4*pi .* rhoS .* rsample.^2));
iCross = find(rsample > R1 & rhoS >= rhoU, 1, 'first');
rCross = rsample(iCross);
iFlip = find(rsample > rCross & d2S > 0 & [0; d2S(1:end-1)] <= 0, 1, 'first');
rFlip = rsample(iFlip);
rhoB = rhoS;
rhoB(rsample < rCross) = rhoU(rsample < rCross);
Mnow = trapz(rsample, 4*pi .* rhoB .* rsample.^2);
excess = Mnow - m;
pay = rsample >= rCross & rsample < rFlip;
Mpay = trapz(rsample(pay), 4*pi .* rhoB(pay) .* rsample(pay).^2);
fPay = (Mpay - excess) / Mpay;
rhoB(pay) = rhoB(pay) * fPay;
Mend = trapz(rsample, 4*pi .* rhoB .* rsample.^2);
rhoB = rhoB * (m / Mend);
[rhoPk, iPk] = max(rhoB);
out('\n-- sixth bend m=%.6e peak/rhoHalf=%.3f rSlope=%.3f rCurv=%.3f rEnd=%.3f pay=%.4f\n', ...
    m, rhoPk/rhoHalf, rSlope, rCurv, rEnd, fPay);
Mbend = cumtrapz(rsample, 4*pi .* rhoB .* rsample.^2);
Mbend(Mbend < 0) = max(Mbend);
Ph = zeros(size(rsample));
iOut = find(rsample > R2 & rhoB < 1e-8 * rhoPk, 1, 'first');
if isempty(iOut), iOut = length(rsample); end
for i = (iOut - 1):-1:2
  r = rsample(i + 1); Pp = Ph(i + 1); rhoi = rhoB(i + 1); Mi = Mbend(i + 1);
  denom = r^2 * (1 - 2*G*Mi/(r*c^2));
  if denom <= 0, break; end
  rhs = -G * (rhoi + Pp/c^2) * (Mi + 4*pi*r^3*Pp/c^2) / denom;
  if ~isfinite(rhs), break; end
  Ph(i) = Pp - rhs * drs;
end
Ph(~isfinite(Ph) | rsample <= R1) = 0;
Ph4 = sm4(Ph);
Ph4(~isfinite(Ph4)) = 0;
a = alphaNumericSolver(Mbend(:), Ph4(:), R2, rsample(:));
B = (1 - 2*G.*Mbend./rsample/c^2).^(-1);
B(1) = 1;
B(~isfinite(B) | B <= 0) = 1;
A = -exp(2.*a);
A(~isfinite(A)) = -1;
[I, J, K] = ndgrid(1:N, 1:N, 1:nz);
xg = I*h - worldCenter(2); yg = J*h - worldCenter(3); zg = K*h - worldCenter(4);
rrg = sqrt(xg.^2 + yg.^2 + zg.^2);
Aval = interp1(rsample, A, rrg, 'linear', -1);
Bval = interp1(rsample, B, rrg, 'linear', 1);
theta = atan2(sqrt(xg.^2 + yg.^2), zg); phi = atan2(yg, xg);
cP = cos(phi); cP(abs(phi) == pi/2) = 0;
cT = cos(theta); cT(abs(theta) == pi/2) = 0;
sT = sin(theta); sP = sin(phi);
g22 = (Bval.*cP.^2.*sT.^2 + (cP.^2.*cT.^2)) + sP.^2;
g33 = (Bval.*sP.^2.*sT.^2 + (cT.^2.*sP.^2)) + cP.^2;
g44 = (Bval.*cT.^2 + sT.^2);
g23 = (Bval.*cP.*sP.*sT.^2 + (cP.*cT.^2.*sP) - cP.*sP);
g24 = (Bval.*cP.*cT.*sT - (cP.*cT.*sT));
g34 = (Bval.*cT.*sP.*sT - (cT.*sP.*sT));
Sgrid = interp1(rsample, S, rrg, 'linear', 0);
base = ws_fast(gridSize, worldCenter, m, R1, R2, 0, 0, 4000, 0, 0, gridScaling);
base.tensor{1, 1} = reshape(Aval, gridSize);
base.tensor{2, 2} = reshape(g22, gridSize);
base.tensor{3, 3} = reshape(g33, gridSize);
base.tensor{4, 4} = reshape(g44, gridSize);
base.tensor{2, 3} = reshape(g23, gridSize); base.tensor{3, 2} = base.tensor{2, 3};
base.tensor{2, 4} = reshape(g24, gridSize); base.tensor{4, 2} = base.tensor{2, 4};
base.tensor{3, 4} = reshape(g34, gridSize); base.tensor{4, 3} = base.tensor{3, 4};
for v = 0.06
  Mt = base;
  bx = -Sgrid * v;
  Mt.tensor{1, 2} = reshape(bx, gridSize); Mt.tensor{2, 1} = Mt.tensor{1, 2};
  Mt.tensor{1, 3} = reshape(zeros(size(bx)), gridSize); Mt.tensor{3, 1} = Mt.tensor{1, 3};
  Mt.tensor{1, 4} = reshape(zeros(size(bx)), gridSize); Mt.tensor{4, 1} = Mt.tensor{1, 4};
  tic;
  W = evalMetric(Mt, 0, 1);
  g = @(p, q) squeeze(Mt.tensor{p, q}(1, ix, ix, zc));
  detg = g(2,2).*(g(3,3).*g(4,4)-g(3,4).^2) - g(2,3).*(g(2,3).*g(4,4)-g(3,4).*g(2,4)) + g(2,4).*(g(2,3).*g(3,4)-g(3,3).*g(2,4));
  dV = wvol .* sqrt(max(detg, 0));
  rhoE = squeeze(W.energyTensorEulerian.tensor{1,1}(1, ix, ix, zc));
  pk = max(abs(rhoE(:)));
  Etot = sum(rhoE(:) .* dV(:));
  maps = {W.null, W.weak, W.strong, W.dominant};
  worst = zeros(1, 4); serious = zeros(1, 4);
  for k = 1:4
    aa = squeeze(maps{k}(1, ix, ix, zc));
    worst(k) = max(0, -min(aa(:))) / pk;
    serious(k) = mean(aa(:) < -1e-3 * pk);
  end
  shift = max(abs(Mt.tensor{1, 2}(:)));
  sampleClean = all(worst < 1e-3) && all(serious == 0) && Etot > 0 && isfinite(pk) && abs(shift - v) < 1e-3;
  if sampleClean, slab = 'CLEAN'; else, slab = 'FAIL'; end
  out('sixth v=%.2f sample E=%.4e null=%.3e weak=%.3e strong=%.3e dom=%.3e ser=%.4f shift=%.3e %s %.1fs\n', ...
      v, Etot/c^2, worst(1), worst(2), worst(3), worst(4), max(serious), shift, slab, toc);
  labels = {'null', 'weak', 'strong', 'dominant'};
  rrplane = hypot(Xs, Ys);
  for k = 1:4
    aa = squeeze(maps{k}(1, ix, ix, zc));
    [vmin, lin] = min(aa(:));
    [ii, jj] = ind2sub(size(aa), lin);
    place = atan2(abs(Ys(ii, jj)), Xs(ii, jj)) * 180/pi;
    out('  sample %s r=%.3f place=%.1f signed=%.3e\n', labels{k}, rrplane(ii, jj), place, vmin/pk);
  end
  Te = cell(4, 4);
  for a = 1:4
    for b = 1:4
      Te{a, b} = squeeze(W.energyTensorEulerian.tensor{a, b}(1, ix, ix, zc));
    end
  end
  tic;
  Ob = observer_lmi(Te, Xs, Ys, R2, pk);
  exactClean = Ob.qNull > -1e-3 && Ob.qWeak > -1e-3 && Ob.qStrong > -1e-3 && Ob.dec > -1e-3 && Ob.serious == 0 && Ob.nType2 == 0 && Ob.nType4 == 0;
  if exactClean, elab = 'CLEAN'; else, elab = 'FAIL'; end
  out('sixth v=%.2f exact qN=%.3e qW=%.3e qS=%.3e dec=%.3e ser=%.4f type1=%d type2=%d type4=%d decMiss=%d %s %.1fs\n', ...
      v, Ob.qNull, Ob.qWeak, Ob.qStrong, Ob.dec, Ob.serious, Ob.nType1, Ob.nType2, Ob.nType4, Ob.decMiss, elab, toc);
  out('  worst null r=%.3f place=%.1f dir=%.1f type=%d weak r=%.3f place=%.1f dir=%.1f type=%d strong r=%.3f place=%.1f dir=%.1f type=%d dec r=%.3f place=%.1f dir=%.1f type=%d\n', ...
      Ob.rNull, Ob.pNull, Ob.aNull, Ob.tNull, Ob.rWeak, Ob.pWeak, Ob.aWeak, Ob.tWeak, Ob.rStrong, Ob.pStrong, Ob.aStrong, Ob.tStrong, Ob.rDec, Ob.pDec, Ob.aDec, Ob.tDec);
  tailClean = Ob.tail.qNull > -1e-3 && Ob.tail.qWeak > -1e-3 && Ob.tail.qStrong > -1e-3 && Ob.tail.dec > -1e-3 && Ob.tail.serious == 0 && Ob.tail.nType2 == 0 && Ob.tail.nType4 == 0;
  if tailClean, tlab = 'CLEAN'; else, tlab = 'FAIL'; end
  out('sixth v=%.2f tail n=%d qN=%.3e qW=%.3e qS=%.3e dec=%.3e ser=%.4f type4=%d dec r=%.3f place=%.1f dir=%.1f %s\n', ...
      v, Ob.tail.n, Ob.tail.qNull, Ob.tail.qWeak, Ob.tail.qStrong, Ob.tail.dec, Ob.tail.serious, Ob.tail.nType4, Ob.tail.rDec, Ob.tail.pDec, Ob.tail.aDec, tlab);
  fflush(fid);
  clear Mt W Te Ob;
end
out('observers done\n');
fclose(fid);
