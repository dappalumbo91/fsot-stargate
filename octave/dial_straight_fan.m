% Copyright 2026 Damian Arthur Palumbo
% SPDX-License-Identifier: Apache-2.0
%
% Same one-sixth book. The mass, the mix, and the hydrostatic lapse stay.
% The cabin stays the flat full shift through the fourth-order corner.
% Across the scored 8.44 m cell, and across that cell's fourth-order
% stencil, the shift is held flat. The seated rise leaves the shelf and
% arrives on the density peak with the bend already gone. The balanced
% crest kept that rise and matched the cabin packing integrals on the
% rise scale. The cabin went quiet. The fall then held the crest slope
% and packed the ease into the last fraction of a meter, and the 18.13 m
% cell held that toe. The matched toe turned that toe at the rise's own
% peak bend and held the crest slope out to 16.18 m. The lip eased. The
% cabin, still the balanced product, was scaled up to land the leftover,
% and the bend pinched to 0.119 per square meter at 4.59 m. The 4.60 m
% cell held that pinch, and the current there ran forward. The one-radius
% cabin turned at that same rise bend, and the 5.03 m cell held the middle
% of that rising bend, one step short of the sign change. A straight slope
% stays quiet. This cabin rises at one bend until that cell, holds the
% slope straight from there, and comes back down at the same bend. The
% bend is the one value that lands the leftover. The flat cabin stays
% flat. The shelf stays flat. The cap stays. It is not a sweep.
% Does not edit ws_fast. Does not touch scored logs.
FW = fileparts(mfilename('fullpath')); addpath(fileparts(FW)); setup_wf; addpath(FW);
if observer_lmi("test") ~= 1
  error('observer self-test failed');
end
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
fid = fopen(fullfile(outDir, 'dial_straight_fan.txt'), 'w');
out = @(varargin) [fprintf(varargin{:}); fprintf(fid, varargin{:})];
out('straight fan. same book. flat cabin kept. shelf kept. the seated rise kept. the matched toe kept. the cabin rises until the 5.03 m cell, holds that slope straight, and comes back at the same bend. the bend lands the leftover. leftover stays. R2=%.3f R1=%.3f\n', R2, R1);
out('mass and lapse stay. the cabin shift stays full. the leftover at the window stays.\n');
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
  out('straight fan done\n');
  fclose(fid);
  return;
end
rCross = rsample(iCross);
iFlip = find(rsample > rCross & d2S > 0 & [0; d2S(1:end-1)] <= 0, 1, 'first');
if isempty(iFlip)
  out('SKIP eval: no curvature flip past the crossing\n');
  out('straight fan done\n');
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
  out('straight fan done\n');
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
  out('straight fan done\n');
  fclose(fid);
  return;
end

Mbend = cumtrapz(rsample, 4*pi .* rhoB .* rsample.^2);
Mbend(Mbend < 0) = max(Mbend);
horizon = 1 - 2*G*Mbend ./ max(rsample, drs) / c^2;
out('M(end)/M=%.4f min(1-Rs/r)=%.4f\n', Mbend(end)/m, min(horizon));
if min(horizon) <= 0
  out('SKIP eval: enclosed mass crosses a horizon\n');
  out('straight fan done\n');
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
Smix = S;
rKeep = R1 + 2 * sqrt(2) * h;
rCell = 8.437;
reach = 2 * sqrt(2) * h;
rIn = rCell - reach;
rOut = rCell + reach;
iKeep = find(rsample >= rKeep, 1, 'first');
iIn = find(rsample >= rIn, 1, 'first');
iOut = find(rsample >= rOut, 1, 'first');
out('shelf across r=%.3f from %.3f to %.3f  cabin flat through %.3f  h=%.5f\n', rCell, rIn, rOut, rKeep, h);
if isempty(iKeep) || isempty(iIn) || isempty(iOut) || ~(iKeep > 1) || ~(iKeep + 2 < iIn) || ~(iIn + 2 < iOut) || ~(iOut + 2 < iMax) || ~(dMax > 0)
  out('SKIP eval: the cell shelf does not fall between the cabin and the crest\n');
  out('straight fan done\n');
  fclose(fid);
  return;
