% Gate stamp. MATLAB syntax, run here in Octave.
% The shape, the lateral coefficient, the proper length, and one scheduled
% crossing. The fill adds the cavity bounds, the gamma bounds, a Simpson
% length, and the throat-density reprint. The solve adds the coordinate
% mass ratios and the proper-mass factor. The derive adds the radial
% density factor, the 40 m tension ratios, and the two-mouth potential.
% The energy page multiplies the exotic masses by c squared.
% The supply page reads dE/dt along the null ray and the lateral-load coast.
% Not a Warp Factory metric.
% The pin is not an input.

function dial_gate_stamp(outname)
if nargin < 1 || isempty(outname)
  outname = 'data/dial_gate_stamp.txt';
end
r0 = 20;
g = 9.80665;
c = 2.99792458e8;
G = 6.67430e-11;
n = 400000;
fid = fopen(outname, 'w');
fails = 0;

Rs6 = r0 / 6;
Rsh = r0 / 2;
L6 = closed_length(40, Rs6);
Lh = closed_length(40, Rsh);
fails = lineout(fid, fails, 'length_sixth', L6, 35.94488696565487, 0);
fails = lineout(fid, fails, 'length_half', Lh, 39.077758146657835, 0);
fails = lineout(fid, fails, 'through_sixth', 2 * L6, 71.88977393130973, 0);
fails = lineout(fid, fails, 'through_half', 2 * Lh, 78.15551629331567, 0);
fails = lineout(fid, fails, 'null_sixth', 2 * L6 / c, 2.397984739539703e-7, 0);
fails = lineout(fid, fails, 'null_half', 2 * Lh / c, 2.606987407712427e-7, 0);

k6 = Rs6 / (2 * r0 ^ 3) + (r0 - Rs6) * r0 / r0 ^ 4;
kh = Rsh / (2 * r0 ^ 3) + (r0 - Rsh) * r0 / r0 ^ 4;
fails = lineout(fid, fails, 'kappa_sixth', k6, 11 / 4800, 1e-15);
fails = lineout(fid, fails, 'kappa_half', kh, 3 / 1600, 0);
fails = lineout(fid, fails, 'slope_sixth', -((r0 - Rs6) / r0), -5 / 6, 1e-15);
fails = lineout(fid, fails, 'slope_half', -((r0 - Rsh) / r0), -1 / 2, 0);
fails = lineout(fid, fails, 'flare_sixth', (1 + (r0 - Rs6) / r0) / (2 * r0), 11 / 240, 1e-15);
fails = lineout(fid, fails, 'flare_half', (1 + (r0 - Rsh) / r0) / (2 * r0), 3 / 80, 0);

v6 = sqrt(g / (k6 * 10));
vh = sqrt(g / (kh * 10));
fails = lineout(fid, fails, 'throat_speed_sixth', v6, 20.686385509666625, 0);
fails = lineout(fid, fails, 'throat_speed_half', vh, 22.869659668069687, 0);
fails = lineout(fid, fails, 'const_sixth', (2 * L6) / v6, 3.4752216088072063, 0);
fails = lineout(fid, fails, 'const_half', (2 * Lh) / vh, 3.4174324160335168, 0);
fails = lineout(fid, fails, 'rest_sixth', 2 * sqrt((2 * L6) / g), 5.4150592988470425, 0);
fails = lineout(fid, fails, 'rest_half', 2 * sqrt((2 * Lh) / g), 5.646111833747349, 0);
fails = lineout(fid, fails, 'width_250_sixth', g / (k6 * 250 ^ 2), 0.06846824727272725, 0);
fails = lineout(fid, fails, 'width_250_half', g / (kh * 250 ^ 2), 0.08368341333333333, 0);
fails = lineout(fid, fails, 'upright_sixth', (2 * L6) / sqrt(g / (k6 * 1.8)), 1.4744116594281595, 0);
fails = lineout(fid, fails, 'upright_half', (2 * Lh) / sqrt(g / (kh * 1.8)), 1.449893781374416, 0);

