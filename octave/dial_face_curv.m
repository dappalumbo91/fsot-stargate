% Copyright 2026 Damian Arthur Palumbo
% SPDX-License-Identifier: Apache-2.0
%
% Same one-sixth window. Ask a side-weighted lapse to raise the longitudinal
% stress by the carrier face q^2/rho. This file is the tight basis: centers
% every 1 m from 3 m to 24 m, width 0.75 m, then one residual pass. The
% amplitude is the face, scaled by (v/0.06)^2, so at rest the lapse stays
% hydrostatic. If the side ray misses the face by more than 0.05 of peak, or
% pulls by more than 0.02 of peak where the face is smaller, the observers
% are not scored. Does not edit ws_fast.
%
% Kept logs from this construction:
%   data/dial_face_curv.txt         knob check, strain and lapse and traceless
%   data/dial_face_lapse.txt        sig 1.6 m, bells at 8 to 19 m, scored
%   data/dial_face_lapse_ray.txt    sig 1.6 m, whole side, one residual, scored
%   data/dial_face_lapse_tight.txt  this file
FW = fileparts(mfilename('fullpath')); addpath(fileparts(FW)); setup_wf; addpath(FW);
ell = 0.8573494832025231;
Mjup = 1.89813e27;
R2 = 20;
R1 = R2 * (1 - ell);
C = 1/6;
v = 0.06;
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
fid = fopen(fullfile(outDir, 'dial_face_lapse_tight.txt'), 'w');
out = @(varargin) [fprintf(varargin{:}); fprintf(fid, varargin{:})];
out('face lapse tight. whole side. one residual pass. R2=%.3f R1=%.3f\n', R2, R1);
out('clean: all four worst/peak < 1e-3, serious fraction 0, E>0, finite peak, shift = speed\n');

m = C * R2 * c^2 / (2*G);
mHalf = 0.5 * R2 * c^2 / (2*G);
rhoHalf = mHalf / (4/3*pi*(R2^3 - R1^3));
rhoUni = m / (4/3*pi*(R2^3 - R1^3));
out('M=%.6e (%.3f Mjup) rhoUni=%.6e rhoHalf=%.6e\n', m, m/Mjup, rhoUni, rhoHalf);

rho0 = rhoUni .* (rsample > R1 & rsample < R2);
M0 = cumtrapz(rsample, 4*pi .* rho0 .* rsample.^2);
Pball = TOVconstDensity(R2, M0, rho0, rsample);
Pball(~isfinite(Pball) | rsample >= R2) = 0;
iEdge = find(rsample > R1, 1, 'first');
Pedge = Pball(iEdge);
Sprs = ones(size(rsample));
Sprs(rsample >= R2) = 0;
wall = rsample > R1 & rsample < R2;
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
out('mix max |dS|=%.5e /m at r=%.3f\n', dMax, rSlope);
out('strongest bend r=%.3f d2S=%.5e  window end r=%.3f |dS|=%.5e\n', rCurv, d2Max, rEnd, dEnd);
out('r  |dS|  chord  weight/|dS|\n');
for t = [9.78, 12.00, 14.00, 15.70, 16.67, 17.52, 19.00]
  dHere = interp1(rsample, dAbs, t);
  wHere = interp1(rsample, w, t);
  out('%6.2f % .5e % .5e % .3f\n', t, dHere, interp1(rsample, chord, t), wHere / dHere);
end

s1 = 1.79 * 4000;
sm4 = @(q) smooth(smooth(smooth(smooth(q, s1), s1), s1), s1);
rhoU = sm4(rhoUni .* wall);
rhoU(~isfinite(rhoU) | rhoU < 0) = 0;
rhoU = rhoU * (m / trapz(rsample, 4*pi .* rhoU .* rsample.^2));
rhoS = sm4(w .* wall);
rhoS(~isfinite(rhoS) | rhoS < 0) = 0;
rhoS = rhoS * (m / trapz(rsample, 4*pi .* rhoS .* rsample.^2));
iCross = find(rsample > R1 & rhoS >= rhoU, 1, 'first');
if isempty(iCross)
  out('SKIP eval: slope density never overtakes the wall\n');
  out('sixth bend 0.06 done\n');
  fclose(fid);
  return;