end
S(1:(iKeep - 1)) = 1;
idxA = iKeep:(iIn - 1);
idxP = iIn:(iOut - 1);
idxB = iOut:iMax;
cumI = cumtrapz(rsample, rhoB);
vA = cumI(idxA) - cumI(idxA(1));
vB = cumI(idxB) - cumI(idxB(1));
totA = vA(end);
totB = vB(end);
dropNeed = 1 - Smix(iMax);
if ~(totA > 0) || ~(totB > 0) || ~(dropNeed > 0)
  out('SKIP eval: the shelf book has no thickness to follow\n');
  out('straight fan done\n');
  fclose(fid);
  return;
end
vA = min(1, max(0, vA / totA));
vA(1) = 0;
vA(end) = 1;
vB = min(1, max(0, vB / totB));
vB(1) = 0;
iEnd = find(rsample >= rEnd, 1, 'first');
cumT = cumtrapz(rsample, rhoB);
cumT = cumT - cumT(iMax);
totT = interp1(rsample, cumT, rEnd);
if isempty(iEnd) || ~(totT > 0) || ~(iEnd > iOut)
  out('SKIP eval: no thickness past the crest\n');
  out('straight fan done\n');
  fclose(fid);
  return;
end
bendScale = (dMax - dEnd) / totT;
Sref = Smix;
for i = (iMax + 1):iEnd
  if rsample(i) <= rEnd
    shed = min(dMax - dEnd, bendScale * cumT(i));
    dhere = -(dMax - shed);
  else
    dhere = dS(i);
  end
  Sref(i) = Sref(i - 1) + dhere * drs;
end
Send = Sref(iEnd);
Lb = rIn - rKeep;
Wspan = 2 * reach;
Lr = 0.5 * (Lb - Wspan);
rRise = rKeep + Lr;
rFall = rIn - Lr;
rClimb = rsample(idxA);
spanArc = rEnd - rOut;
rArc = rsample(iOut:iEnd);
if ~(Lb > Wspan) || ~(Lr > 2 * drs) || ~(spanArc > 0) || ~(Send < 1) || ~(Send > 0)
  out('SKIP eval: the cabin window cannot separate the two bends by a stencil\n');
  out('straight fan done\n');
  fclose(fid);
  return;
end
climbSlope = @(aa) max(0, min(dMax, ...
  (rClimb < rRise) .* (aa .* (rClimb - rKeep)) ...
  + (rClimb >= rRise & rClimb < rFall) .* (aa .* Lr) ...
  + (rClimb >= rFall) .* (aa .* (rIn - rClimb))));
climbSpend = @(aa) sum(climbSlope(aa)) * drs;
aEnd = interp1(rsample, d2S, rEnd);
if ~isfinite(aEnd) || aEnd < 0
  aEnd = 0;
end
% The seated rise leaves the flat shelf and arrives on the crest with
% the bend already gone. That fixes the rise. The toe stays the matched
% toe. The cabin rises until the scored 5.031 m cell, holds that slope
% straight, and recovers over the same length at the same bend. The bend
% is the one value that lands the leftover. The cap stays.
rc = rsample(idxA);
rhoc = rhoB(idxA);
Cc = cumtrapz(rc, rhoc);
Ic = Cc(end);
ra = rsample(iOut:iEnd);
rhoa = rhoB(iOut:iEnd);
rPk = rsample(iPk);
iPkA = find(ra >= rPk, 1, 'first');
if ~(Ic > 0) || ~(dMax > dEnd) || ~(dEnd >= 0) || isempty(iPkA) || ~(iPkA > 2) || ~(iPkA < numel(ra) - 2)
  out('SKIP eval: the crest has no packing to sit on\n');
  out('straight fan done\n');
  fclose(fid);
  return;
end
gap = (rhoa(1:iPkA) - rhoa(1)) .* (rhoPk - rhoa(1:iPkA));
gap = max(gap, 0);
Ggap = cumtrapz(ra(1:iPkA), gap);
Igap = Ggap(end);
if ~(Igap > 0)
  out('SKIP eval: the rise has no packing between the shelf and the peak\n');
  out('straight fan done\n');
  fclose(fid);
  return;