M6 = (1 / 6) * 20 * c ^ 2 / (2 * G);
Mh = (1 / 2) * 20 * c ^ 2 / (2 * G);
M6s = (1 / 6) * 2 * c ^ 2 / (2 * G);
Mhs = (1 / 2) * 2 * c ^ 2 / (2 * G);
fails = lineout(fid, fails, 'mass_sixth_float', M6, 2.2443182025001816e27, 0);
fails = lineout(fid, fails, 'mass_half_float', Mh, 6.732954607500545e27, 0);
fails = lineout(fid, fails, 'mass_sixth_2m', M6s, 2.2443182025001814e26, 0);
fails = lineout(fid, fails, 'mass_half_2m', Mhs, 6.732954607500545e26, 0);
fprintf(fid, 'NOTE exact mouth masses are the Lean equalities. This log checks the float64 evaluation.\n');

smax = sqrt(20);
ds = smax / n;
s = (0:n)' * ds;
t6 = 2 * trapz(s, integrand(s, Rs6, 1));
th = 2 * trapz(s, integrand(s, Rsh, 1));
fails = lineout(fid, fails, 'schedule_sixth', t6, 2.1294485057269195, 1e-12);
fails = lineout(fid, fails, 'schedule_half', th, 2.1647639000180656, 1e-12);
fails = lineout(fid, fails, 'length_integral_sixth', trapz(s, integrand(s, Rs6, 0)), L6, 1e-9);
fails = lineout(fid, fails, 'length_integral_half', trapz(s, integrand(s, Rsh, 0)), Lh, 1e-9);
fails = lineout(fid, fails, 'length_simpson_sixth', simpson(s, integrand(s, Rs6, 0)), L6, 1e-9);
fails = lineout(fid, fails, 'length_simpson_half', simpson(s, integrand(s, Rsh, 0)), Lh, 1e-9);
fails = lineout(fid, fails, 'length_simpson_smooth_sixth', simpson(s, smooth_integrand(s, Rs6)), L6, 1e-12);
fails = lineout(fid, fails, 'length_simpson_smooth_half', simpson(s, smooth_integrand(s, Rsh)), Lh, 1e-12);
ts6 = 2 * simpson(s, integrand(s, Rs6, 1));
tsh = 2 * simpson(s, integrand(s, Rsh, 1));
fprintf(fid, 'NOTE simpson schedule %.16e %.16e on the same grid. The published ship times stay the trapezoid values.\n', ts6, tsh);

worst = 0;
for r = [21 25 40 100]
  for Rs = [Rs6 Rsh]
    a = Rs / (2 * r0);
    d = 1 - a;
    u = r / r0;
    b = Rs + (r0 - Rs) * r0 / r;
    left = (1 - b / r) * u ^ 2;
    right = (u - a) ^ 2 - d ^ 2;
    worst = max(worst, abs(left - right));
  end
end
fails = lineout(fid, fails, 'radicand_worst', worst, 0, 1e-12);

b6 = -((r0 - Rs6) / r0);
bh = -((r0 - Rsh) / r0);
pref = c ^ 4 / (8 * pi * G * r0 ^ 2);
fails = lineout(fid, fails, 'tension', pref, 1.2038634716806056e40, 1e-15);
fails = lineout(fid, fails, 'density_sixth', b6 * pref, -1.003219559733838e40, 1e-15);
fails = lineout(fid, fails, 'density_half', bh * pref, -6.019317358403028e39, 1e-15);
fails = boundout(fid, fails, 'density_sixth_negative', b6 * pref, 0);
fails = boundout(fid, fails, 'density_half_negative', bh * pref, 0);

ell = 8573494832025231 / 1e16;
cav = r0 * (1 - ell);
fails = lineout(fid, fails, 'cavity', cav, 2.8530103359495373, 0);
fails = boundout(fid, fails, 'cavity_inside_sixth', cav, 10 / 3);
fails = boundout(fid, fails, 'cavity_inside_half', cav, 10);
fails = boundout(fid, fails, 'cavity_inside_float_sixth', cav, 3.332860728780457);
fails = boundout(fid, fails, 'cavity_inside_float_half', cav, 9.995611722233722);

