% Copyright 2026 Damian Arthur Palumbo
% SPDX-License-Identifier: Apache-2.0
%
% The z-matched N=240 window fails at the steepest slope, and the
% center cell is over the bar. This reads the matter that was placed
% against the Cartesian tensor. Cells inside the still-empty ball are
% set back to zero. The slope is not zeroed and the shape is not retuned.
FW = fileparts(mfilename('fullpath')); addpath(fileparts(FW)); setup_wf; addpath(FW);
if observer_lmi("test") ~= 1
  error('observer self-test failed');
end
ell = 0.8573494832025231;
R2 = 20;
R1 = R2 * (1 - ell);
h = 1.25 * (R2/110);
L = 150 * (R2/110);
N = round(2*L/h); nz = 5;
gridSize = [1, N, N, nz];
gridScaling = [1/(1000*c), h, h, h];
worldCenter = [1, (N+1)/2*h, (N+1)/2*h, (nz+1)/2*h];
worldSize = sqrt((N*h - worldCenter(2))^2 + (N*h - worldCenter(3))^2 + (nz*h - worldCenter(4))^2);
rsample = linspace(0, worldSize*1.2, 1e5)';
iEdge = find(rsample > R1, 1, 'first');
wall = rsample > R1 & rsample < R2;
outDir = getenv('OUT');
if isempty(outDir), error('Set OUT to a writable directory'); end
if exist(outDir, 'dir') ~= 7, mkdir(outDir); end
fid = fopen(fullfile(outDir, 'dial_slope_ray.txt'), 'w');
out = @(varargin) [fprintf(varargin{:}); fprintf(fid, varargin{:})];
out('slope ray. ell=%.16f R2=%.3f R1=%.3f N=%d h=%.5f smoothFactor=4000\n', ell, R2, R1, N, h);
out('shift off. same window as the z-matched grid. slope cells are not zeroed.\n');
fflush(fid);