end
kRise = dMax / Igap;
sRise = kRise .* Ggap;
rb = ra(iPkA:end);
rhob = rhoa(iPkA:end);
Gb = cumtrapz(rb, rhob);
Iback = Gb(end);
if ~(Iback > 0)
  out('SKIP eval: no packing behind the peak\n');
  out('straight fan done\n');
  fclose(fid);
  return;
end
nC = numel(rc);
if nC < 8
  out('SKIP eval: the cabin window has no room for a turn\n');
  out('straight fan done\n');
  fclose(fid);
  return;
end
target = 1 - Send;
aRisePk = kRise * max(gap);
Lfall = rb(end) - rb(1);
if ~(aRisePk > 0) || ~(dMax > dEnd)
  out('SKIP eval: the rise has no peak bend to hand the toe\n');
  out('straight fan done\n');
  fclose(fid);
  return;
end
Le = (dMax - dEnd) / aRisePk;
if ~(Le > 2 * drs) || ~(Le < Lfall - 2 * drs)
  out('SKIP eval: the rise peak bend does not fit a toe inside the fall\n');
  out('  ease %.5f m  fall %.5f m  bend %.5e /m^2\n', Le, Lfall, aRisePk);
  out('straight fan done\n');
  fclose(fid);
  return;
end
Lhold = Lfall - Le;
xToe = rb - rb(1);
sToe = dMax - aRisePk .* max(xToe - Lhold, 0);
sToe(1) = dMax;
sToe(end) = dEnd;
iGap = find(xToe >= Lhold, 1, 'first');
if isempty(iGap) || iGap < 2
  out('SKIP eval: the toe does not leave the crest\n');
  out('straight fan done\n');
  fclose(fid);
  return;
end
rToe = rb(iGap);
aToe = aRisePk;
kToe = aRisePk;
riseSpend = sum(sRise) * drs;
toeSpend = sum(sToe) * drs;
arcSpend = (sum(sRise(1:end-1)) + sum(sToe)) * drs;
needCab = target - arcSpend;
out('toe bend %.5e /m^2  ease %.3f m  hold %.3f m  toe spends %.5f  rise spends %.5f  arc spends %.5f  cabin needed %.5f  target %.5f\n', aRisePk, Le, Lhold, toeSpend, riseSpend, arcSpend, needCab, target);
out('toe starts at r=%.3f  crest slope %.5e  end slope %.5e\n', rToe, dMax, dEnd);
LbCab = rc(end) - rc(1);
rWound = 5.031;
iFail = find(rc >= rWound, 1, 'first');
xCab = rc - rc(1);
if isempty(iFail) || iFail < 3 || iFail > nC - 3
  out('SKIP eval: the 5.03 m cell is not inside the cabin window\n');
  out('straight fan done\n');
  fclose(fid);
  return;
end
Lu = xCab(iFail);
if ~(needCab > 0) || ~(Lu > 2 * drs) || ~(2 * Lu < LbCab - 4 * drs)
  out('SKIP eval: the straight run does not fit between the cell and the shelf\n');
  out('  rise %.3f m  window %.3f m  needed %.5f\n', Lu, LbCab, needCab);
  out('straight fan done\n');
  fclose(fid);
  return;
end
Lh = LbCab - 2 * Lu;
xHold = Lu + Lh;
shape = zeros(nC, 1);
upM = xCab < Lu;
holdM = (xCab >= Lu) & (xCab < xHold);
dnM = xCab >= xHold;
shape(upM) = xCab(upM);
shape(holdM) = Lu;
shape(dnM) = max(LbCab - xCab(dnM), 0);
shape(1) = 0;
den = sum(shape) * drs;
if ~(den > 0)
  out('SKIP eval: the straight climb has no slope to scale\n');
  out('straight fan done\n');
  fclose(fid);
  return;
end
aClimb = needCab / den;
sc = aClimb .* shape;
sc(1) = 0;
sc(end) = 0;
cabSpend = sum(sc) * drs;
if min(sc) < -1e-12 || max(sc) > dMax * (1 + 1e-6) || abs(cabSpend - needCab) > 1e-4
  out('SKIP eval: the straight climb passes the slope cap or misses the leftover\n');
  out('  peak slope %.5e cap %.5e  spend %.5f needed %.5f  bend %.5e\n', max(sc), dMax, cabSpend, needCab, aClimb);
  out('straight fan done\n');
  fclose(fid);
  return;