c2 = 299792458 ^ 2;
gwalk = 400 / (c2 - 400);
gface = 6400 / (c2 - 6400);
gwidth = 100000000 / (c2 - 100000000);
fails = boundout(fid, fails, 'gamma_walk', gwalk, 1e-14);
fails = boundout(fid, fails, 'gamma_face', gface, 1e-12);
fails = boundout(fid, fails, 'gamma_width', gwidth, 2e-9);

lim6 = 2 * r0 / sqrt(2 * r0 - Rs6);
limh = 2 * r0 / sqrt(2 * r0 - Rsh);
fails = lineout(fid, fails, 'throat_limit_sixth', integrand(0, Rs6, 0), lim6, 0);
fails = lineout(fid, fails, 'throat_limit_half', integrand(0, Rsh, 0), limh, 0);
fails = boundout(fid, fails, 'throat_approach_sixth', abs(raw_open(1e-4, Rs6) - lim6), 1e-6);
fails = boundout(fid, fails, 'throat_approach_half', abs(raw_open(1e-4, Rsh) - limh), 1e-6);

fails = lineout(fid, fails, 'coordinate_ratio_sixth', (Rs6 - r0) / Rs6, -5, 0);
fails = lineout(fid, fails, 'coordinate_ratio_half', (Rsh - r0) / Rsh, -1, 0);
fails = lineout(fid, fails, 'coordinate_side_sixth', -5 * M6, -1.1221591012500907e28, 0);
fails = lineout(fid, fails, 'coordinate_side_half', -1 * Mh, -6.7329546075005447e27, 0);
fails = lineout(fid, fails, 'coordinate_mouth_sixth', -10 * M6, -2.2443182025001813e28, 0);
fails = lineout(fid, fails, 'coordinate_mouth_half', -2 * Mh, -1.3465909215001089e28, 0);
fails = lineout(fid, fails, 'coordinate_pair_sixth', -20 * M6, -4.4886364050003627e28, 0);
fails = lineout(fid, fails, 'coordinate_pair_half', -4 * Mh, -2.6931818430002179e28, 0);

r6 = -2 * sqrt(30) * atan(sqrt(30) / 6);
rh = -2 * sqrt(2) * atan(sqrt(2) / 2);
fails = lineout(fid, fails, 'proper_side_sixth', M6 * r6, -1.8190171650206053e28, 0);
fails = lineout(fid, fails, 'proper_side_half', Mh * rh, -1.1720993350853233e28, 0);
fails = lineout(fid, fails, 'proper_mouth_sixth', 2 * M6 * r6, -3.6380343300412106e28, 0);
fails = lineout(fid, fails, 'proper_mouth_half', 2 * Mh * rh, -2.3441986701706466e28, 0);
fails = lineout(fid, fails, 'proper_pair_sixth', 4 * M6 * r6, -7.2760686600824212e28, 0);
fails = lineout(fid, fails, 'proper_pair_half', 4 * Mh * rh, -4.6883973403412932e28, 0);
fails = lineout(fid, fails, 'cosh_sixth', quad_cosh(5 / 3, 55 / 3), sqrt(30) * atan(sqrt(30) / 6) / 50, 1e-15);
fails = lineout(fid, fails, 'cosh_half', quad_cosh(5, 15), sqrt(2) * atan(sqrt(2) / 2) / 10, 1e-15);

fails = lineout(fid, fails, 'density_ratio_forty', (r0 / 40) ^ 4, 1 / 16, 0);
b40s = Rs6 + (r0 - Rs6) * r0 / 40;
b40h = Rsh + (r0 - Rsh) * r0 / 40;
fails = lineout(fid, fails, 'tension_ratio_forty_sixth', (b40s / r0) * (r0 / 40) ^ 3, 7 / 96, 0);
fails = lineout(fid, fails, 'tension_ratio_forty_half', (b40h / r0) * (r0 / 40) ^ 3, 3 / 32, 0);
fails = lineout(fid, fails, 'density_forty_sixth', (b6 * pref) / 16, -6.2701222483364878e38, 0);
fails = lineout(fid, fails, 'density_forty_half', (bh * pref) / 16, -3.7620733490018924e38, 0);
fails = lineout(fid, fails, 'tension_forty_sixth', pref * (b40s / r0) * (r0 / 40) ^ 3, 8.7781711476710825e38, 0);
fails = lineout(fid, fails, 'tension_forty_half', pref * (b40h / r0) * (r0 / 40) ^ 3, 1.1286220047005678e39, 0);
fails = lineout(fid, fails, 'nec_face', -pref / 8, -1.5048293396007570e39, 0);

