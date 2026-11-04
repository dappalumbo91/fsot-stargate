% Copyright 2026 Damian Arthur Palumbo
% SPDX-License-Identifier: Apache-2.0
%
% Same one-sixth book. The mass, the mix, and the hydrostatic lapse stay.
% The cabin stays the flat full shift through the fourth-order corner.
% Across the scored 8.44 m cell, and across that cell's fourth-order
% stencil, the shift is held flat. The climb off the cabin stays the
% spanned climb: one steepening, a hold of one stencil, and the same
% steepening back down. The two reversals stay a stencil apart. The
% climb off the shelf rises and holds as an even arc at that same
% steepening. On the return, the steepening eases in an even line from
% that shared value onto the book's own outer bend, and the slope lands
% on the book's own end slope. That one steepening is the crossing of
% the two, not a sweep. The leftover at the window end stays the slack
% leftover.
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
fid = fopen(fullfile(outDir, 'dial_taper_fan.txt'), 'w');
out = @(varargin) [fprintf(varargin{:}); fprintf(fid, varargin{:})];
out('taper fan. same book. flat cabin kept. shelf kept. the climb stays split across one stencil. the arc rise and hold stay even. the fall steepening eases from the shared value onto the book''s own outer bend. leftover stays. R2=%.3f R1=%.3f\n', R2, R1);
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
  out('taper fan done\n');
  fclose(fid);
  return;
end
rCross = rsample(iCross);
iFlip = find(rsample > rCross & d2S > 0 & [0; d2S(1:end-1)] <= 0, 1, 'first');
if isempty(iFlip)
  out('SKIP eval: no curvature flip past the crossing\n');
  out('taper fan done\n');
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
  out('taper fan done\n');
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
  out('taper fan done\n');
  fclose(fid);
  return;
end

Mbend = cumtrapz(rsample, 4*pi .* rhoB .* rsample.^2);
Mbend(Mbend < 0) = max(Mbend);
horizon = 1 - 2*G*Mbend ./ max(rsample, drs) / c^2;
out('M(end)/M=%.4f min(1-Rs/r)=%.4f\n', Mbend(end)/m, min(horizon));
if min(horizon) <= 0
  out('SKIP eval: enclosed mass crosses a horizon\n');
  out('taper fan done\n');
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
  out('taper fan done\n');
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
  out('taper fan done\n');
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
  out('taper fan done\n');
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
  out('taper fan done\n');
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
fitLen = @(aa) (dMax ./ aa) + 2 .* (dMax - dEnd) ./ (aa + aEnd);
aFloor = max(aEnd, 1e-4);
aCap = dMax / Lr;
aTop = dMax / drs;
if ~(aTop > aFloor) || ~(fitLen(aTop) <= spanArc)
  out('SKIP eval: the tapered fall does not fit the window\n');
  out('taper fan done\n');
  fclose(fid);
  return;
end
loF = aFloor;
hiF = aTop;
if fitLen(loF) <= spanArc
  aMinFit = loF;
else
  for it = 1:60
    mid = 0.5 * (loF + hiF);
    if fitLen(mid) <= spanArc
      hiF = mid;
    else
      loF = mid;
    end
  end
  aMinFit = hiF;
end
out('book outer bend %.5e /m^2  shortest taper %.5e /m^2  fit %.3f m in %.3f m\n', aEnd, aMinFit, fitLen(aMinFit), spanArc);
% Rise and hold stay an even arc. On the fall the steepening of the
% slope magnitude eases in a straight line from aa down to aEnd, so the
% slope lands on dEnd and the bend does not jump at the window end.
arcSlope = @(aa) (((dMax ./ aa) + 2 .* (dMax - dEnd) ./ (aa + aEnd) <= spanArc + 1e-6) .* min(dMax, max(0, ...
  (rArc < rOut + dMax ./ aa) .* (aa .* (rArc - rOut)) ...
  + (rArc >= rOut + dMax ./ aa & rArc < rEnd - 2 .* (dMax - dEnd) ./ (aa + aEnd)) .* dMax ...
  + (rArc >= rEnd - 2 .* (dMax - dEnd) ./ (aa + aEnd)) .* ( ...
      dMax - aa .* (rArc - (rEnd - 2 .* (dMax - dEnd) ./ (aa + aEnd))) ...
      - (aEnd - aa) .* (rArc - (rEnd - 2 .* (dMax - dEnd) ./ (aa + aEnd))).^2 ...
      ./ (4 .* (dMax - dEnd) ./ (aa + aEnd)) ))));
arcSpend = @(aa) sum(arcSlope(aa)) * drs;
if ~(aMinFit > 0) || ~(aCap > aMinFit) || ~(aTop > aMinFit)
  out('SKIP eval: the shared steepening has no room under the crest slope\n');
  out('taper fan done\n');
  fclose(fid);
  return;