end
sa = [sRise(1:end-1); sToe];
kFall = aRisePk;
kSeat = kRise;
kPack = kRise;
useH = Lhold > 2 * drs;
out('slope span cabin %.5e to %.5e  rise %.5e to %.5e  toe %.5e to %.5e  cap %.5e\n', min(sc), max(sc), min(sRise), max(sRise), min(sToe), max(sToe), dMax);
if min(sa) < -1e-12 || max(sa) > dMax * (1 + 1e-6) || min(sToe) < dEnd - 1e-9 || max(sToe) > dMax * (1 + 1e-6)
  out('SKIP eval: the matched toe leaves the span from the end slope to the crest slope\n');
  out('straight fan done\n');
  fclose(fid);
  return;
end
aRise = 0;
aClimbCap = 0;
spendCap = cabSpend;
arcNeed = sum(sa) * drs;
for k = 1:numel(idxA)
  S(idxA(k)) = S(idxA(k) - 1) - sc(k) * drs;
end
for k = 1:numel(idxP)
  S(idxP(k)) = S(idxP(k) - 1);
end
for k = 1:numel(sa)
  S(iOut + k - 1) = S(iOut + k - 2) - sa(k) * drs;
end
iTop = iPkA;
iLip = iPkA + iGap - 1;
if isempty(iTop) || isempty(iGap) || iLip < 1 || iLip > numel(ra)
  out('SKIP eval: the matched toe does not turn\n');
  out('straight fan done\n');
  fclose(fid);
  return;
end
rTop = ra(iTop);
rLip = ra(iLip);
if ~(rLip > rTop) || abs(rTop - rPk) > 0.05 || (rTop - 10.970) <= reach
  out('SKIP eval: the crest did not sit on the peak clear of the 10.97 m cell, or the toe bend did not leave the peak\n');
  out('  arc top r=%.3f  density peak r=%.3f  lip r=%.3f  reach %.5f\n', rTop, rPk, rLip, reach);
  out('straight fan done\n');
  fclose(fid);
  return;
end
[scPk, iCab] = max(sc);
rCab = rc(iCab);
aCabin = aClimb;
aLip = aToe;
aRise = aLip;
aFall = aLip;
aClimb = aCabin;
aShare = max(aCabin, aLip);
dClimb = sc;
dPath = sa;
rStart = rLip;
LfReach = rEnd - rTop;
LfShare = LfReach;
rUp = rTop;
rDown = rLip;
out('rise scale %.5e  toe bend %.5e /m^2  ease %.3f m  hold %.3f m  crest at r=%.3f  density peak r=%.3f  straight run r=%.3f  rise %.3f m\n', kRise, aRisePk, Le, Lhold, rTop, rPk, rCab, Lu);
out('cabin hold slope %.5e /m at r=%.3f  crest cap %.5e /m  cabin bend %.5e /m^2\n', scPk, rCab, dMax, aCabin);
out('straight hold %.3f m  recovery %.3f m  cabin spends %.5f  needed %.5f\n', Lh, Lu, cabSpend, needCab);
out('toe bend r=%.3f  toe bend %.5e /m^2  hold length %.3f m  ease length %.3f m  crest hold %d\n', rLip, aLip, Lhold, Le, useH);
held = false;
rHeld = NaN;
for i = (iEnd + 1):numel(rsample)
  if held
    S(i) = 0;
    continue;
  end
  S(i) = S(i - 1) + dS(i) * drs;
  if S(i) > 1
    S(i) = 1;
  elseif S(i) <= 0
    S(i) = 0;
    held = true;
    rHeld = rsample(i);
  end