hz = 2.5 * (R2/110);
gridScaling = [1/(1000*c), h, h, hz];
worldCenter(4) = (nz+1)/2 * hz;
worldSize = sqrt((N*h - worldCenter(2))^2 + (N*h - worldCenter(3))^2 + (nz*hz - worldCenter(4))^2);
rsample = linspace(0, worldSize*1.2, 1e5)';
drs = rsample(2) - rsample(1);
out('window grid xy h=%.5f z hz=%.5f worldSize=%.4f\n', h, hz, worldSize);
fflush(fid);
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
out('sixth bend m=%.6e peak/rhoHalf=%.3f rSlope=%.3f rCurv=%.3f rEnd=%.3f pay=%.4f\n', ...
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
Pc = Ph4 / c^2;
margin = (rhoB - abs(Pc)) / rhoPk;
[mMin, iBad] = min(margin);
out('continuum min (rho-|P|/c2)/rhoPk=%.4e at r=%.4f rho=%.6e P/c2=%.6e\n', ...
    mMin, rsample(iBad), rhoB(iBad), Pc(iBad));
out('continuum at slope r=%.4f rho=%.6e P/c2=%.6e P/(rho c2)=%.4f margin/rhoPk=%.4e\n', ...
    rSlope, rhoB(iMax), Pc(iMax), Pc(iMax)/rhoB(iMax), margin(iMax));
iRho = find(rhoB > 0, 1, 'first');
rFlat = rsample(iRho);
out('continuum first rhoB>0 at r=%.4f rho=%.6e Ph4min=%.6e\n', rFlat, rhoB(iRho), min(Ph4));
fflush(fid);

a = alphaNumericSolver(Mbend(:), Ph4(:), R2, rsample(:));
B = (1 - 2*G.*Mbend./rsample/c^2).^(-1);
B(1) = 1;
B(~isfinite(B) | B <= 0) = 1;
A = -exp(2.*a);
A(~isfinite(A)) = -1;
[I, J, K] = ndgrid(1:N, 1:N, 1:nz);
xg = I*h - worldCenter(2); yg = J*h - worldCenter(3); zg = K*hz - worldCenter(4);
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
Mt = base;
bx = zeros(size(Sgrid));
Mt.tensor{1, 2} = reshape(bx, gridSize); Mt.tensor{2, 1} = Mt.tensor{1, 2};
Mt.tensor{1, 3} = reshape(bx, gridSize); Mt.tensor{3, 1} = Mt.tensor{1, 3};
Mt.tensor{1, 4} = reshape(bx, gridSize); Mt.tensor{4, 1} = Mt.tensor{1, 4};
tic;
W = evalMetric(Mt, 0, 1);
zc = (nz + 1) / 2;
ix = 3:N-2;
[X, Y] = ndgrid(((1:N)*h - worldCenter(2)), ((1:N)*h - worldCenter(3)));
Xs = X(ix, ix);
Ys = Y(ix, ix);
rrplane = hypot(Xs, Ys);
wvol = pi * abs(Ys) * h^2;
g = @(p, q) squeeze(Mt.tensor{p, q}(1, ix, ix, zc));
detg = g(2,2).*(g(3,3).*g(4,4)-g(3,4).^2) - g(2,3).*(g(2,3).*g(4,4)-g(3,4).*g(2,4)) + g(2,4).*(g(2,3).*g(3,4)-g(3,3).*g(2,4));
dV = wvol .* sqrt(max(detg, 0));
rhoE = squeeze(W.energyTensorEulerian.tensor{1,1}(1, ix, ix, zc));
pk = max(abs(rhoE(:)));
Etot = sum(rhoE(:) .* dV(:));
maps = {W.null, W.weak, W.strong, W.dominant};
worst = zeros(1, 4); serious = zeros(1, 4);
labels = {'null', 'weak', 'strong', 'dominant'};
for k = 1:4
  aa = squeeze(maps{k}(1, ix, ix, zc));
  worst(k) = max(0, -min(aa(:))) / pk;
  serious(k) = mean(aa(:) < -1e-3 * pk);
end
out('anchor v=0 sample E=%.4e null=%.3e weak=%.3e strong=%.3e dom=%.3e ser=%.4f %.1fs\n', ...
    Etot/c^2, worst(1), worst(2), worst(3), worst(4), max(serious), toc);
dom = squeeze(maps{4}(1, ix, ix, zc));
[~, linD] = min(dom(:));
[id, jd] = ind2sub(size(dom), linD);
placeD = atan2(abs(Ys(id, jd)), Xs(id, jd)) * 180/pi;
rhoC = rhoE / c^2;
rhoAt = interp1(rsample, rhoB, rrplane, 'linear', 0);
PcAt = interp1(rsample, Pc, rrplane, 'linear', 0);
Txx = squeeze(W.energyTensorEulerian.tensor{2,2}(1, ix, ix, zc)) / c^2;
Tyy = squeeze(W.energyTensorEulerian.tensor{3,3}(1, ix, ix, zc)) / c^2;
Tzz = squeeze(W.energyTensorEulerian.tensor{4,4}(1, ix, ix, zc)) / c^2;
T0x = squeeze(W.energyTensorEulerian.tensor{1,2}(1, ix, ix, zc)) / c^2;
out('worst dominant r=%.3f place=%.1f dom/pk=%.4e rhoCart=%.6e rhoB=%.6e P/c2=%.6e\n', ...
    rrplane(id, jd), placeD, dom(id, jd)/pk, rhoC(id, jd), rhoAt(id, jd), PcAt(id, jd));
out('  stresses/c2 Txx=%.6e Tyy=%.6e Tzz=%.6e T0x=%.6e\n', Txx(id, jd), Tyy(id, jd), Tzz(id, jd), T0x(id, jd));
ball = rrplane < rFlat;
bad = dom < -1e-3 * pk;
rOut = rrplane(bad & ~ball);
if isempty(rOut)
  out('dominant under bar n=%d inside ball %d outside 0\n', sum(bad(:)), sum(bad(:) & ball(:)));
else
  out('dominant under bar n=%d inside ball %d outside %d rOut=[%.3f %.3f]\n', ...
      sum(bad(:)), sum(bad(:) & ball(:)), sum(bad(:) & ~ball(:)), min(rOut), max(rOut));
end
ring = abs(rrplane - rSlope) < 0.25;
out('ring |r-rSlope|<0.25 n=%d dom/pk min=%.4e med=%.4e max=%.4e\n', ...
    sum(ring(:)), min(dom(ring))/pk, median(dom(ring))/pk, max(dom(ring))/pk);
out('  ring rhoCart/rhoPk min=%.4e max=%.4e rhoB/rhoPk min=%.4e max=%.4e\n', ...
    min(rhoC(ring))/rhoPk, max(rhoC(ring))/rhoPk, min(rhoAt(ring))/rhoPk, max(rhoAt(ring))/rhoPk);
[~, jNear] = min(abs(Ys(1, :)));
xs = Xs(:, jNear); ys = Ys(:, jNear); rs = hypot(xs, ys);
sel = find(xs > 0 & rs > 12.0 & rs < 14.0);
[~, ord] = sort(rs(sel));
sel = sel(ord);
out('plus-x y=%.3f\n', ys(1));
for n = 1:numel(sel)
  i = sel(n);
  out('  r=%.3f rhoCart=%.4e rhoB=%.4e P/c2=%.4e dom/pk=%.4e\n', ...
      rs(i), rhoC(i, jNear), rhoAt(i, jNear), PcAt(i, jNear), dom(i, jNear)/pk);
end
out('flat ball r < %.4f nFlat=%d rhoCart min=%.4e rhoB max=%.4e\n', ...
    rFlat, sum(ball(:)), min(rhoC(ball)), max(rhoAt(ball)));
fflush(fid);
if max(rhoAt(ball)) > 0
  error('flat ball contains continuum density; not zeroed');
end
for k = 1:4
  aa = squeeze(maps{k}(1, ix, ix, zc));
  aa(ball) = 0;
  worst(k) = max(0, -min(aa(:))) / pk;
  serious(k) = mean(aa(:) < -1e-3 * pk);
  [vmin, lin] = min(aa(:));
  [ii, jj] = ind2sub(size(aa), lin);
  place = atan2(abs(Ys(ii, jj)), Xs(ii, jj)) * 180/pi;
  out('  flat %s r=%.3f place=%.1f signed=%.3e\n', labels{k}, rrplane(ii, jj), place, vmin/pk);
end
rhoE(ball) = 0;
Etot = sum(rhoE(:) .* dV(:));
out('flat sample E=%.4e null=%.3e weak=%.3e strong=%.3e dom=%.3e ser=%.4f\n', ...
    Etot/c^2, worst(1), worst(2), worst(3), worst(4), max(serious));
Te = cell(4, 4);
for a = 1:4
  for b = 1:4
    Te{a, b} = squeeze(W.energyTensorEulerian.tensor{a, b}(1, ix, ix, zc));
    Te{a, b}(ball) = 0;
  end
end
tic;
Ob = observer_lmi(Te, Xs, Ys, R2, pk);
exactClean = Ob.qNull > -1e-3 && Ob.qWeak > -1e-3 && Ob.qStrong > -1e-3 && Ob.dec > -1e-3 && Ob.serious == 0 && Ob.nType2 == 0 && Ob.nType4 == 0;
if exactClean, elab = 'CLEAN'; else, elab = 'FAIL'; end
out('flat exact qN=%.3e qW=%.3e qS=%.3e dec=%.3e ser=%.4f type1=%d type2=%d type4=%d decMiss=%d %s %.1fs\n', ...
    Ob.qNull, Ob.qWeak, Ob.qStrong, Ob.dec, Ob.serious, Ob.nType1, Ob.nType2, Ob.nType4, Ob.decMiss, elab, toc);
out('  worst null r=%.3f place=%.1f dir=%.1f type=%d dec r=%.3f place=%.1f dir=%.1f type=%d\n', ...
    Ob.rNull, Ob.pNull, Ob.aNull, Ob.tNull, Ob.rDec, Ob.pDec, Ob.aDec, Ob.tDec);
fflush(fid);
out('slope ray done\n');
fclose(fid);
