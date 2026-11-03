% Copyright 2026 Damian Arthur Palumbo
% SPDX-License-Identifier: Apache-2.0
%
% The mix flow, with ship speed kept out of the shape, asks for a
% pressure fraction that is tension. This lapse uses that tension
% times the shell density. Mass, mix shift, and smoothFactor stay.
% Half wall at 0, 0.10c, and 0.11c. One-sixth window at 0, 0.04c, and 0.06c.
% Does not edit ws_fast.
FW = fileparts(mfilename('fullpath')); addpath(fileparts(FW)); setup_wf; addpath(FW);
ell = 0.8573494832025231;
mu = 0.33282440671611235;
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
fid = fopen(fullfile(outDir, 'dial_tension_lapse.txt'), 'w');
out = @(varargin) [fprintf(varargin{:}); fprintf(fid, varargin{:})];
out('tension lapse. mu=%.6f ell=%.16f R2=%.3f R1=%.3f N=%d h=%.5f\n', mu, ell, R2, R1, N, h);
out('P = piFlow * rho * c^2. piFlow from the mix, ship speed not in the shape.\n');
fflush(fid);

C = 1/2;
m = C * R2 * c^2 / (2*G);
rho0 = zeros(size(rsample)) + m / (4/3*pi*(R2^3 - R1^3)) .* (rsample > R1 & rsample < R2);
M0 = cumtrapz(rsample, 4*pi .* rho0 .* rsample.^2);
P0 = TOVconstDensity(R2, M0, rho0, rsample);
iEdge = find(rsample > R1, 1, 'first');
Pedge = P0(iEdge);
Sprs = ones(size(rsample));
Sprs(rsample >= R2) = 0;
wall = rsample > R1 & rsample < R2;
Sprs(wall) = P0(wall) / Pedge;
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
x = rsample / R2;
dx = x(2) - x(1);
dSx = gradient(S, x);
d2Sx = gradient(dSx, x);
rhs = mu .* d2Sx - S .* dSx;
piF = zeros(size(S));
for i = (length(x) - 1):-1:1
  piF(i) = piF(i + 1) - rhs(i + 1) * dx;
end
piF(rsample >= R2) = 0;
out('piFlow min=%.4f max=%.4f at 9.78 m %.4f at 15.70 m %.4f\n', ...
    min(piF), max(piF), interp1(rsample, piF, 9.78), interp1(rsample, piF, 15.70));
fflush(fid);

zc = (nz + 1) / 2;
ix = 3:N-2;
[X, Y] = ndgrid(((1:N)*h - worldCenter(2)), ((1:N)*h - worldCenter(3)));
Xs = X(ix, ix);
Ys = Y(ix, ix);
wvol = pi * abs(Ys) * h^2;
[~, iSide] = min(abs(Xs(:, 1)));
sideR = hypot(Xs(iSide, :), Ys(iSide, :));

% --- half wall. Spatial metric stays the mass. Lapse uses the tension. ---
Mt0 = ws_fast(gridSize, worldCenter, m, R1, R2, 0, 0, 4000, 0, 0, gridScaling);
rV = Mt0.params.rVec(:);
rhoS = Mt0.params.rhosmooth(:);
piV = interp1(rsample, piF, rV, 'linear', 0);
Pten = piV .* rhoS * c^2;
Pten = smooth(smooth(smooth(smooth(Pten, 4000), 4000), 4000), 4000);
Pten(~isfinite(Pten)) = 0;
a = alphaNumericSolver(Mt0.params.M(:), Pten(:), R2, rV);
A = -exp(2 .* a(:));
A(~isfinite(A)) = -1;
[I, J, K] = ndgrid(1:N, 1:N, 1:nz);
rr = sqrt((I*h - worldCenter(2)).^2 + (J*h - worldCenter(3)).^2 + (K*h - worldCenter(4)).^2);
Aval = interp1(rV, A, rr, 'linear', -1);
Mt0.tensor{1, 1} = reshape(Aval, gridSize);
Sgrid = interp1(rsample, S, rr, 'linear', 0);
out('half wall g00 center=%.4f  Pten/rho c2 at 15.70 m=%.4f\n', ...
    Aval(round((N+1)/2), round((N+1)/2), zc), interp1(rV, Pten ./ max(rhoS, 1) / c^2, 15.70));