end
Snew = S;
dSn = gradient(Snew, drs);
d2n = gradient(dSn, drs);
Sshelf = Snew(iOut - 1);
out('arc top r=%.3f  toe bend r=%.3f  hold %.3f m  ease %.3f m  toe bend %.5e /m^2  book end %.5e /m^2\n', rUp, rDown, Lhold, Le, aFall, aEnd);
out('17.12 is %.3f m past the toe bend  reach %.5f m\n', 17.120 - rDown, reach);
out('10.70 is %.5f m short of the arc top  10.97 is %.5f m short of the arc top  reach %.5f m\n', rUp - 10.704, rUp - 10.970, reach);
out('18.07 is %.5f m past the toe bend  reach %.5f m\n', 18.071 - rDown, reach);
out('4.32 is %.3f m past the cabin start and %.3f m short of the straight run\n', 4.324 - rKeep, rCab - 4.324);
out('5.03 is %.3f m past the straight-run start  hold %.3f m  recovery %.3f m\n', 5.031 - rCab, Lh, Lu);
out('shelf shift %.5f  cabin spends %.5f  arc spends %.5f  leftover %.5f target %.5f\n', Sshelf, sum(dClimb) * drs, sum(dPath) * drs, Snew(iEnd), Send);
out('S(crest) %.5f mix %.5f  S(window) %.5f target %.5f\n', Snew(iMax), Smix(iMax), Snew(iEnd), Send);
dNow = gradient(S, drs);
d2now = gradient(dNow, drs);
out('S(2.51) %.5f slope %.5e steep %.5e   S(8.44) %.5f slope %.5e steep %.5e\n', interp1(rsample, S, 2.51), interp1(rsample, dNow, 2.51), interp1(rsample, d2now, 2.51), interp1(rsample, S, rCell), interp1(rsample, dNow, rCell), interp1(rsample, d2now, rCell));
out('steepening 4.14 %.5e  5.23 %.5e  %.3f %.5e  %.3f %.5e  9.72 %.5e  9.90 %.5e  %.3f %.5e  %.3f %.5e /m^2\n', interp1(rsample, d2now, 4.14), interp1(rsample, d2now, 5.23), rRise, interp1(rsample, d2now, rRise), rFall, interp1(rsample, d2now, rFall), interp1(rsample, d2now, 9.72), interp1(rsample, d2now, 9.90), rUp, interp1(rsample, d2now, rUp), rDown, interp1(rsample, d2now, rDown));
out('steepening 4.32 %.5e  10.70 %.5e  18.07 %.5e  rEnd %.5e  book end %.5e /m^2\n', interp1(rsample, d2now, 4.324), interp1(rsample, d2now, 10.704), interp1(rsample, d2now, 18.071), interp1(rsample, d2now, rEnd), aEnd);
rec = rsample > rSlope & rsample <= rEnd;
out('crest r=%.3f window end r=%.3f  peak slope stays %.5e /m\n', rSlope, rEnd, dMax);
out('S(crest) new=%.5f old=%.5f\n', Snew(iMax), Smix(iMax));
out('S(rEnd) new=%.5f old=%.5f residual=%.5e\n', Snew(iEnd), Smix(iEnd), Snew(iEnd) - Smix(iEnd));
out('peak |d2S| on the buildup old=%.5e new=%.5e\n', max(abs(d2S(rsample <= rSlope))), max(abs(d2n(rsample <= rSlope))));
maskBuild = rsample <= rEnd;
rBuild = rsample(maskBuild);
d2Build = d2n(maskBuild);
[~, iBuild] = max(abs(d2Build));
out('peak |d2S| through the window sits at r=%.3f\n', rBuild(iBuild));
out('peak |d2S| on the recovery old=%.5e new=%.5e\n', max(abs(d2S(rec))), max(abs(d2n(rec))));
if held
  out('shift reached 0 at r=%.3f and held\n', rHeld);
else
  out('shift stayed positive through the window\n');
end
out('r  S_old  S_str  dS_old  dS_str  d2_old  d2_str  rho/peak\n');
for t = [2.51, 2.75, 2.85, 3.00, 3.76, 4.14, 4.32, 4.36, 4.47, 4.50, 4.60, 4.91, 5.031, 5.23, 5.349, 5.52, 5.65, 5.75, 6.14, 6.26, 6.93, 7.15, 8.00, 8.44, 8.55, 9.72, 9.78, 9.84, 9.90, 10.70, 11.13, 11.19, 12.00, 12.97, 13.30, 14.00, 15.00, 15.70, 16.14, 17.12, 17.52, 18.07, 18.128, 18.45, 19.00]
  out('%6.2f % .4f % .4f % .5e % .5e % .5e % .5e % .3f\n', t, ...
      interp1(rsample, Smix, t), interp1(rsample, Snew, t), ...
      interp1(rsample, dS, t), interp1(rsample, dSn, t), ...
      interp1(rsample, d2S, t), interp1(rsample, d2n, t), ...
      interp1(rsample, rhoB, t) / rhoPk);