end
rCross = rsample(iCross);
iFlip = find(rsample > rCross & d2S > 0 & [0; d2S(1:end-1)] <= 0, 1, 'first');
if isempty(iFlip)
  out('SKIP eval: no curvature flip past the crossing\n');
  out('sixth bend 0.06 done\n');
  fclose(fid);
  return;
end
rFlip = rsample(iFlip);
rhoB = rhoS;
rhoB(rsample < rCross) = rhoU(rsample < rCross);
Mnow = trapz(rsample, 4*pi .* rhoB .* rsample.^2);
excess = Mnow - m;
pay = rsample >= rCross & rsample < rFlip;
Mpay = trapz(rsample(pay), 4*pi .* rhoB(pay) .* rsample(pay).^2);
out('rCross=%.3f rFlip=%.3f excess/M=%.4f pay/M=%.4f\n', rCross, rFlip, excess/m, Mpay/m);
if Mpay <= excess
  out('SKIP eval: the inner curvature cannot pay for the wall foot\n');
  out('sixth bend 0.06 done\n');
  fclose(fid);
  return;
end
fPay = (Mpay - excess) / Mpay;
rhoB(pay) = rhoB(pay) * fPay;
Mend = trapz(rsample, 4*pi .* rhoB .* rsample.^2);
out('payment scale=%.4f M(end)/M before trim=%.6f\n', fPay, Mend/m);
rhoB = rhoB * (m / Mend);
[rhoPk, iPk] = max(rhoB);
marks = [2.85, 9.78, 12.00, 15.70, 17.52];
out('inner mass peak rho=%.6e at r=%.3f  peak/rhoHalf=%.3f peak/rhoUni=%.3f\n', ...
    rhoPk, rsample(iPk), rhoPk/rhoHalf, rhoPk/rhoUni);
out('r  rho/rhoHalf  rho/rhoUni\n');
for t = marks
  rt = interp1(rsample, rhoB, t);
  out('%6.2f % .4f % .4f\n', t, rt/rhoHalf, rt/rhoUni);
end
bands = [0, 8; 8, 13; 13, 18; 18, 27];
for b = 1:4
  sel = rsample >= bands(b, 1) & rsample < bands(b, 2);
  Mb = trapz(rsample(sel), 4*pi .* rhoB(sel) .* rsample(sel).^2);
  out('mass fraction %.1f-%.1f m = %.3f\n', bands(b, 1), bands(b, 2), Mb / m);
end
if rhoPk > rhoHalf
  out('SKIP eval: peak density is above the compactness-1/2 wall\n');
  out('sixth bend 0.06 done\n');
  fclose(fid);
  return;
end

Mbend = cumtrapz(rsample, 4*pi .* rhoB .* rsample.^2);
Mbend(Mbend < 0) = max(Mbend);
horizon = 1 - 2*G*Mbend ./ max(rsample, drs) / c^2;
out('M(end)/M=%.4f min(1-Rs/r)=%.4f\n', Mbend(end)/m, min(horizon));
if min(horizon) <= 0
  out('SKIP eval: enclosed mass crosses a horizon\n');
  out('sixth bend 0.06 done\n');
  fclose(fid);
  return;
end

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