kap = 0.10001300937604073;
gam = 0.4280434460598068;
gap = 0.9536594523121079 - (-0.6526335205358984);
Vpot = kap * gam * gap ^ 2 / (2 * (2 * kap + gam));
fails = lineout(fid, fails, 'potential_on', Vpot, 8.7933870746039020e-02, 0);
delta_inf = 1.0947247366745378;
fails = lineout(fid, fails, 'shutdown_action', (gap ^ 2 + delta_inf ^ 2) / 8, 4.7232492046350283e-01, 0);
flux0 = 0.10948671535321428;
roundoff = 1.3877787807814457e-17;
t_pin = log(flux0 / roundoff) / (2 * kap + gam);
fails = lineout(fid, fails, 'shutdown_pin_time', t_pin, 5.8280639489868257e+01, 0);
fails = lineout(fid, fails, 'shutdown_seconds', t_pin * r0 / c, 3.8880657558015190e-06, 1e-15);

fails = lineout(fid, fails, 'energy_side_sixth', -5 * M6 * c ^ 2, -1.0085463036151718e45, 0);
fails = lineout(fid, fails, 'energy_mouth_sixth', -10 * M6 * c ^ 2, -2.0170926072303437e45, 0);
fails = lineout(fid, fails, 'energy_pair_sixth', -20 * M6 * c ^ 2, -4.0341852144606874e45, 0);
fails = lineout(fid, fails, 'energy_side_half', -1 * Mh * c ^ 2, -6.0512778216910320e44, 0);
fails = lineout(fid, fails, 'energy_mouth_half', -2 * Mh * c ^ 2, -1.2102555643382064e45, 0);
fails = lineout(fid, fails, 'energy_pair_half', -4 * Mh * c ^ 2, -2.4205111286764128e45, 0);
fails = lineout(fid, fails, 'energy_proper_side_sixth', M6 * r6 * c ^ 2, -1.6348510972734333e45, 0);
fails = lineout(fid, fails, 'energy_proper_mouth_sixth', 2 * M6 * r6 * c ^ 2, -3.2697021945468666e45, 0);
fails = lineout(fid, fails, 'energy_proper_pair_sixth', 4 * M6 * r6 * c ^ 2, -6.5394043890937331e45, 0);
fails = lineout(fid, fails, 'energy_proper_side_half', Mh * rh * c ^ 2, -1.0534303474019149e45, 0);
fails = lineout(fid, fails, 'energy_proper_mouth_half', 2 * Mh * rh * c ^ 2, -2.1068606948038297e45, 0);
fails = lineout(fid, fails, 'energy_proper_pair_half', 4 * Mh * rh * c ^ 2, -4.2137213896076594e45, 0);