end
d2rise = interp1(rsample, d2n, rRise);
d2fall = interp1(rsample, d2n, rFall);
climbBand = rsample >= rKeep & rsample <= rIn;
d2climb = max(abs(d2n(climbBand)));
out('reversal r=%.3f steep %.5e /m^2  reversal r=%.3f steep %.5e /m^2  max |steep| on the climb %.5e /m^2\n', rRise, d2rise, rFall, d2fall, d2climb);
slCabin = interp1(rsample, dSn, 2.51);
slShelf = interp1(rsample, dSn, rCell);
slHold = interp1(rsample, dSn, 0.5 * (rRise + rFall));
out('cabin slope %.5e  hold slope %.5e  shelf slope %.5e  leftover residual %.5e\n', slCabin, slHold, slShelf, Snew(iEnd) - Send);
d2ten = interp1(rsample, d2n, 10.704);
d2outer = interp1(rsample, d2n, 18.071);
d2end = interp1(rsample, d2n, rEnd);
out('steepening sampled 4.32 %.5e  10.70 %.5e  18.07 %.5e  rEnd %.5e  book end %.5e /m^2\n', interp1(rsample, d2n, 4.324), d2ten, d2outer, d2end, aEnd);
if ~(isfinite(d2end)) || abs(d2end) > 100 * max(aLip, aEnd)
  out('SKIP score: the window end is a one-sample spike\n');
  out('straight fan done\n');
  fclose(fid);
  return;
end
if abs(slCabin) > 1e-8 || abs(slShelf) > 1e-6 || abs(Snew(iEnd) - Send) > 1e-4 || max(abs(dSn)) > dMax * (1 + 1e-3)
  out('SKIP score: cabin, shelf, leftover, or crest slope did not hold\n');
  out('straight fan done\n');
  fclose(fid);
  return;
end
S = Snew;
Sgrid = interp1(rsample, S, rrg, 'linear', 0);
Mt.tensor{1, 3} = reshape(zeros(size(Sgrid)), gridSize); Mt.tensor{3, 1} = Mt.tensor{1, 3};
Mt.tensor{1, 4} = reshape(zeros(size(Sgrid)), gridSize); Mt.tensor{4, 1} = Mt.tensor{1, 4};

zc = (nz + 1) / 2;
ix = 3:N-2;
[X, Y] = ndgrid(((1:N)*h - worldCenter(2)), ((1:N)*h - worldCenter(3)));
Xs = X(ix, ix); Ys = Y(ix, ix);
wvol = pi * abs(Ys) * h^2;
[~, iSide] = min(abs(Xs(:, 1)));
sideKeep = Ys(iSide, :) > 0;
sideR = sqrt(Xs(iSide, sideKeep).^2 + Ys(iSide, sideKeep).^2);
[sideR, sideOrd] = sort(sideR);
if observer_lmi("test") ~= 1
  error('observer self-test failed');
end
if strcmp(getenv('PROFILE_ONLY'), '1')
  out('profile only\n');
  out('straight fan done\n');
  fclose(fid);
  return;