Mt = ws_fast(gridSize, worldCenter, m, R1, R2, 0, 0, 4000, v, 0, gridScaling);
[I, J, K] = ndgrid(1:N, 1:N, 1:nz);
xg = I*h - worldCenter(2); yg = J*h - worldCenter(3); zg = K*h - worldCenter(4);
rrg = sqrt(xg.^2 + yg.^2 + zg.^2);
Aval = interp1(rsample, A, rrg, 'linear', -1);
Bval = interp1(rsample, B, rrg, 'linear', 1);
theta = atan2(sqrt(xg.^2 + yg.^2), zg); phi = atan2(yg, xg);
cP = cos(phi); cP(abs(phi) == pi/2) = 0;
cT = cos(theta); cT(abs(theta) == pi/2) = 0;
sT = sin(theta); sP = sin(phi);
Brad = Bval;
g22 = (Brad.*cP.^2.*sT.^2 + (cP.^2.*cT.^2)) + sP.^2;
g33 = (Brad.*sP.^2.*sT.^2 + (cT.^2.*sP.^2)) + cP.^2;
g44 = (Brad.*cT.^2 + sT.^2);
g23 = (Brad.*cP.*sP.*sT.^2 + (cP.*cT.^2.*sP) - cP.*sP);
g24 = (Brad.*cP.*cT.*sT - (cP.*cT.*sT));
g34 = (Brad.*cT.*sP.*sT - (cT.*sP.*sT));
Mt.tensor{1, 1} = reshape(Aval, gridSize);
Mt.tensor{2, 2} = reshape(g22, gridSize);
Mt.tensor{3, 3} = reshape(g33, gridSize);
Mt.tensor{4, 4} = reshape(g44, gridSize);
Mt.tensor{2, 3} = reshape(g23, gridSize); Mt.tensor{3, 2} = Mt.tensor{2, 3};
Mt.tensor{2, 4} = reshape(g24, gridSize); Mt.tensor{4, 2} = Mt.tensor{2, 4};
Mt.tensor{3, 4} = reshape(g34, gridSize); Mt.tensor{4, 3} = Mt.tensor{3, 4};
Sgrid = interp1(rsample, S, rrg, 'linear', 0);
Mt.tensor{1, 3} = reshape(zeros(size(Sgrid)), gridSize); Mt.tensor{3, 1} = Mt.tensor{1, 3};
Mt.tensor{1, 4} = reshape(zeros(size(Sgrid)), gridSize); Mt.tensor{4, 1} = Mt.tensor{1, 4};
bx = -Sgrid * 0.06;
Mt.tensor{1, 2} = reshape(bx, gridSize); Mt.tensor{2, 1} = Mt.tensor{1, 2};
gxx0 = Mt.tensor{2, 2};
gyy0 = Mt.tensor{3, 3};
gzz0 = Mt.tensor{4, 4};
g00_0 = Mt.tensor{1, 1};
ang = (yg.^2 + zg.^2) ./ max(rrg.^2, h^2);

zc = (nz + 1) / 2;
ix = 3:N-2;
[X, Y] = ndgrid(((1:N)*h - worldCenter(2)), ((1:N)*h - worldCenter(3)));
Xs = X(ix, ix); Ys = Y(ix, ix);
[~, iSide] = min(abs(Xs(:, 1)));
sideKeep = Ys(iSide, :) > 0;
sideR = sqrt(Xs(iSide, sideKeep).^2 + Ys(iSide, sideKeep).^2);
[sideR, sideOrd] = sort(sideR);
[~, iNose] = min(abs(Ys(1, :)));
noseKeep = Xs(:, iNose) > 0;
noseR = sqrt(Xs(noseKeep, iNose).^2 + Ys(noseKeep, iNose).^2);
[noseR, noseOrd] = sort(noseR);
stations = [3.00, 3.87, 6.14, 8.00, 9.78, 12.00, 14.00, 15.70, 16.14, 17.52, 18.97, 21.00, 23.92];

