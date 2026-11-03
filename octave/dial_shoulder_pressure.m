% Copyright 2026 Damian Arthur Palumbo
% SPDX-License-Identifier: Apache-2.0
%
% The 0.11c break is the outer wall losing its rest frame.
% The pin momentum balance sets the pressure gradient the mix flow asks for.
% Ship speed is not in that shape. This file prints the pressure.
% It does not edit ws_fast and it does not retune the mix.
FW = fileparts(mfilename('fullpath')); addpath(fileparts(FW)); setup_wf; addpath(FW);
ell = 0.8573494832025231;
mu = 0.33282440671611235;
R2 = 20;
R1 = R2 * (1 - ell);
h = 2.5 * (R2/110);
L = 150 * (R2/110);
N = round(2*L/h); nz = 5;
gridScaling = [1/(1000*c), h, h, h];
worldCenter = [1, (N+1)/2*h, (N+1)/2*h, (nz+1)/2*h];
worldSize = sqrt((N*h - worldCenter(2))^2 + (N*h - worldCenter(3))^2 + (nz*h - worldCenter(4))^2);
rsample = linspace(0, worldSize*1.2, 1e5)';
drs = rsample(2) - rsample(1);
outDir = getenv('OUT');
if isempty(outDir), error('Set OUT to a writable directory'); end
if exist(outDir, 'dir') ~= 7, mkdir(outDir); end
fid = fopen(fullfile(outDir, 'dial_shoulder_pressure.txt'), 'w');
out = @(varargin) [fprintf(varargin{:}); fprintf(fid, varargin{:})];
out('shoulder pressure. mu=%.6f ell=%.16f R2=%.3f\n', mu, ell, R2);
out('beta = mix S. Ship speed is not in the pressure.\n');

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

x = rsample / R2;
dx = x(2) - x(1);
dS = gradient(S, x);
d2S = gradient(dS, x);
rhs = mu .* d2S - S .* dS;
piF = zeros(size(S));
for i = (length(x) - 1):-1:1
  piF(i) = piF(i + 1) - rhs(i + 1) * dx;
end
piF(rsample >= R2) = 0;
s1 = 1.79 * 4000;
sm4 = @(q) smooth(smooth(smooth(smooth(q, s1), s1), s1), s1);
rho4 = sm4(rho);
rho4(~isfinite(rho4) | rho4 < 0) = 0;
rhoPk = max(rho4);
pTov = sm4(P);
pTov(~isfinite(pTov)) = 0;
pFrac = zeros(size(S));
on = rho4 > 1e-8 * rhoPk;
pFrac(on) = pTov(on) ./ (rho4(on) * c^2);
out('flow pressure fraction min=%.4f max=%.4f\n', min(piF), max(piF));
out('r  S  dSdx  rhs  piFlow  piTOV\n');
for t = [2.85, 9.78, 12.99, 15.70, 17.52, 20]
  out('%6.2f % .4f % .4e % .4e % .4f % .4f\n', t, ...
      interp1(rsample, S, t), interp1(rsample, dS, t), interp1(rsample, rhs, t), ...
      interp1(rsample, piF, t), interp1(rsample, pFrac, t));
end
out('shoulder pressure done\n');
fclose(fid);