end
aLo = aMinFit;
aHi = min(aCap, aTop);
if 1 - climbSpend(aHi) - Send < arcSpend(aMinFit)
  loB = aMinFit;
  hiB = aHi;
  for it = 1:60
    mid = 0.5 * (loB + hiB);
    if 1 - climbSpend(mid) - Send > arcSpend(aMinFit)
      loB = mid;
    else
      hiB = mid;
    end
  end
  aHi = loB;
end
aArcLo = NaN;
aArcHi = NaN;
for pass = 1:2
  if pass == 1
    aa = aLo;
  else
    aa = aHi;
  end
  dropC = 1 - climbSpend(aa) - Send;
  got = NaN;
  if dropC > 0 && arcSpend(aMinFit) <= dropC && arcSpend(aTop) >= dropC
    lo = aMinFit;
    hi = aTop;
    for it = 1:60
      mid = 0.5 * (lo + hi);
      if arcSpend(mid) < dropC
        lo = mid;
      else
        hi = mid;
      end
    end
    got = 0.5 * (lo + hi);
  end
  if pass == 1
    aArcLo = got;
  else
    aArcHi = got;
  end
end
out('cabin window %.3f m  stencil hold %.3f m  rise %.3f m  reversals r=%.3f and r=%.3f  leftover target %.5f\n', Lb, Wspan, Lr, rRise, rFall, Send);
out('at the shortest taper %.5e the arc wants %.5e  at the top of the bracket %.5e the arc wants %.5e\n', aMinFit, aArcLo, aHi, aArcHi);
if ~(aArcLo > aMinFit) || ~(aArcHi < aHi)
  out('SKIP eval: no shared steepening lands the leftover inside the crest slope\n');
  out('taper fan done\n');
  fclose(fid);
  return;
end
for it = 1:60
  aa = 0.5 * (aLo + aHi);
  dropC = 1 - climbSpend(aa) - Send;
  if ~(dropC > 0) || arcSpend(aMinFit) > dropC || arcSpend(aTop) < dropC
    out('SKIP eval: the shared steepening left the arc range\n');
    out('taper fan done\n');
    fclose(fid);
    return;
  end
  lo = aMinFit;
  hi = aTop;
  for jt = 1:60
    mid = 0.5 * (lo + hi);
    if arcSpend(mid) < dropC
      lo = mid;
    else
      hi = mid;
    end
  end
  got = 0.5 * (lo + hi);
  if got > aa
    aLo = aa;
  else
    aHi = aa;
  end
end
aShare = 0.5 * (aLo + aHi);
dropC = 1 - climbSpend(aShare) - Send;
lo = aMinFit;
hi = aTop;
for jt = 1:60
  mid = 0.5 * (lo + hi);
  if arcSpend(mid) < dropC
    lo = mid;
  else
    hi = mid;
  end
end
aArc = 0.5 * (lo + hi);
dClimb = climbSlope(aShare);
dPath = arcSlope(aShare);
if ~(isfinite(aShare)) || ~(isfinite(aArc)) || abs(aArc - aShare) > 1e-6
  out('SKIP eval: the cabin climb and the arc did not meet\n');
  out('taper fan done\n');
  fclose(fid);
  return;
end
if min(dClimb) < -1e-12 || max(dClimb) > dMax * (1 + 1e-8) || min(dPath) < -1e-12 || max(dPath) > dMax * (1 + 1e-6)
  out('SKIP eval: the shared bend leaves the taper from zero slope to the crest slope\n');
  out('taper fan done\n');
  fclose(fid);
  return;
end
for k = 1:numel(idxA)
  S(idxA(k)) = S(idxA(k) - 1) - dClimb(k) * drs;
end
for k = 1:numel(idxP)
  S(idxP(k)) = S(idxP(k) - 1);
end
for k = 1:numel(dPath)
  S(iOut + k - 1) = S(iOut + k - 2) - dPath(k) * drs;