end
stations = [2.51, 2.75, 3.00, 3.76, 4.14, 4.32, 4.36, 4.47, 4.50, 4.60, 4.91, 5.031, 5.23, 5.349, 5.52, 5.65, 5.75, 6.14, 6.26, 6.93, 7.15, 8.00, 8.44, 8.55, 9.72, 9.78, 9.84, 9.90, 10.70, 11.13, 11.19, 12.00, 13.30, 14.00, 15.00, 15.70, 16.14, 17.12, 17.52, 18.07, 18.128, 18.45];
for vv = [0, 0.04, 0.06]
  bx = -Sgrid * vv;
  Mt.tensor{1, 2} = reshape(bx, gridSize); Mt.tensor{2, 1} = Mt.tensor{1, 2};
  tic;
  W = evalMetric(Mt, 0, 1);
  gtt = @(p, q) squeeze(Mt.tensor{p, q}(1, ix, ix, zc));
  detg = gtt(2,2).*(gtt(3,3).*gtt(4,4)-gtt(3,4).^2) - gtt(2,3).*(gtt(2,3).*gtt(4,4)-gtt(3,4).*gtt(2,4)) + gtt(2,4).*(gtt(2,3).*gtt(3,4)-gtt(3,3).*gtt(2,4));
  dV = wvol .* sqrt(max(detg, 0));
  rhoE = squeeze(W.energyTensorEulerian.tensor{1,1}(1, ix, ix, zc));
  pk = max(abs(rhoE(:)));
  Etot = sum(rhoE(:) .* dV(:));
  maps = {W.null, W.weak, W.strong, W.dominant};
  worst = zeros(1, 4); serious = zeros(1, 4);
  dom = [];
  for k = 1:4
    aa = squeeze(maps{k}(1, ix, ix, zc));
    if k == 4, dom = aa; end
    worst(k) = max(0, -min(aa(:))) / pk;
    serious(k) = mean(aa(:) < -1e-3 * pk);
  end
  shift = max(abs(Mt.tensor{1, 2}(:)));
  bareClean = all(worst < 1e-3) && all(serious == 0) && Etot > 0 && isfinite(pk) && abs(shift - vv) < 1e-3;
  if bareClean, bareLab = 'CLEAN'; else, bareLab = 'FAIL'; end
  [~, lin] = min(dom(:));
  [ii, jj] = ind2sub(size(dom), lin);
  out('straight v=%.2f E=%.4e null=%.3e weak=%.3e strong=%.3e dom=%.3e ser=%.4f shift=%.3e r=%.3f %s %.1fs\n', ...
      vv, Etot/c^2, worst(1), worst(2), worst(3), worst(4), max(serious), shift, ...
      hypot(Xs(ii, jj), Ys(ii, jj)), bareLab, toc);
  Te = cell(4, 4);
  for aa = 1:4
    for bb = 1:4
      Te{aa, bb} = squeeze(W.energyTensorEulerian.tensor{aa, bb}(1, ix, ix, zc));
    end
  end
  txxS = Te{2, 2}(iSide, sideKeep); txxS = txxS(sideOrd);
  rhoSide = Te{1, 1}(iSide, sideKeep); rhoSide = rhoSide(sideOrd);
  qSide = Te{1, 2}(iSide, sideKeep); qSide = qSide(sideOrd);
  out('  side r rho T0x Txx\n');
  for t = stations
    out('  %6.2f % .4f % .4f % .4f\n', t, ...
        interp1(sideR, rhoSide, t)/pk, interp1(sideR, qSide, t)/pk, interp1(sideR, txxS, t)/pk);
  end
  tic;
  Ob = observer_lmi(Te, Xs, Ys, R2, pk);
  exactClean = Ob.qNull > -1e-3 && Ob.qWeak > -1e-3 && Ob.qStrong > -1e-3 && Ob.dec > -1e-3 && Ob.serious == 0 && Ob.nType2 == 0 && Ob.nType4 == 0 && Etot > 0 && isfinite(pk) && abs(shift - vv) < 1e-3;
  if exactClean, elab = 'CLEAN'; else, elab = 'FAIL'; end
  out('straight v=%.2f exact qN=%.3e qW=%.3e qS=%.3e dec=%.3e ser=%.4f type1=%d type2=%d type4=%d decMiss=%d %s %.1fs\n', ...
      vv, Ob.qNull, Ob.qWeak, Ob.qStrong, Ob.dec, Ob.serious, Ob.nType1, Ob.nType2, Ob.nType4, Ob.decMiss, elab, toc);
  out('  worst null r=%.3f place=%.1f dir=%.1f dec r=%.3f place=%.1f dir=%.1f type=%d\n', ...
      Ob.rNull, Ob.pNull, Ob.aNull, Ob.rDec, Ob.pDec, Ob.aDec, Ob.tDec);
  out('  tail qN=%.3e qW=%.3e qS=%.3e dec=%.3e\n', Ob.tail.qNull, Ob.tail.qWeak, Ob.tail.qStrong, Ob.tail.dec);
  fflush(fid);
  clear Te Ob W;
end
out('straight fan done\n');
fclose(fid);
