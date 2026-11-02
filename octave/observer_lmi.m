% Copyright 2026 Damian Arthur Palumbo
% SPDX-License-Identifier: Apache-2.0
%
% All-observer margins on one Eulerian contravariant stress-energy.
% The tensor is already in the orthonormal frame this port computes.
% Null, weak, and strong margins are the exact minima of the quadratic
% form the sampled observer field contracts, over the sphere and the ball.
% The dominant margin is the invariant rest-frame slack when a rest frame
% exists. A tensor with no rest frame is reported as such.
% a* is the direction of the worst null vector. p* is where the cell sits:
% 0 at the nose (+x), 90 on the side, 180 at the back (-x).

function R = observer_lmi(Te, x, y, R2, pk)
if nargin == 1 && ischar(Te) && strcmp(Te, "test")
  R = observer_selftest();
  return
end
eta = diag([-1, 1, 1, 1]);
[nx, ny] = size(x);
qN = zeros(nx, ny);
qW = zeros(nx, ny);
qS = zeros(nx, ny);
dS = zeros(nx, ny);
typ = zeros(nx, ny);
ang = zeros(nx, ny);
rad = hypot(x, y);
azi = atan2(abs(y), x);
for i = 1:nx
  if mod(i, 30) == 0
    fprintf('observer row %d/%d\n', i, nx);
    fflush(stdout);
  end
  for j = 1:ny
    T = zeros(4);
    for a = 1:4
      for b = 1:4
        T(a, b) = Te{a, b}(i, j);
      end
    end
    Tc = raise_to_covariant(T);
    [qN(i, j), qW(i, j), sN] = ball_margins(Tc);
    tr = -Tc(1, 1) + Tc(2, 2) + Tc(3, 3) + Tc(4, 4);
    Th = Tc - 0.5 * tr * eta;
    [~, qS(i, j), ~] = ball_margins(Th);
    [typ(i, j), dS(i, j)] = dominant_slack(Tc, eta);
    ang(i, j) = atan2(hypot(sN(2), sN(3)), sN(1));
  end
end
R = pack_region(qN, qW, qS, dS, typ, rad, ang, pk, rad >= 0, azi);
R.tail = pack_region(qN, qW, qS, dS, typ, rad, ang, pk, rad > R2, azi);
end

function Tc = raise_to_covariant(Tup)
% Contravariant orthonormal components to covariant, signature (-+++).
Tc = Tup;
for k = 2:4
  Tc(1, k) = -Tup(1, k);
  Tc(k, 1) = -Tup(k, 1);
end
end