end
LfShare = 2 * (dMax - dEnd) / (aShare + aEnd);
rUp = rOut + dMax / aShare;
rDown = rEnd - LfShare;
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
out('shared steepening %.5e /m^2  arc bisection %.5e /m^2  climb peak %.5e /m  crest cap %.5e /m\n', aShare, aArc, max(dClimb), dMax);
out('arc rise ends r=%.3f  arc hold ends r=%.3f  fall length %.3f m  fall eases from %.5e to %.5e /m^2\n', rUp, rDown, LfShare, aShare, aEnd);
out('18.07 sits %.3f m past the fall start  reach %.3f m  climb reversals r=%.3f and r=%.3f\n', 18.071 - rDown, reach, rRise, rFall);
out('shelf shift %.5f  climb spends %.5f  arc spends %.5f  leftover %.5f target %.5f\n', Sshelf, sum(dClimb) * drs, sum(dPath) * drs, Snew(iEnd), Send);
out('S(crest) %.5f mix %.5f  S(window) %.5f target %.5f\n', Snew(iMax), Smix(iMax), Snew(iEnd), Send);
dNow = gradient(S, drs);
d2now = gradient(dNow, drs);
out('S(2.51) %.5f slope %.5e steep %.5e   S(8.44) %.5f slope %.5e steep %.5e\n', interp1(rsample, S, 2.51), interp1(rsample, dNow, 2.51), interp1(rsample, d2now, 2.51), interp1(rsample, S, rCell), interp1(rsample, dNow, rCell), interp1(rsample, d2now, rCell));
out('steepening 4.14 %.5e  5.23 %.5e  %.3f %.5e  %.3f %.5e  9.72 %.5e  9.90 %.5e  %.3f %.5e  %.3f %.5e /m^2\n', interp1(rsample, d2now, 4.14), interp1(rsample, d2now, 5.23), rRise, interp1(rsample, d2now, rRise), rFall, interp1(rsample, d2now, rFall), interp1(rsample, d2now, 9.72), interp1(rsample, d2now, 9.90), rUp, interp1(rsample, d2now, rUp), rDown, interp1(rsample, d2now, rDown));
out('steepening 18.07 %.5e  rEnd %.5e  book end %.5e /m^2\n', interp1(rsample, d2now, 18.071), interp1(rsample, d2now, rEnd), aEnd);
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
out('r  S_old  S_taper  dS_old  dS_taper  d2_old  d2_taper  rho/peak\n');
for t = [2.51, 2.75, 2.85, 3.00, 3.76, 4.14, 4.36, 4.47, 4.50, 4.91, 5.23, 5.65, 5.75, 6.14, 6.93, 7.15, 8.00, 8.44, 8.55, 9.72, 9.78, 9.84, 9.90, 11.13, 11.19, 12.00, 12.97, 13.30, 14.00, 15.00, 15.70, 16.14, 17.52, 18.07, 18.45, 19.00]
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
if abs(d2rise) > 10 * aShare || abs(d2fall) > 10 * aShare || d2climb > 10 * aShare
  out('SKIP score: a climb reversal is a one-sample spike\n');
  out('taper fan done\n');
  fclose(fid);
  return;
end
if abs(slCabin) > 1e-8 || abs(slShelf) > 1e-6 || abs(Snew(iEnd) - Send) > 1e-4 || max(abs(dSn)) > dMax * (1 + 1e-4)
  out('SKIP score: cabin, shelf, leftover, or crest slope did not hold\n');
  out('taper fan done\n');
  fclose(fid);
  return;
end
d2cell = interp1(rsample, d2n, 18.071);
d2end = interp1(rsample, d2n, rEnd);
if ~(isfinite(d2cell)) || ~(isfinite(d2end)) || abs(d2end - aEnd) > 10 * aShare || abs(d2end) > 10 * aShare
  out('SKIP score: the window end is a one-sample spike\n');
  out('taper fan done\n');
  fclose(fid);
  return;
end
if 18.071 - rDown <= reach
  out('SKIP score: the 18.07 m cell still reaches the start of the fall\n');
  out('taper fan done\n');
  fclose(fid);
  return;
end
if abs(d2cell) > 0.5 * aShare
  out('SKIP score: the 18.07 m cell still sits on the full shared steepening\n');
  out('taper fan done\n');
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
  out('taper fan done\n');
  fclose(fid);
  return;
end
stations = [2.51, 2.75, 3.00, 3.76, 4.14, 4.36, 4.47, 4.50, 4.91, 5.23, 5.65, 5.75, 6.14, 6.93, 7.15, 8.00, 8.44, 8.55, 9.72, 9.78, 9.84, 9.90, 11.13, 11.19, 12.00, 13.30, 14.00, 15.00, 15.70, 16.14, 17.52, 18.07, 18.45];
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
  out('taper v=%.2f E=%.4e null=%.3e weak=%.3e strong=%.3e dom=%.3e ser=%.4f shift=%.3e r=%.3f %s %.1fs\n', ...
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
  out('taper v=%.2f exact qN=%.3e qW=%.3e qS=%.3e dec=%.3e ser=%.4f type1=%d type2=%d type4=%d decMiss=%d %s %.1fs\n', ...
      vv, Ob.qNull, Ob.qWeak, Ob.qStrong, Ob.dec, Ob.serious, Ob.nType1, Ob.nType2, Ob.nType4, Ob.decMiss, elab, toc);
  out('  worst null r=%.3f place=%.1f dir=%.1f dec r=%.3f place=%.1f dir=%.1f type=%d\n', ...
      Ob.rNull, Ob.pNull, Ob.aNull, Ob.rDec, Ob.pDec, Ob.aDec, Ob.tDec);
  out('  tail qN=%.3e qW=%.3e qS=%.3e dec=%.3e\n', Ob.tail.qNull, Ob.tail.qWeak, Ob.tail.qStrong, Ob.tail.dec);
  fflush(fid);
  clear Te Ob W;
end
out('taper fan done\n');
fclose(fid);