A6 = (r0 - Rs6) * r0;
Ah = (r0 - Rsh) * r0;
fails = lineout(fid, fails, 'energy_face_ratio_sixth', (b40s - r0) / (Rs6 - r0), 1 / 2, 1e-15);
fails = lineout(fid, fails, 'energy_face_ratio_half', (b40h - r0) / (Rsh - r0), 1 / 2, 0);
fails = lineout(fid, fails, 'kappa_forty_sixth', Rs6 / (2 * 40 ^ 3) + A6 / 40 ^ 4, 1 / 6400, 1e-15);
fails = lineout(fid, fails, 'kappa_forty_half', Rsh / (2 * 40 ^ 3) + Ah / 40 ^ 4, 1 / 6400, 0);
fails = lineout(fid, fails, 'face_speed', sqrt(g / ((1 / 6400) * 10)), 7.9222824993810960e+01, 0);
rN6 = (5 * Rs6 + sqrt(25 * Rs6 ^ 2 + 96 * A6)) / 8;
rNh = (5 * Rsh + sqrt(25 * Rsh ^ 2 + 96 * Ah)) / 8;
fails = lineout(fid, fails, 'null_peak_radius_sixth', rN6, 2.4540854963686442e+01, 0);
fails = lineout(fid, fails, 'null_peak_radius_half', rNh, 2.4663649828320295e+01, 0);
fails = lineout(fid, fails, 'null_peak_quad_sixth', 4 * rN6 ^ 2 - 5 * Rs6 * rN6 - 6 * A6, 0, 1e-12);
fails = lineout(fid, fails, 'null_peak_quad_half', 4 * rNh ^ 2 - 5 * Rsh * rNh - 6 * Ah, 0, 0);
pnull = @(r, Rs, A) (c ^ 5 / (2 * G)) * (-A / r ^ 2) * sqrt(1 - (Rs + A / r) / r);
fails = lineout(fid, fails, 'supply_null_sixth', pnull(rN6, Rs6, A6), -5.5967323357299716e51, 0);
fails = lineout(fid, fails, 'supply_null_half', pnull(rNh, Rsh, Ah), -3.0748636696503162e51, 0);
fails = lineout(fid, fails, 'supply_null_forty_sixth', pnull(40, Rs6, A6), -3.1808661740224099e51, 0);
fails = lineout(fid, fails, 'supply_null_forty_half', pnull(40, Rsh, Ah), -1.7927420983775237e51, 0);
p6 = [1, -2 * Rs6, -5 * A6, -4 * A6 ^ 2 / Rs6];
ph = [1, -2 * Rsh, -5 * Ah, -4 * Ah ^ 2 / Rsh];
z6 = roots(p6);
zh = roots(ph);
[~, i6] = max(real(z6));
[~, ih] = max(real(zh));
rc6 = real(z6(i6));
rch = real(zh(ih));
fails = lineout(fid, fails, 'coast_peak_radius_sixth', rc6, 6.4523317740912603e+01, 0);
fails = lineout(fid, fails, 'coast_peak_radius_half', rch, 4.7871228950239384e+01, 0);
fails = boundout(fid, fails, 'coast_cubic_sixth', abs(real(polyval(p6, rc6))), 1e-8);
fails = boundout(fid, fails, 'coast_cubic_half', abs(real(polyval(ph, rch))), 1e-8);
pcoast = @(r, Rs, A) (c ^ 4 / (2 * G)) * (-A / r ^ 2) * sqrt(g / ((Rs / (2 * r ^ 3) + A / r ^ 4) * 10)) * sqrt(1 - (Rs + A / r) / r);
fails = lineout(fid, fails, 'supply_coast_sixth', pcoast(rc6, Rs6, A6), -8.8645790720056626e44, 0);
fails = lineout(fid, fails, 'supply_coast_half', pcoast(rch, Rsh, Ah), -4.7969358278401484e44, 0);
fails = lineout(fid, fails, 'supply_coast_forty_sixth', pcoast(40, Rs6, A6), -8.4057219422548104e44, 0);
fails = lineout(fid, fails, 'supply_coast_forty_half', pcoast(40, Rsh, Ah), -4.7374805379126639e44, 0);
fails = lineout(fid, fails, 'supply_ratio_sixth', pcoast(rc6, Rs6, A6) / pnull(rc6, Rs6, A6), sqrt(g / ((Rs6 / (2 * rc6 ^ 3) + A6 / rc6 ^ 4) * 10)) / c, 1e-12);
fails = lineout(fid, fails, 'supply_ratio_half', pcoast(rch, Rsh, Ah) / pnull(rch, Rsh, Ah), sqrt(g / ((Rsh / (2 * rch ^ 3) + Ah / rch ^ 4) * 10)) / c, 1e-12);
E6s = (c ^ 4 / (2 * G)) * (Rs6 - r0);
Ehs = (c ^ 4 / (2 * G)) * (Rsh - r0);
fails = lineout(fid, fails, 'energy_face_sixth', E6s / 2, -5.0427315180758600e44, 0);
fails = lineout(fid, fails, 'energy_face_half', Ehs / 2, -3.0256389108455156e44, 0);
fails = lineout(fid, fails, 'supply_mean_sixth', E6s / 2.1294485057269195, -4.7361854531950252e44, 0);
fails = lineout(fid, fails, 'supply_mean_half', Ehs / 2.1647639000180656, -2.7953523345619962e44, 0);
I6 = integral(@(s) 1 ./ ((s .^ 2 + 20) .* sqrt(3 * s .^ 2 + 110)), 0, inf);
Kh = integral(@(s) 1 ./ ((s .^ 2 + 20) .* sqrt(s .^ 2 + 30)), 0, inf);
fails = lineout(fid, fails, 'proper_integrand_sixth', I6, sqrt(10) * atan(sqrt(30) / 6) / 100, 1e-15);
fails = lineout(fid, fails, 'proper_integrand_half', Kh, sqrt(2) * atan(sqrt(2) / 2) / 20, 0);