tic;
Et = getEnergyTensor(Mt, 0);
Ee = doFrameTransfer(Mt, Et, "Eulerian", 0);
rhoE = squeeze(Ee.tensor{1, 1}(1, ix, ix, zc));
qE = squeeze(Ee.tensor{1, 2}(1, ix, ix, zc));
xE = squeeze(Ee.tensor{2, 2}(1, ix, ix, zc));
yE = squeeze(Ee.tensor{3, 3}(1, ix, ix, zc));
pk = max(abs(rhoE(:)));
out('baseline 0.06 tensor %.1fs pk=%.4e\n', toc, pk);
rhoS = rhoE(iSide, sideKeep); rhoS = rhoS(sideOrd);
qS = qE(iSide, sideKeep); qS = qS(sideOrd);
xS = xE(iSide, sideKeep); xS = xS(sideOrd);
yS = yE(iSide, sideKeep); yS = yS(sideOrd);
faceR = zeros(size(sideR));
pos = rhoS > 1e-8 * pk;
faceR(pos) = qS(pos).^2 ./ rhoS(pos);
out('side r rho T0x Txx Tyy face\n');
for t = stations
  out('  %6.2f % .4f % .4f % .4f % .4f % .4f\n', t, ...
      interp1(sideR, rhoS, t)/pk, interp1(sideR, qS, t)/pk, ...
      interp1(sideR, xS, t)/pk, interp1(sideR, yS, t)/pk, interp1(sideR, faceR, t)/pk);
end
samp = (3:0.5:24)';
faceS = interp1(sideR, faceR, samp, 'linear', 0);
x0S = interp1(sideR, xS, samp, 'linear', 0);
[fMax, iF] = max(abs(faceS));
out('target max |face|/pk=%.4f at r=%.2f\n', fMax/pk, samp(iF));
centers = 3:1:24;
sig = 0.75;
eps = 1e-3;
out('lapse bumps. eps=%.1e sig=%.2f ncenter=%d nsamp=%d\n', eps, sig, length(centers), length(samp));
eRad = zeros(size(rsample));
daGrid = zeros(gridSize);
for pass = 1:2
  if pass == 1
    tgt = faceS;
    gRef = g00_0;
    xLip0 = interp1(sideR, xS, 16.14);
  else
    xAch = interp1(sideR, xVs, samp, 'linear', 0);
    tgt = faceS - (xAch - x0S);
    gRef = g00_0 .* exp(2 * daGrid);
    xLip0 = interp1(sideR, xVs, 16.14);
    out('residual pass. max |dTxx miss|/pk=%.4e\n', max(abs(tgt))/pk);
  end
  Mresp = zeros(length(samp), length(centers));
  for j = 1:length(centers)
    bump = exp(-((rsample - centers(j)) / sig).^2);
    bGrid = reshape(ang(:) .* interp1(rsample, bump, rrg(:), 'linear', 0), gridSize);
    Mt.tensor{1, 1} = gRef .* exp(2 * eps * bGrid);
    tic;
    Et = getEnergyTensor(Mt, 0);
    Ee = doFrameTransfer(Mt, Et, "Eulerian", 0);
    xP = squeeze(Ee.tensor{2, 2}(1, ix, ix, zc));
    xPs = xP(iSide, sideKeep); xPs = xPs(sideOrd);
    if pass == 1
      Mresp(:, j) = (interp1(sideR, xPs, samp, 'linear', 0) - x0S) / eps;
    else
      Mresp(:, j) = (interp1(sideR, xPs, samp, 'linear', 0) - xAch) / eps;
    end
    out('  pass %d bump r=%.1f lip col/pk=%.3e %.1fs\n', pass, centers(j), ...
        (interp1(sideR, xPs, 16.14) - xLip0) / eps / pk, toc);
    fflush(fid);
    clear Et Ee;
  end
  alpha = Mresp \ tgt;
  resFit = tgt - Mresp * alpha;
  out('pass %d fit miss/pk=%.4e\n', pass, max(abs(resFit))/pk);
  de = zeros(size(rsample));
  for j = 1:length(centers)
    de = de + alpha(j) * exp(-((rsample - centers(j)) / sig).^2);
  end
  eRad = eRad + de;
  out('pass %d cond=%.3e max |dda|=%.4e max |da|=%.4e\n', pass, cond(Mresp), max(abs(de)), max(abs(eRad)));
  out('r alpha_bump da\n');
  for j = 1:length(centers)
    out('  %5.1f % .4e % .4e\n', centers(j), alpha(j), interp1(rsample, eRad, centers(j)));
  end
  daGrid = reshape(ang(:) .* interp1(rsample, eRad, rrg(:), 'linear', 0), gridSize);
  daGrid(~isfinite(daGrid)) = 0;
  Mt.tensor{1, 1} = g00_0 .* exp(2 * daGrid);
  Et = getEnergyTensor(Mt, 0);
  Ee = doFrameTransfer(Mt, Et, "Eulerian", 0);
  rhoV = squeeze(Ee.tensor{1, 1}(1, ix, ix, zc));
  qV = squeeze(Ee.tensor{1, 2}(1, ix, ix, zc));
  xV = squeeze(Ee.tensor{2, 2}(1, ix, ix, zc));
  yV = squeeze(Ee.tensor{3, 3}(1, ix, ix, zc));
  pkV = max(abs(rhoV(:)));
  rhoVs = rhoV(iSide, sideKeep); rhoVs = rhoVs(sideOrd);
  qVs = qV(iSide, sideKeep); qVs = qVs(sideOrd);
  xVs = xV(iSide, sideKeep); xVs = xVs(sideOrd);
  yVs = yV(iSide, sideKeep); yVs = yVs(sideOrd);
  out('solved pass %d side r rho T0x Txx Tyy face dTxx dRho\n', pass);
  for t = stations
    out('  %6.2f % .4f % .4f % .4f % .4f % .4f % .4f % .4f\n', t, ...
        interp1(sideR, rhoVs, t)/pkV, interp1(sideR, qVs, t)/pkV, ...
        interp1(sideR, xVs, t)/pkV, interp1(sideR, yVs, t)/pkV, ...
        interp1(sideR, faceR, t)/pk, ...
        (interp1(sideR, xVs, t) - interp1(sideR, xS, t))/pk, ...
        (interp1(sideR, rhoVs, t) - interp1(sideR, rhoS, t))/pk);
  end
  clear Et Ee;
  fflush(fid);
  if max(abs(resFit)) / pk > 0.05
    out('basis cannot carry the face.\n');
    break;
  end