function [qNull, qWeak, sHat] = ball_margins(Tc)
rho = Tc(1, 1);
b = -Tc(1, 2:4).';
S = (Tc(2:4, 2:4) + Tc(2:4, 2:4).') / 2;
scale = max(1, max(max(abs(Tc))));
[qNull, sHat] = sphere_min(rho, b, S, scale);
ev = real(eig(S));
qWeak = qNull;
if min(ev) >= -1e-10 * scale
  if min(ev) > 1e-10 * scale
    w = S \ b;
    if norm(w) <= 1
      qWeak = rho - 2 * (b.' * w) + w.' * S * w;
      sHat = w;
    end
  else
    w = pinv(S) * b;
    if norm(S * w - b) <= 1e-8 * scale && norm(w) <= 1
      qWeak = rho - 2 * (b.' * w) + w.' * S * w;
      sHat = w;
    end
  end
end
end

function [qmin, sHat] = sphere_min(rho, b, S, scale)
S = (S + S.') / 2;
[Q, D] = eig(S);
d = real(diag(D));
br = Q.' * b;
keep = abs(br) > 1e-12 * scale;
if ~any(keep)
  [lam, ix] = min(d);
  u = zeros(3, 1);
  u(ix) = 1;
  qmin = rho + lam;
  sHat = Q * u;
  return
end
dk = d(keep);
bk = br(keep);
mus = [exterior_root(dk, bk, scale, -1); exterior_root(dk, bk, scale, +1)];
[ds, ord] = sort(dk);
bs = bk(ord);
for k = 1:(numel(ds) - 1)
  lo = ds(k) + 1e-12 * scale;
  hi = ds(k + 1) - 1e-12 * scale;
  if hi <= lo
    continue
  end
  if dphi(ds, bs, lo) < 0 && dphi(ds, bs, hi) > 0
    muMin = bisect_zero(@(m) dphi(ds, bs, m), lo, hi);
    if phi(ds, bs, muMin) < 1
      mus(end + 1, 1) = bisect_level(ds, bs, lo, muMin, +1); %#ok<AGROW>
      mus(end + 1, 1) = bisect_level(ds, bs, muMin, hi, -1); %#ok<AGROW>
    end
  end
end
free = find(~keep);
for n = 1:numel(free)
  mus(end + 1, 1) = d(free(n)); %#ok<AGROW>
end
qmin = inf;
sHat = [1; 0; 0];
for n = 1:numel(mus)
  den = d - mus(n);
  u = zeros(3, 1);
  if any(abs(den(keep)) <= 1e-14 * scale)
    continue
  end
  u(keep) = br(keep) ./ den(keep);
  used = sum(u(keep) .^ 2);
  if used > 1 + 1e-7
    continue
  end
  room = 1 - used;
  if room < 0
    room = 0;
  end
  if any(~keep)
    % The free axis is a critical direction only when its eigenvalue is mu.
    at = find(abs(d - mus(n)) <= 1e-8 * scale & ~keep);
    if isempty(at)
      if room > 1e-8
        continue
      end
    else
      u(at(1)) = sqrt(room);
    end
  end
  nu = norm(u);
  if abs(nu - 1) > 1e-5
    continue
  end
  u = u / nu;
  qq = rho + sum(d .* (u .^ 2)) - 2 * (br.' * u);
  if qq < qmin
    qmin = qq;
    sHat = Q * u;
  end
end
if ~isfinite(qmin)
  error('observer_lmi: sphere minimum was not found');
end
end

function v = phi(d, br, mu)
v = sum((br .^ 2) ./ ((d - mu) .^ 2));
end

function v = dphi(d, br, mu)
v = sum((br .^ 2) ./ ((d - mu) .^ 3));
end

function mu = exterior_root(d, br, scale, side)
span = norm(br) + scale;
if side < 0
  hi = min(d) - 1e-12 * scale;
  lo = hi - span;
  while phi(d, br, lo) > 1
    span = span * 4;
    lo = hi - span;
  end
  mu = bisect_level(d, br, lo, hi, +1);
else
  lo = max(d) + 1e-12 * scale;
  hi = lo + span;
  while phi(d, br, hi) > 1
    span = span * 4;
    hi = lo + span;
  end
  mu = bisect_level(d, br, lo, hi, -1);
end
end

function mu = bisect_level(d, br, lo, hi, direction)
% direction +1: phi increases with mu. direction -1: phi decreases.
for n = 1:70
  mid = (lo + hi) / 2;
  if direction * (phi(d, br, mid) - 1) > 0
    hi = mid;
  else
    lo = mid;
  end
end
mu = (lo + hi) / 2;
end

function mu = bisect_zero(fn, lo, hi)
for n = 1:70
  mid = (lo + hi) / 2;
  if fn(mid) > 0
    hi = mid;
  else
    lo = mid;
  end
end
mu = (lo + hi) / 2;
end

function [kind, slack] = dominant_slack(Tc, eta)
M = eta * Tc;
[V, E] = eig(M);
lam = diag(E);
if any(abs(imag(lam)) > 1e-8 * max(1, max(abs(lam))))
  kind = 4;
  slack = nan;
  return
end
lam = real(lam);
V = real(V);
best = 0;
iTime = 0;
for k = 1:4
  v = V(:, k);
  gvv = v.' * eta * v;
  if gvv < best
    best = gvv;
    iTime = k;
  end
end
nv = norm(V(:, iTime));
if iTime == 0 || best >= -1e-8 * max(nv * nv, 1)
  kind = 2;
  slack = nan;
  return
end
kind = 1;
rho = -lam(iTime);
ps = lam;
ps(iTime) = [];
slack = min([rho, min(rho - abs(ps)), min(rho + ps)]);
end

function R = observer_selftest()
eta = diag([-1, 1, 1, 1]);
dust = zeros(4);
dust(1, 1) = 1;
[qN, qW, ~] = ball_margins(dust);
assert_near("dust null", qN, 1);
assert_near("dust weak", qW, 1);
[kind, slack] = dominant_slack(dust, eta);
assert_near("dust type", kind, 1);
assert_near("dust dec", slack, 1);
beam = zeros(4);
beam(1, 1) = 1;
beam(1, 2) = -1;
beam(2, 1) = -1;
beam(2, 2) = 1;
[qN, qW, ~] = ball_margins(beam);
assert_near("beam null", qN, 0);
assert_near("beam weak", qW, 0);
neg = zeros(4);
neg(1, 1) = 1;
neg(2, 2) = -2;
[qN, qW, ~] = ball_margins(neg);
assert_near("pressure null", qN, -1);
assert_near("pressure weak", qW, -1);
fluid = diag([1, 0.2, 0.2, 0.2]);
[kind, slack] = dominant_slack(fluid, eta);
assert_near("fluid type", kind, 1);
assert_near("fluid dec", slack, 0.8);
[qN, qW, ~] = ball_margins(fluid);
assert_near("fluid null", qN, 1.2);
assert_near("fluid weak", qW, 1);
tilt = zeros(4);
tilt(1, 1) = 2;
tilt(1, 2) = -0.3;
tilt(2, 1) = -0.3;
tilt(1, 3) = 0.1;
tilt(3, 1) = 0.1;
tilt(2, 2) = 0.4;
tilt(3, 3) = 0.2;
tilt(4, 4) = 0.5;
tilt(2, 3) = 0.05;
tilt(3, 2) = 0.05;
[qExact, ~, ~] = ball_margins(tilt);
qScan = inf;
for n = 1:4000
  z = [1, mod(n * 0.7548776662, 1), mod(n * 0.5698402910, 1)];
  th = acos(1 - 2 * z(2));
  ph = 2 * pi * z(3);
  s = [sin(th) * cos(ph); sin(th) * sin(ph); cos(th)];
  qq = quad_form(tilt, s);
  qScan = min(qScan, qq);
end
if qExact > qScan + 1e-6
  error("observer_lmi: sphere minimum %.6e is above the scan %.6e", qExact, qScan);
end
R = 1;
end

function q = quad_form(Tc, s)
rho = Tc(1, 1);
b = -Tc(1, 2:4).';
S = Tc(2:4, 2:4);
q = rho - 2 * (b.' * s) + s.' * S * s;
end

function assert_near(name, got, want)
if abs(got - want) > 1e-8
  error("observer_lmi: %s got %.6e want %.6e", name, got, want);
end
end

function R = pack_region(qN, qW, qS, dS, typ, rad, ang, pk, mask, azi)
qN = qN(mask);
qW = qW(mask);
qS = qS(mask);
dS = dS(mask);
typ = typ(mask);
rad = rad(mask);
ang = ang(mask);
azi = azi(mask);
R.n = numel(qN);
R.qNull = min(qN) / pk;
R.qWeak = min(qW) / pk;
R.qStrong = min(qS) / pk;
use = isfinite(dS);
if any(use)
  R.dec = min(dS(use)) / pk;
else
  R.dec = nan;
end
R.nType1 = sum(typ == 1);
R.nType2 = sum(typ == 2);
R.nType4 = sum(typ == 4);
R.nDecNan = sum(~isfinite(dS));
[~, iN] = min(qN);
[~, iW] = min(qW);
[~, iS] = min(qS);
if any(use)
  [~, iDrel] = min(dS(use));
  idx = find(use);
  iD = idx(iDrel);
else
  iD = iN;
end
R.rNull = rad(iN);
R.aNull = ang(iN) * 180 / pi;
R.pNull = azi(iN) * 180 / pi;
R.tNull = typ(iN);
R.rWeak = rad(iW);
R.aWeak = ang(iW) * 180 / pi;
R.pWeak = azi(iW) * 180 / pi;
R.tWeak = typ(iW);
R.rStrong = rad(iS);
R.aStrong = ang(iS) * 180 / pi;
R.pStrong = azi(iS) * 180 / pi;
R.tStrong = typ(iS);
R.rDec = rad(iD);
R.aDec = ang(iD) * 180 / pi;
R.pDec = azi(iD) * 180 / pi;
R.tDec = typ(iD);
vals = [R.qNull, R.qWeak, R.qStrong];
if isfinite(R.dec)
  vals(end + 1) = R.dec;
end
R.worst = min(vals);
R.serious = mean(qN < -1e-3 * pk | qW < -1e-3 * pk | qS < -1e-3 * pk | (isfinite(dS) & dS < -1e-3 * pk));
miss = qW >= -1e-3 * pk & isfinite(dS) & dS < -1e-3 * pk;
R.decMiss = sum(miss);
end