labels = {'null', 'weak', 'strong', 'dominant'};
for v = [0, 0.10, 0.11]
  Mt = Mt0;
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
  clean = all(worst < 1e-3) && all(serious == 0) && Etot > 0 && isfinite(pk) && abs(shift - v) < 1e-3;
  if clean, lab = 'CLEAN'; else, lab = 'FAIL'; end
  out('half v=%.2f E=%.4e null=%.3e weak=%.3e strong=%.3e dom=%.3e ser=%.4f shift=%.3e %s %.1fs\n', ...
      v, Etot/c^2, worst(1), worst(2), worst(3), worst(4), max(serious), shift, lab, toc);
  dom = squeeze(maps{4}(1, ix, ix, zc));
  [~, lin] = min(dom(:));
  [ii, jj] = ind2sub(size(dom), lin);
  place = atan2(abs(Ys(ii, jj)), Xs(ii, jj)) * 180/pi;
  [~, k978] = min(abs(sideR - 9.78));
  [~, k157] = min(abs(sideR - 15.70));
  out('  dominant r=%.3f place=%.1f signed=%.3e side9.78=%.3e side15.70=%.3e\n', ...
      hypot(Xs(ii, jj), Ys(ii, jj)), place, dom(ii, jj)/pk, ...
      dom(iSide, k978)/pk, dom(iSide, k157)/pk);
  fflush(fid);
  clear Mt W;
end

% --- one-sixth window. Same placement. Lapse pressure is the flow tension. ---
C = 1/6;
m = C * R2 * c^2 / (2*G);
mHalf = 0.5 * R2 * c^2 / (2*G);
rhoHalf = mHalf / (4/3*pi*(R2^3 - R1^3));
rhoUni = m / (4/3*pi*(R2^3 - R1^3));
rhoW = rhoUni .* (rsample > R1 & rsample < R2);
Mw = cumtrapz(rsample, 4*pi .* rhoW .* rsample.^2);
Pball = TOVconstDensity(R2, Mw, rhoW, rsample);
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
[~, iCurv] = max(d2S .* outer);
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
rhoSl = sm4(w .* wall);
rhoSl(~isfinite(rhoSl) | rhoSl < 0) = 0;
rhoSl = rhoSl * (m / trapz(rsample, 4*pi .* rhoSl .* rsample.^2));
iCross = find(rsample > R1 & rhoSl >= rhoU, 1, 'first');
rCross = rsample(iCross);
iFlip = find(rsample > rCross & d2S > 0 & [0; d2S(1:end-1)] <= 0, 1, 'first');
rFlip = rsample(iFlip);
rhoB = rhoSl;
rhoB(rsample < rCross) = rhoU(rsample < rCross);
Mnow = trapz(rsample, 4*pi .* rhoB .* rsample.^2);
excess = Mnow - m;
pay = rsample >= rCross & rsample < rFlip;
Mpay = trapz(rsample(pay), 4*pi .* rhoB(pay) .* rsample(pay).^2);
fPay = (Mpay - excess) / Mpay;
rhoB(pay) = rhoB(pay) * fPay;
Mend = trapz(rsample, 4*pi .* rhoB .* rsample.^2);
rhoB = rhoB * (m / Mend);
[rhoPk, ~] = max(rhoB);
out('\n-- sixth bend m=%.6e peak/rhoHalf=%.3f rSlope=%.3f pay=%.4f\n', m, rhoPk/rhoHalf, rSlope, fPay);
Mbend = cumtrapz(rsample, 4*pi .* rhoB .* rsample.^2);
Mbend(Mbend < 0) = max(Mbend);
Pten = piF .* rhoB * c^2;
Pten = sm4(Pten);
Pten(~isfinite(Pten)) = 0;
a = alphaNumericSolver(Mbend(:), Pten(:), R2, rsample(:));
B = (1 - 2*G.*Mbend./rsample/c^2).^(-1);
B(1) = 1;
B(~isfinite(B) | B <= 0) = 1;
A = -exp(2 .* a);
A(~isfinite(A)) = -1;
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
for v = [0, 0.04, 0.06]
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
  clean = all(worst < 1e-3) && all(serious == 0) && Etot > 0 && isfinite(pk) && abs(shift - v) < 1e-3;
  if clean, lab = 'CLEAN'; else, lab = 'FAIL'; end
  out('sixth v=%.2f E=%.4e null=%.3e weak=%.3e strong=%.3e dom=%.3e ser=%.4f shift=%.3e %s %.1fs\n', ...
      v, Etot/c^2, worst(1), worst(2), worst(3), worst(4), max(serious), shift, lab, toc);
  dom = squeeze(maps{4}(1, ix, ix, zc));
  [~, lin] = min(dom(:));
  [ii, jj] = ind2sub(size(dom), lin);
  place = atan2(abs(Ys(ii, jj)), Xs(ii, jj)) * 180/pi;
  out('  dominant r=%.3f place=%.1f signed=%.3e\n', hypot(Xs(ii, jj), Ys(ii, jj)), place, dom(ii, jj)/pk);
  fflush(fid);
  clear Mt W;
end
out('tension lapse done\n');
fclose(fid);