end
dRay = (interp1(sideR, xVs, samp, 'linear', 0) - x0S) / pk;
fRay = faceS / pk;
missPk = max(abs(dRay - fRay));
pullPk = max(0, max(-dRay - max(fRay, 0)));
out('ray miss/pk=%.4f pull/pk=%.4f max |da|=%.4e\n', missPk, pullPk, max(abs(eRad)));
if max(abs(eRad)) > 0.05 || missPk > 0.05 || pullPk > 0.02
  out('ray did not take the face. no score.\n');
  out('face lapse done\n');
  fclose(fid);
  return;
end
if observer_lmi("test") ~= 1
  error('observer self-test failed');
end
wvol = pi * abs(Ys) * h^2;
for vv = [0, 0.04, 0.06]
  scale = (vv / 0.06)^2;
  bx = -Sgrid * vv;
  Mt.tensor{1, 2} = reshape(bx, gridSize); Mt.tensor{2, 1} = Mt.tensor{1, 2};
  Mt.tensor{2, 2} = gxx0;
  Mt.tensor{3, 3} = gyy0;
  Mt.tensor{4, 4} = gzz0;
  Mt.tensor{1, 1} = g00_0 .* exp(2 * scale * daGrid);
  tic;
  W = evalMetric(Mt, 0, 1);
  gtt = @(p, q) squeeze(Mt.tensor{p, q}(1, ix, ix, zc));
  detg = gtt(2,2).*(gtt(3,3).*gtt(4,4)-gtt(3,4).^2) - gtt(2,3).*(gtt(2,3).*gtt(4,4)-gtt(3,4).*gtt(2,4)) + gtt(2,4).*(gtt(2,3).*gtt(3,4)-gtt(3,3).*gtt(2,4));
  dV = wvol .* sqrt(max(detg, 0));
  rhoE = squeeze(W.energyTensorEulerian.tensor{1,1}(1, ix, ix, zc));
  pkE = max(abs(rhoE(:)));
  Etot = sum(rhoE(:) .* dV(:));
  maps = {W.null, W.weak, W.strong, W.dominant};
  worst = zeros(1, 4); serious = zeros(1, 4);
  dom = [];
  for k = 1:4
    aa = squeeze(maps{k}(1, ix, ix, zc));
    if k == 4, dom = aa; end
    worst(k) = max(0, -min(aa(:))) / pkE;
    serious(k) = mean(aa(:) < -1e-3 * pkE);
  end
  shift = max(abs(Mt.tensor{1, 2}(:)));
  bareClean = all(worst < 1e-3) && all(serious == 0) && Etot > 0 && isfinite(pkE) && abs(shift - vv) < 1e-3;
  if bareClean, bareLab = 'CLEAN'; else, bareLab = 'FAIL'; end
  [~, lin] = min(dom(:));
  [ii, jj] = ind2sub(size(dom), lin);
  out('curv v=%.2f E=%.4e null=%.3e weak=%.3e strong=%.3e dom=%.3e ser=%.4f shift=%.3e r=%.3f %s %.1fs\n', ...
      vv, Etot/c^2, worst(1), worst(2), worst(3), worst(4), max(serious), shift, ...
      hypot(Xs(ii, jj), Ys(ii, jj)), bareLab, toc);
  qSlice = squeeze(W.energyTensorEulerian.tensor{1, 2}(1, ix, ix, zc));
  xSlice = squeeze(W.energyTensorEulerian.tensor{2, 2}(1, ix, ix, zc));
  ySlice = squeeze(W.energyTensorEulerian.tensor{3, 3}(1, ix, ix, zc));
  place = atan2(abs(Ys(ii, jj)), Xs(ii, jj)) * 180 / pi;
  out('  sample cell r=%.3f place=%.1f rho=%.4f T0x=%.4f Txx=%.4f Tyy=%.4f\n', ...
      hypot(Xs(ii, jj), Ys(ii, jj)), place, rhoE(ii, jj)/pkE, qSlice(ii, jj)/pkE, ...
      xSlice(ii, jj)/pkE, ySlice(ii, jj)/pkE);
  Te = cell(4, 4);
  for a = 1:4
    for b = 1:4
      Te{a, b} = squeeze(W.energyTensorEulerian.tensor{a, b}(1, ix, ix, zc));
    end
  end
  tic;
  Ob = observer_lmi(Te, Xs, Ys, R2, pkE);
  exactClean = Ob.qNull > -1e-3 && Ob.qWeak > -1e-3 && Ob.qStrong > -1e-3 && Ob.dec > -1e-3 && Ob.serious == 0 && Ob.nType2 == 0 && Ob.nType4 == 0 && Etot > 0 && isfinite(pkE) && abs(shift - vv) < 1e-3;
  if exactClean, elab = 'CLEAN'; else, elab = 'FAIL'; end
  out('curv v=%.2f exact qN=%.3e qW=%.3e qS=%.3e dec=%.3e ser=%.4f type1=%d type2=%d type4=%d decMiss=%d %s %.1fs\n', ...
      vv, Ob.qNull, Ob.qWeak, Ob.qStrong, Ob.dec, Ob.serious, Ob.nType1, Ob.nType2, Ob.nType4, Ob.decMiss, elab, toc);
  out('  worst null r=%.3f place=%.1f dir=%.1f dec r=%.3f place=%.1f dir=%.1f type=%d\n', ...
      Ob.rNull, Ob.pNull, Ob.aNull, Ob.rDec, Ob.pDec, Ob.aDec, Ob.tDec);
  out('  tail qN=%.3e qW=%.3e qS=%.3e dec=%.3e\n', Ob.tail.qNull, Ob.tail.qWeak, Ob.tail.qStrong, Ob.tail.dec);
  fflush(fid);
  clear Te Ob W;
end
out('face lapse done\n');
fclose(fid);