fprintf(fid, 'NOTE h is absent from this stamp. No value is supplied.\n');
fprintf(fid, 'NOTE momentum_rhs takes rho, v, dv_dx, d2v_dx2, dP_dx, D_eff, observed. It does not take the flux.\n');
fprintf(fid, 'NOTE the depth-5 open/closed pair stays unseated.\n');

fprintf(fid, 'fails %d\n', fails);
fprintf('fails %d\n', fails);
fclose(fid);
end

function fails = boundout(fid, fails, name, got, upper)
  margin = upper - got;
  if got < upper
    status = 'PASS';
  else
    status = 'FAIL';
    fails = fails + 1;
  end
  fprintf(fid, '%s %s got %.16e upper %.16e margin %.3e\n', status, name, got, upper, margin);
  fprintf('%s %s margin %.3e\n', status, name, margin);
end

function q = simpson(x, y)
  h = x(2) - x(1);
  q = h / 3 * (y(1) + y(end) + 4 * sum(y(2:2:end-1)) + 2 * sum(y(3:2:end-2)));
end

function y = smooth_integrand(s, Rs)
  r0 = 20;
  r = r0 + s .* s;
  y = 2 .* r ./ sqrt(r + r0 - Rs);
end

function y = raw_open(s, Rs)
  r0 = 20;
  r = r0 + s .* s;
  b = Rs + (r0 - Rs) .* r0 ./ r;
  y = 2 .* s ./ sqrt(1 - b ./ r);
end

function fails = lineout(fid, fails, name, got, want, tol)
  d = got - want;
  scale = max(1, abs(want));
  if abs(d) <= tol * scale
    status = 'PASS';
  else
    status = 'FAIL';
    fails = fails + 1;
  end
  fprintf(fid, '%s %s got %.16e want %.16e residual %.3e\n', status, name, got, want, d);
  fprintf('%s %s residual %.3e\n', status, name, d);
end

function y = integrand(s, Rs, divide_by_v)
  r0 = 20;
  g = 9.80665;
  W = 10;
  r = r0 + s .* s;
  b = Rs + (r0 - Rs) .* r0 ./ r;
  gp = 1 - b ./ r;
  raw = 2 .* s ./ sqrt(gp);
  raw(s == 0) = 2 * r0 / sqrt(2 * r0 - Rs);
  if divide_by_v
    k = Rs ./ (2 .* r .^ 3) + (r0 - Rs) .* r0 ./ r .^ 4;
    v = sqrt(g ./ (k .* W));
    y = raw ./ v;
  else
    y = raw;
  end
end

function L = closed_length(r, Rs)
  r0 = 20;
  a = Rs / (2 * r0);
  d = 1 - a;
  u = r / r0;
  disc = sqrt((u - a) ^ 2 - d ^ 2);
  L = r0 * (disc + a * log((u - a + disc) / d));
end

function q = quad_cosh(A, B)
  q = integral(@(t) 2 ./ (B .* t .^ 2 + 2 .* A .* t + B), 0, 1);
end
