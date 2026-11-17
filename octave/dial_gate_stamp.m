% Gate stamp. Run in Octave.
% The shape, the lateral coefficient, the proper length, and one scheduled
% crossing. The fill adds the cavity bounds, the gamma bounds, a Simpson
% length, and the throat-density reprint. The solve adds the coordinate
% mass ratios and the proper-mass factor. The derive adds the radial
% density factor, the 40 m tension ratios, and the two-mouth potential.
% The energy page multiplies the exotic masses by c squared.
% The supply page reads dE/dt along the null ray and the lateral-load coast.
% The shutdown page sets every sector equilibrium to the mean of the clock.
% The schedule page evaluates the 40 m crossing as a Carlson integral.
% The join multiplies the shape tension by the seated potential.
% The entry follows the seated shutdown into that tide.
% The inventory splits the shape energy. The entry moves none of it.
% The departure scores the face leaving while V falls.
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
scale_t = 2 * sqrt(10 / (2 * g));
geom_t = @(ss, Rs) 2 * sqrt(Rs * ss .^ 2 + r0 * (2 * r0 - Rs)) ./ ((ss .^ 2 + r0) .* sqrt(ss .^ 2 + (2 * r0 - Rs)));
t6c = scale_t * integral(@(ss) geom_t(ss, Rs6), 0, sqrt(r0), 'AbsTol', 1e-14, 'RelTol', 1e-14);
thc = scale_t * integral(@(ss) geom_t(ss, Rsh), 0, sqrt(r0), 'AbsTol', 1e-14, 'RelTol', 1e-14);
fails = lineout(fid, fails, 'schedule_closed_sixth', t6c, 2.1294485056590506, 0);
fails = lineout(fid, fails, 'schedule_closed_half', thc, 2.1647638999709788, 0);
fails = lineout(fid, fails, 'schedule_gap_sixth', t6 - t6c, 6.7996719366192337e-11, 0);
fails = lineout(fid, fails, 'schedule_gap_half', th - thc, 4.7098325239858241e-11, 0);
fails = lineout(fid, fails, 'supply_mean_closed_sixth', E6s / t6c, -4.7361854533459755e44, 0);
fails = lineout(fid, fails, 'supply_mean_closed_half', Ehs / thc, -2.7953523346227991e44, 0);
I6 = integral(@(s) 1 ./ ((s .^ 2 + 20) .* sqrt(3 * s .^ 2 + 110)), 0, inf);
Kh = integral(@(s) 1 ./ ((s .^ 2 + 20) .* sqrt(s .^ 2 + 30)), 0, inf);
fails = lineout(fid, fails, 'proper_integrand_sixth', I6, sqrt(10) * atan(sqrt(30) / 6) / 100, 1e-15);
fails = lineout(fid, fails, 'proper_integrand_half', Kh, sqrt(2) * atan(sqrt(2) / 2) / 20, 0);

Sclock = [
  -0.4820922399905892
   0.93950485519772331
   0.93567055594907511
   0.95211392199641598
   0.8911164249970055
   0.94560405929285485
   0.92543469252602639
   0.76525895308240177
];
Sbare = [
  -0.5023773181761478
   0.9501974701670142
   0.9363875640629747
   0.9557285700955828
   0.8873295223725087
   0.9501974701670142
   0.9363875640629747
   0.7587603802989923
];
kedge = [
  0.042615264597365102
  0.049731994158804659
  0.11170004262740593
  0.1351196415665806
  0.11170004262740593
  0.13027445443111807
  0.1450846749297095
  0.10767445561559723
  0.14089808029916673
  0.13511964156658057
  0.11204685639948532
  0.13027445443111807
  0.10767445561559723
  0.11170004262740592
  0.11139840622354726
];
edges = [
  1 2; 1 7; 2 3; 2 4; 2 7; 2 5; 2 6; 3 5; 3 7; 4 6; 4 8; 5 6; 7 5; 7 6; 6 8
];
nsec = 8;
Lsec = zeros(nsec);
for e = 1:size(edges, 1)
  i = edges(e, 1);
  j = edges(e, 2);
  k = kedge(e);
  Lsec(i, i) = Lsec(i, i) + k;
  Lsec(j, j) = Lsec(j, j) + k;
  Lsec(i, j) = Lsec(i, j) - k;
  Lsec(j, i) = Lsec(j, i) - k;
end
Eshut = mean(Sclock);
dsec = Sclock - Eshut;
fails = lineout(fid, fails, 'shutdown_mean', Eshut, 7.3407640288136422e-01, 0);
fails = lineout(fid, fails, 'shutdown_mean_bare', mean(Sbare), 7.3407640288136422e-01, 0);
fails = lineout(fid, fails, 'shutdown_action_graph', (dsec' * dsec) / 4, 4.2911086091120682e-01, 0);
V0 = gam / 2 * (dsec' * dsec);
for e = 1:size(edges, 1)
  V0 = V0 + kedge(e) / 2 * (Sclock(edges(e, 1)) - Sclock(edges(e, 2))) ^ 2;
end
fails = lineout(fid, fails, 'shutdown_potential', V0, 4.6402250394927314e-01, 1e-15);
Asec = Lsec + gam * eye(nsec);
[Vsec, Dsec] = eig(Asec);
ev = diag(Dsec);
[ev, ord] = sort(ev);
Vsec = Vsec(:, ord);
amps = Vsec' * dsec;
fails = lineout(fid, fails, 'shutdown_slow_rate', ev(2), 5.2223176413167338e-01, 1e-12);
roundoff = 1.3877787807814457e-17;
lo = 0;
hi = 1;
flux_at = inf;
while true
  st = Eshut + Vsec * (amps .* exp(-ev * hi));
  flux_at = 0;
  for e = 1:size(edges, 1)
    cur = abs(kedge(e) * (st(edges(e, 1)) - st(edges(e, 2))));
    if cur > flux_at
      flux_at = cur;
    end
  end
  if flux_at <= roundoff
    break
  end
  hi = hi * 2;
end
for k = 1:90
  mid = 0.5 * (lo + hi);
  st = Eshut + Vsec * (amps .* exp(-ev * mid));
  flux_at = 0;
  for e = 1:size(edges, 1)
    cur = abs(kedge(e) * (st(edges(e, 1)) - st(edges(e, 2))));
    if cur > flux_at
      flux_at = cur;
    end
  end
  if flux_at > roundoff
    lo = mid;
  else
    hi = mid;
  end
end
fails = lineout(fid, fails, 'shutdown_clock_time', hi, 6.9213540350682152e+01, 1e-12);
fails = lineout(fid, fails, 'shutdown_clock_seconds', hi * r0 / c, 4.6174303925072154e-06, 1e-12);
st0 = Sclock;
flux0 = 0;
bare_max = 0;
bare_open = 0;
one_max = 0;
Eone = Sbare;
Eone(1) = Eshut;
for e = 1:size(edges, 1)
  cur = abs(kedge(e) * (st0(edges(e, 1)) - st0(edges(e, 2))));
  if cur > flux0
    flux0 = cur;
  end
  gapb = Sbare(edges(e, 1)) - Sbare(edges(e, 2));
  fbare = kedge(e) * gam / (2 * kedge(e) + gam) * gapb;
  if abs(fbare) > bare_max
    bare_max = abs(fbare);
  end
  if abs(fbare) > 0
    bare_open = bare_open + 1;
  end
  gap1 = Eone(edges(e, 1)) - Eone(edges(e, 2));
  fone = abs(kedge(e) * gam / (2 * kedge(e) + gam) * gap1);
  if fone > one_max
    one_max = fone;
  end
end
fails = lineout(fid, fails, 'shutdown_current0', flux0, 6.9999121186276561e-02, 0);
fails = lineout(fid, fails, 'shutdown_bare_max', bare_max, 5.8061061286508266e-02, 1e-15);
fails = lineout(fid, fails, 'shutdown_bare_open', bare_open, 13, 0);
fails = lineout(fid, fails, 'shutdown_one_boundary', one_max, 1.4485873046876672e-02, 1e-15);
k5 = 0.0985871397275971;
op5 = 0.9501974701670142;
cl5 = -0.6456729548144859;
den5 = 2 * k5 + gam;
So5 = op5 - k5 * (op5 - cl5) / den5;
Sc5 = cl5 + k5 * (op5 - cl5) / den5;
d05 = So5 - Sc5;
fails = lineout(fid, fails, 'depth5_steady_open', So5, 6.9855345216481501e-01, 0);
fails = lineout(fid, fails, 'depth5_steady_closed', Sc5, -3.9402893681228679e-01, 0);
fails = lineout(fid, fails, 'depth5_shutdown_mean', 0.5 * (So5 + Sc5), 1.5226225767626411e-01, 0);
fails = lineout(fid, fails, 'depth5_shutdown_action', d05 ^ 2 / 8, 1.4921703458786387e-01, 0);
t5 = log(abs(k5 * d05) / roundoff) / den5;
fails = lineout(fid, fails, 'depth5_shutdown_time', t5, 5.8520368540428223e+01, 0);
fails = lineout(fid, fails, 'depth5_shutdown_seconds', t5 * r0 / c, 3.9040587565700679e-06, 1e-15);
fails = lineout(fid, fails, 'gate_h_optics', kap, 1.0001300937604073e-01, 0);
fails = lineout(fid, fails, 'gate_h_depth5', k5, 9.8587139727597098e-02, 0);
fails = lineout(fid, fails, 'gate_h_product_depth5', -k5, -9.8587139727597098e-02, 0);

% Join. Added tension V * tau. Phi' = -V b / (2 r (r - b)).
fails = lineout(fid, fails, 'join_weight_sixth', r0 / (2 * (2 * r0 - Rs6)), 3 / 11, 1e-15);
fails = lineout(fid, fails, 'join_weight_half', r0 / (2 * (2 * r0 - Rsh)), 1 / 3, 0);
fails = lineout(fid, fails, 'join_residue', r0 / (2 * r0), 1 / 2, 0);
tide = c ^ 2 * Vpot / (2 * r0 ^ 2);
accel = c ^ 2 * Vpot / (2 * r0);
fails = lineout(fid, fails, 'join_static_tide', tide, 9.8788777149220645e+12, 0);
fails = lineout(fid, fails, 'join_static_accel', accel, 1.9757755429844131e+14, 0);
fails = lineout(fid, fails, 'join_tide_off', 0 * tide, 0, 0);
fails = lineout(fid, fails, 'join_coast_radicand', g / 10 - tide, -9.8788777149210840e+12, 0);
fails = lineout(fid, fails, 'join_tide_over_load', tide / (g / 10), 1.0073651771932379e+13, 0);
fails = boundout(fid, fails, 'join_coast_radicand_negative', g / 10 - tide, 0);
fails = boundout(fid, fails, 'join_load_under_tide', g / 10, tide);
r30 = 30;
b30s = Rs6 + (r0 - Rs6) * r0 / r30;
b30h = Rsh + (r0 - Rsh) * r0 / r30;
pole6 = (r30 - r0) * b30s / (2 * r30 * (r30 - b30s)) - b30s / (2 * (r30 + r0 - Rs6));
poleh = (r30 - r0) * b30h / (2 * r30 * (r30 - b30h)) - b30h / (2 * (r30 + r0 - Rsh));
fails = lineout(fid, fails, 'join_pole_thirty_sixth', pole6, 0, 1e-15);
fails = lineout(fid, fails, 'join_pole_thirty_half', poleh, 0, 1e-15);
cut6 = join_log(40, Rs6, Vpot) - join_log(r0 + 1e-6, Rs6, Vpot);
cuth = join_log(40, Rsh, Vpot) - join_log(r0 + 1e-6, Rsh, Vpot);
fails = lineout(fid, fails, 'join_cutoff_sixth', cut6, -3.8139089617420829e-01, 0);
fails = lineout(fid, fails, 'join_cutoff_half', cuth, -4.6977014152602592e-01, 0);
span6 = join_log(40, Rs6, Vpot) - join_log(25, Rs6, Vpot);
spanh = join_log(40, Rsh, Vpot) - join_log(25, Rsh, Vpot);
quad6 = integral(@(rr) join_phi(rr, Rs6, Vpot), 25, 40, 'AbsTol', 1e-14, 'RelTol', 1e-14);
quadh = integral(@(rr) join_phi(rr, Rsh, Vpot), 25, 40, 'AbsTol', 1e-14, 'RelTol', 1e-14);
fails = lineout(fid, fails, 'join_span_sixth', span6, -1.8726515999694673e-02, 0);
fails = lineout(fid, fails, 'join_span_half', spanh, -2.5196758599871052e-02, 0);
fails = lineout(fid, fails, 'join_span_quad_sixth', quad6, span6, 1e-15);
fails = lineout(fid, fails, 'join_span_quad_half', quadh, spanh, 1e-15);
fails = lineout(fid, fails, 'join_phi_off', join_phi(r30, Rs6, 0), 0, 0);

% Entry. Equilibria go to the mean. The difference decays. The sum mode is absent.
den = 2 * kap + gam;
dlt = gam * gap / den;
fails = lineout(fid, fails, 'entry_difference', dlt, 1.0947247366745378, 0);
Eo = 0.9536594523121079;
Ec = -0.6526335205358984;
fails = lineout(fid, fails, 'entry_sum', (Eo + Ec) - 2 * ((Eo + Ec) / 2), 0, 0);
Vswitch = den * dlt ^ 2 / 4;
fails = lineout(fid, fails, 'entry_switch', Vswitch, 1.8817310515070426e-01, 0);
fails = lineout(fid, fails, 'entry_switch_form', gam ^ 2 * gap ^ 2 / (4 * den), Vswitch, 1e-15);
fails = lineout(fid, fails, 'entry_ratio', gam / (2 * kap), 2.1399388376086073, 1e-15);
fails = lineout(fid, fails, 'entry_ratio_potential', Vswitch / Vpot, gam / (2 * kap), 1e-15);
Vgate = (g / 10) * 2 * r0 ^ 2 / c ^ 2;
fails = lineout(fid, fails, 'entry_gate', Vgate, 8.7290957377585730e-15, 0);
tide_switch = c ^ 2 * Vswitch / (2 * r0 ^ 2);
fails = lineout(fid, fails, 'entry_tide_switch', tide_switch, 2.1140194094147898e+13, 0);
fails = lineout(fid, fails, 'entry_tide_over_join', tide_switch / tide, gam / (2 * kap), 1e-15);
fails = lineout(fid, fails, 'entry_radicand_switch', g / 10 - tide_switch, -2.1140194094146918e+13, 0);
fails = boundout(fid, fails, 'entry_radicand_switch_negative', g / 10 - tide_switch, 0);
fails = lineout(fid, fails, 'entry_radicand_gate', g / 10 - c ^ 2 * Vgate / (2 * r0 ^ 2), 0, 0);
fails = lineout(fid, fails, 'entry_throat_speed', 0, 0, 0);
tpin = log(Vswitch / Vgate) / (2 * den);
fails = lineout(fid, fails, 'entry_pin_time', tpin, 2.4441342370391848e+01, 0);
fails = lineout(fid, fails, 'entry_seconds', tpin * r0 / c, 1.6305508506416028e-06, 0);
tf6 = log(Vswitch / (Vgate * 96 / 7)) / (2 * den);
tfh = log(Vswitch / (Vgate * 32 / 3)) / (2 * den);
fails = lineout(fid, fails, 'entry_face_sixth', tf6 * r0 / c, 1.4914871060426914e-06, 0);
fails = lineout(fid, fails, 'entry_face_half', tfh * r0 / c, 1.5048342713765240e-06, 0);
fails = boundout(fid, fails, 'entry_face_before_throat_sixth', tf6, tpin);
fails = boundout(fid, fails, 'entry_face_before_throat_half', tfh, tpin);
seated_flux = 0.10948671535321428;
rnd = 1.3877787807814457e-17;
Vfloor = Vswitch * (rnd / seated_flux) ^ 2;
fails = lineout(fid, fails, 'entry_floor', Vfloor, 3.0232578084704490e-33, 0);
fails = boundout(fid, fails, 'entry_floor_under_gate', Vfloor, Vgate);

% Inventory. The energy is a function of b(r). The call does not enter it.
frac = 1 - r0 / 40;
fails = lineout(fid, fails, 'inventory_fraction', frac, 1 / 2, 0);
fails = lineout(fid, fails, 'inventory_side_sixth', E6s, -1.0085463036151720e45, 0);
fails = lineout(fid, fails, 'inventory_side_half', Ehs, -6.0512778216910312e44, 0);
fails = lineout(fid, fails, 'inventory_side_match_sixth', E6s, -5 * M6 * c ^ 2, 1e-15);
fails = lineout(fid, fails, 'inventory_side_match_half', Ehs, -1 * Mh * c ^ 2, 1e-15);
fails = lineout(fid, fails, 'inventory_outer_sixth', E6s - E6s / 2, E6s / 2, 0);
fails = lineout(fid, fails, 'inventory_outer_half', Ehs - Ehs / 2, Ehs / 2, 0);
fails = lineout(fid, fails, 'inventory_cross_sixth', E6s / 2 + E6s / 2, E6s, 0);
fails = lineout(fid, fails, 'inventory_cross_half', Ehs / 2 + Ehs / 2, Ehs, 0);
fails = lineout(fid, fails, 'inventory_rest_sixth', 4 * E6s - E6s, 3 * E6s, 0);
fails = lineout(fid, fails, 'inventory_rest_half', 4 * Ehs - Ehs, 3 * Ehs, 0);
fails = lineout(fid, fails, 'inventory_rest_float_sixth', 3 * E6s, -3.0256389108455160e45, 0);
fails = lineout(fid, fails, 'inventory_rest_float_half', 3 * Ehs, -1.8153833465073093e45, 0);
fails = lineout(fid, fails, 'inventory_share', E6s / (4 * E6s), 1 / 4, 0);
fails = lineout(fid, fails, 'inventory_share_half', Ehs / (4 * Ehs), 1 / 4, 0);
fails = lineout(fid, fails, 'inventory_pair_match_sixth', 4 * E6s, -20 * M6 * c ^ 2, 1e-15);
fails = lineout(fid, fails, 'inventory_pair_match_half', 4 * Ehs, -4 * Mh * c ^ 2, 1e-15);
twait = tpin * r0 / c;
fails = lineout(fid, fails, 'inventory_wait_sixth', (E6s / t6c) * twait, -7.7225912197496652e38, 0);
fails = lineout(fid, fails, 'inventory_wait_half', (Ehs / thc) * twait, -4.5579641270621957e38, 0);
fails = lineout(fid, fails, 'inventory_wait_ratio_sixth', twait / t6c, 7.6571508834723282e-07, 0);
fails = lineout(fid, fails, 'inventory_wait_ratio_half', twait / thc, 7.5322341187575335e-07, 0);
fails = lineout(fid, fails, 'inventory_hold', E6s * frac - E6s * frac, 0, 0);
fails = lineout(fid, fails, 'inventory_tension_switch', 1 + Vswitch, 1.1881731051507043, 0);
fails = lineout(fid, fails, 'inventory_tension_gate', 1 + Vgate, 1.0000000000000087, 0);
fails = lineout(fid, fails, 'inventory_tension_floor', 1 + Vfloor, 1, 0);

% Departure. The ship leaves the 40 m face while V falls.
lam = 2 * den * c / r0;
fails = lineout(fid, fails, 'depart_rate', lam, 1.8829048865070052e+07, 0);
Cinf = integral(@(u) 1 - sqrt(1 - exp(-u)), 0, Inf);
fails = lineout(fid, fails, 'depart_startup', Cinf / lam, 3.2593554942009756e-08, 0);
vface = sqrt(g / ((1 / 6400) * 10));
tfloor = log(Vswitch / Vfloor) / (2 * den) * r0 / c;
fails = lineout(fid, fails, 'depart_floor', tfloor, 3.8880657558015190e-06, 0);
t6s = tf6 * r0 / c;
ths = tfh * r0 / c;
tgate = tpin * r0 / c;
fails = lineout(fid, fails, 'depart_fraction_sixth', 1 - 7 / 96, 89 / 96, 0);
fails = lineout(fid, fails, 'depart_fraction_half', 1 - 3 / 32, 29 / 32, 0);
fails = boundout(fid, fails, 'depart_order_half', 1, 32 / 3);
fails = boundout(fid, fails, 'depart_order_sixth', 32 / 3, 96 / 7);
[gain6, cred6, dl6] = depart_shell(t6s, tfloor, lam, vface, r0, Rs6, g);
[gainh, credh, dlh] = depart_shell(ths, tfloor, lam, vface, r0, Rsh, g);
[gaing6, credg6, dlg6] = depart_shell(tgate, tfloor, lam, vface, r0, Rs6, g);
[gaingh, credgh, dlgh] = depart_shell(tgate, tfloor, lam, vface, r0, Rsh, g);
fails = lineout(fid, fails, 'depart_gain_sixth', gain6, 2.3639850948066918e-06, 0);
fails = lineout(fid, fails, 'depart_gain_half', gainh, 2.3506379294728594e-06, 0);
fails = lineout(fid, fails, 'depart_gain_gate_sixth', gaing6, 2.2249213327373510e-06, 0);
fails = lineout(fid, fails, 'depart_gain_gate_half', gaingh, 2.2249213327373510e-06, 0);
fails = lineout(fid, fails, 'depart_length_sixth', dl6, 1.8728157745384816e-04, 0);
fails = lineout(fid, fails, 'depart_length_half', dlh, 1.8622417731044248e-04, 0);
fails = lineout(fid, fails, 'depart_length_gate_sixth', dlg6, 1.7626455336844780e-04, 0);
fails = lineout(fid, fails, 'depart_length_gate_half', dlgh, 1.7626455336844780e-04, 0);
fails = lineout(fid, fails, 'depart_credit_sixth', cred6, 2.3639956658730360e-06, 0);
fails = lineout(fid, fails, 'depart_credit_half', credh, 2.3506472301665728e-06, 0);
fails = lineout(fid, fails, 'depart_credit_gate_sixth', credg6, 2.2249306967009249e-06, 0);
fails = lineout(fid, fails, 'depart_credit_gate_half', credgh, 2.2249296652070691e-06, 0);
fails = lineout(fid, fails, 'depart_gap_sixth', cred6 - gain6, 0, 1e-10);
fails = lineout(fid, fails, 'depart_gap_half', credh - gainh, 0, 1e-10);
fails = lineout(fid, fails, 'depart_gap_gate_sixth', credg6 - gaing6, 0, 1e-10);
fails = lineout(fid, fails, 'depart_gap_gate_half', credgh - gaingh, 0, 1e-10);
fails = lineout(fid, fails, 'depart_window_sixth', tfloor - t6s, 2.3965786497588276e-06, 0);
fails = lineout(fid, fails, 'depart_window_half', tfloor - ths, 2.3832314844249952e-06, 0);
fails = lineout(fid, fails, 'depart_window_gate', tfloor - tgate, 2.2575149051599162e-06, 0);
fails = boundout(fid, fails, 'depart_credit_pos_sixth', 0, cred6);
fails = boundout(fid, fails, 'depart_credit_pos_half', 0, credh);
fails = boundout(fid, fails, 'depart_credit_pos_gate_sixth', 0, credg6);
fails = boundout(fid, fails, 'depart_credit_pos_gate_half', 0, credgh);
fails = boundout(fid, fails, 'depart_credit_inside_sixth', cred6, tfloor - t6s);
fails = boundout(fid, fails, 'depart_credit_inside_half', credh, tfloor - ths);
fails = boundout(fid, fails, 'depart_credit_inside_gate_sixth', credg6, tfloor - tgate);
fails = boundout(fid, fails, 'depart_credit_inside_gate_half', credgh, tfloor - tgate);
fails = boundout(fid, fails, 'depart_face_before_gate_sixth', credg6, cred6);
fails = boundout(fid, fails, 'depart_face_before_gate_half', credgh, credh);
fails = lineout(fid, fails, 'depart_arrival_floor_sixth', tfloor + t6c, 2.1294523937248067e+00, 0);
fails = lineout(fid, fails, 'depart_arrival_face_sixth', tfloor + t6c - cred6, 2.1294500297291408e+00, 0);
fails = lineout(fid, fails, 'depart_arrival_gate_sixth', tfloor + t6c - credg6, 2.1294501687941101e+00, 0);
fails = lineout(fid, fails, 'depart_arrival_floor_half', tfloor + thc, 2.1647677880367349e+00, 0);
fails = lineout(fid, fails, 'depart_arrival_face_half', tfloor + thc - credh, 2.1647654373895047e+00, 0);
fails = lineout(fid, fails, 'depart_arrival_gate_half', tfloor + thc - credgh, 2.1647655631070695e+00, 0);

% Release. The added tension through the 40 m face follows V.
% The coordinate mass is a different integral.
measure = c ^ 4 / (2 * G);
arm = @(Rs, R) Rs .* log(R ./ r0) + (r0 - Rs) .* (1 - r0 ./ R);
arm6 = arm(Rs6, 40);
armh = arm(Rsh, 40);
n6 = integral(@(r) (Rs6 + (r0 - Rs6) * r0 ./ r) ./ r, r0, 40, 'AbsTol', 1e-14, 'RelTol', 1e-14);
nh = integral(@(r) (Rsh + (r0 - Rsh) * r0 ./ r) ./ r, r0, 40, 'AbsTol', 1e-14, 'RelTol', 1e-14);
fails = lineout(fid, fails, 'release_arm_sixth', arm6, 1.0643823935199819e+01, 0);
fails = lineout(fid, fails, 'release_arm_half', armh, 1.1931471805599454e+01, 0);
fails = lineout(fid, fails, 'release_arm_num_sixth', n6, arm6, 0);
fails = lineout(fid, fails, 'release_arm_num_half', nh, armh, 0);
fails = lineout(fid, fails, 'release_rational_sixth', (r0 - Rs6) / 2, 25 / 3, 0);
fails = lineout(fid, fails, 'release_rational_half', (r0 - Rsh) / 2, 5, 0);
fails = lineout(fid, fails, 'release_log_sixth', Rs6 * log(2), 2.3104906018664844e+00, 0);
fails = lineout(fid, fails, 'release_log_half', Rsh * log(2), 6.9314718055994531e+00, 0);
fails = lineout(fid, fails, 'release_split_sixth', (r0 - Rs6) / 2 + Rs6 * log(2), arm6, 0);
fails = lineout(fid, fails, 'release_split_half', (r0 - Rsh) / 2 + Rsh * log(2), armh, 0);
P6r = measure * arm6;
Phr = measure * armh;
fails = lineout(fid, fails, 'release_base_sixth', P6r, 6.4408735717058822e+44, 0);
fails = lineout(fid, fails, 'release_base_half', Phr, 7.2200650717355826e+44, 0);
fails = lineout(fid, fails, 'release_base_ratio_sixth', P6r / E6s, -6.3862943611198908e-01, 0);
fails = lineout(fid, fails, 'release_base_ratio_half', Phr / Ehs, -1.1931471805599456e+00, 0);
fails = lineout(fid, fails, 'release_base_over_span_sixth', P6r / E6s, -arm6 / (r0 - Rs6), 0);
fails = lineout(fid, fails, 'release_base_over_span_half', Phr / Ehs, -armh / (r0 - Rsh), 1e-15);
fails = lineout(fid, fails, 'release_seated_sixth', Vpot * P6r, 5.6637094414596373e+43, 0);
fails = lineout(fid, fails, 'release_seated_half', Vpot * Phr, 6.3488826879598768e+43, 0);
fails = lineout(fid, fails, 'release_switch_sixth', Vswitch * P6r, 1.2119991798710031e+44, 0);
fails = lineout(fid, fails, 'release_switch_half', Vswitch * Phr, 1.3586220639386268e+44, 0);
fails = lineout(fid, fails, 'release_switch_ratio_sixth', Vswitch * P6r / E6s, -1.2017288403383629e-01, 0);
fails = lineout(fid, fails, 'release_switch_ratio_half', Vswitch * Phr / Ehs, -2.2451820986777293e-01, 0);
fails = lineout(fid, fails, 'release_floor_sixth', Vfloor * P6r, 1.9472421319030759e+12, 0);
fails = lineout(fid, fails, 'release_floor_half', Vfloor * Phr, 2.1828118105789353e+12, 0);
fails = lineout(fid, fails, 'release_floor_over_switch', Vfloor / Vswitch, 1.6066365095315717e-32, 0);
fails = boundout(fid, fails, 'release_floor_pos_sixth', 0, Vfloor * P6r);
fails = boundout(fid, fails, 'release_floor_pos_half', 0, Vfloor * Phr);

% Level. The face speed held on the whole corridor. The load follows kappa.
fails = lineout(fid, fails, 'level_load_sixth', (11 / 4800) / (1 / 6400), 44 / 3, 0);
fails = lineout(fid, fails, 'level_load_half', (3 / 1600) / (1 / 6400), 12, 0);
fails = lineout(fid, fails, 'level_width_sixth', 10 * (1 / 6400) / (11 / 4800), 15 / 22, 1e-15);
fails = lineout(fid, fails, 'level_width_half', 10 * (1 / 6400) / (3 / 1600), 5 / 6, 0);
fails = lineout(fid, fails, 'level_accel_sixth', (44 / 3) * g, 1.4383086666666665e+02, 0);
fails = lineout(fid, fails, 'level_accel_half', 12 * g, 1.1767980000000000e+02, 0);
fails = lineout(fid, fails, 'level_haul_gap_sixth', (44 / 3) * g - 143.83086666667677, -1.0118128557223827e-11, 0);
fails = lineout(fid, fails, 'level_haul_gap_half', 12 * g - 117.67980000000821, -8.2138740253867581e-12, 0);
fails = lineout(fid, fails, 'level_time_sixth', (2 * L6) / vface, 9.0743764738162136e-01, 0);
fails = lineout(fid, fails, 'level_time_half', (2 * Lh) / vface, 9.8652776266715214e-01, 0);
fails = lineout(fid, fails, 'level_save_sixth', t6c - (2 * L6) / vface, 1.2220108582774292e+00, 0);
fails = lineout(fid, fails, 'level_save_half', thc - (2 * Lh) / vface, 1.1782361373038266e+00, 0);
fails = lineout(fid, fails, 'level_fraction_sixth', ((2 * L6) / vface) / t6c, 4.2613739894159836e-01, 0);
fails = lineout(fid, fails, 'level_fraction_half', ((2 * Lh) / vface) / thc, 4.5572071978860035e-01, 0);
inner = @(Rs, R) scale_t * integral(@(ss) geom_t(ss, Rs), 0, sqrt(R - r0), 'AbsTol', 1e-14, 'RelTol', 1e-14);
i621 = inner(Rs6, 21);
ih21 = inner(Rsh, 21);
i625 = inner(Rs6, 25);
ih25 = inner(Rsh, 25);
i630 = inner(Rs6, 30);
ih30 = inner(Rsh, 30);
i635 = inner(Rs6, 35);
ih35 = inner(Rsh, 35);
fails = lineout(fid, fails, 'level_inner_sixth_21', i621, 6.2600461999639945e-01, 0);
fails = lineout(fid, fails, 'level_inner_half_21', ih21, 6.2663062751189758e-01, 0);
fails = lineout(fid, fails, 'level_inner_sixth_25', i625, 1.3020395017392921e+00, 0);
fails = lineout(fid, fails, 'level_inner_half_25', ih25, 1.3082905052400311e+00, 0);
fails = lineout(fid, fails, 'level_inner_sixth_30', i630, 1.7047896534427860e+00, 0);
fails = lineout(fid, fails, 'level_inner_half_30', ih30, 1.7203533049883160e+00, 0);
fails = lineout(fid, fails, 'level_inner_sixth_35', i635, 1.9542666766735994e+00, 0);
fails = lineout(fid, fails, 'level_inner_half_35', ih35, 1.9797479951495631e+00, 0);
fails = lineout(fid, fails, 'level_share_sixth_21', i621 / t6c, 2.9397499790804055e-01, 0);
fails = lineout(fid, fails, 'level_share_half_21', ih21 / thc, 2.8946834688082995e-01, 0);
fails = lineout(fid, fails, 'level_share_sixth_25', i625 / t6c, 6.1144446474244241e-01, 0);
fails = lineout(fid, fails, 'level_share_half_25', ih25 / thc, 6.0435713347657460e-01, 0);
fails = lineout(fid, fails, 'level_share_sixth_30', i630 / t6c, 8.0057801299833009e-01, 0);
fails = lineout(fid, fails, 'level_share_half_30', ih30 / thc, 7.9470712949868538e-01, 0);
fails = lineout(fid, fails, 'level_share_sixth_35', i635 / t6c, 9.1773370968121459e-01, 0);
fails = lineout(fid, fails, 'level_share_half_35', ih35 / thc, 9.1453298679643724e-01, 0);
fails = lineout(fid, fails, 'level_outer_sixth', 1 - i635 / t6c, 8.2266290318785407e-02, 0);
fails = lineout(fid, fails, 'level_outer_half', 1 - ih35 / thc, 8.5467013203562758e-02, 0);

% Fit. The level width. Lateral load at the level speed scales as kappa.
Wfit6 = 15 / 22;
Wfith = 5 / 6;
kfit = @(Rs, r) Rs ./ (2 .* r .^ 3) + (r0 - Rs) .* r0 ./ r .^ 4;
fails = lineout(fid, fails, 'fit_beam_sixth', Wfit6 / 10, 3 / 44, 0);
fails = lineout(fid, fails, 'fit_beam_half', Wfith / 10, 1 / 12, 1e-15);
fails = lineout(fid, fails, 'fit_span_sixth', 10 / Wfit6, 44 / 3, 1e-15);
fails = lineout(fid, fails, 'fit_span_half', 10 / Wfith, 12, 0);
fails = lineout(fid, fails, 'fit_face_sixth', (1 / 6400) / (11 / 4800), 3 / 44, 0);
fails = lineout(fid, fails, 'fit_face_half', (1 / 6400) / (3 / 1600), 1 / 12, 1e-15);
fails = lineout(fid, fails, 'fit_station_sixth_25', kfit(Rs6, 25) / kfit(Rs6, r0), 576 / 1375, 0);
fails = lineout(fid, fails, 'fit_station_half_25', kfit(Rsh, 25) / kfit(Rsh, r0), 832 / 1875, 1e-15);
fails = lineout(fid, fails, 'fit_station_sixth_30', kfit(Rs6, 30) / kfit(Rs6, r0), 184 / 891, 1e-15);
fails = lineout(fid, fails, 'fit_station_half_30', kfit(Rsh, 30) / kfit(Rsh, r0), 56 / 243, 1e-15);
fails = boundout(fid, fails, 'fit_under_sixth_21', kfit(Rs6, 21) / kfit(Rs6, r0), 1);
fails = boundout(fid, fails, 'fit_under_half_21', kfit(Rsh, 21) / kfit(Rsh, r0), 1);
fails = boundout(fid, fails, 'fit_under_sixth_35', kfit(Rs6, 35) / kfit(Rs6, r0), 1);
fails = boundout(fid, fails, 'fit_under_half_35', kfit(Rsh, 35) / kfit(Rsh, r0), 1);
fails = lineout(fid, fails, 'fit_along_throat_sixth', fit_along(r0, Rs6, Wfit6), 0, 0);
fails = lineout(fid, fails, 'fit_along_throat_half', fit_along(r0, Rsh, Wfith), 0, 0);
fails = lineout(fid, fails, 'fit_along_base_sixth', fit_along(40, Rs6, 10), 253.10812582079262, 0);
fails = lineout(fid, fails, 'fit_along_base_half', fit_along(40, Rsh, 10), 217.0794515126316, 1e-15);
fails = lineout(fid, fails, 'fit_along_sixth', fit_along(40, Rs6, Wfit6), (44 / 3) * 253.10812582079262, 1e-15);
fails = lineout(fid, fails, 'fit_along_half', fit_along(40, Rsh, Wfith), 12 * 217.0794515126316, 1e-15);
fails = lineout(fid, fails, 'fit_throat_sixth', sqrt(g / (kfit(Rs6, r0) * Wfit6)), vface, 0);
fails = lineout(fid, fails, 'fit_throat_half', sqrt(g / (kfit(Rsh, r0) * Wfith)), vface, 0);
fails = lineout(fid, fails, 'fit_pace_sixth', 2.1294485056590506 * sqrt(3 / 44), 5.5603410651523666e-01, 0);
fails = lineout(fid, fails, 'fit_pace_half', 2.1647638999709788 * sqrt(1 / 12), 6.2491351019011432e-01, 0);
fails = lineout(fid, fails, 'fit_pace_clock_sixth', t6c * sqrt(3 / 44), 5.5603410651523666e-01, 0);
fails = lineout(fid, fails, 'fit_pace_clock_half', thc * sqrt(1 / 12), 6.2491351019011432e-01, 0);
fails = lineout(fid, fails, 'fit_pace_face_sixth', vface * sqrt(44 / 3), 3.0340032080844389e+02, 1e-15);
fails = lineout(fid, fails, 'fit_pace_face_half', vface * sqrt(12), 2.7443591601683625e+02, 1e-15);
df6 = fit_dash(Rs6, Wfit6);
dfh = fit_dash(Rsh, Wfith);
fails = lineout(fid, fails, 'fit_dash_sixth', df6, 8.8329624284095409e-01, 0);
fails = lineout(fid, fails, 'fit_dash_half', dfh, 9.5812460832479873e-01, 0);
fails = lineout(fid, fails, 'fit_dash_known_sixth', fit_dash(Rs6, 10), 2.673195444892207, 1e-10);
fails = lineout(fid, fails, 'fit_dash_known_half', fit_dash(Rsh, 10), 2.6834241126491603, 1e-10);
fails = lineout(fid, fails, 'fit_dash_face_sixth', sqrt(vface ^ 2 + 2 * g * L6), 8.3553897883482847e+01, 1e-15);
fails = lineout(fid, fails, 'fit_dash_face_half', sqrt(vface ^ 2 + 2 * g * Lh), 8.3920794764217078e+01, 1e-15);
fails = lineout(fid, fails, 'fit_ballistic_sixth', sqrt(2 * g * L6), 2.6551795636519170e+01, 0);
fails = lineout(fid, fails, 'fit_ballistic_half', sqrt(2 * g * Lh), 2.7684721307209220e+01, 0);
fails = boundout(fid, fails, 'fit_ballistic_under_sixth', sqrt(2 * g * L6), vface);
fails = boundout(fid, fails, 'fit_ballistic_under_half', sqrt(2 * g * Lh), vface);

% Lane. The 1 g run outside the face, up to the face speed.
laneT = vface / g;
fails = lineout(fid, fails, 'lane_length', vface ^ 2 / (2 * g), 320, 1e-15);
fails = lineout(fid, fails, 'lane_speed_square', vface ^ 2, 640 * g, 1e-15);
fails = lineout(fid, fails, 'lane_time', laneT, 8.0784799084102072e+00, 0);
fails = lineout(fid, fails, 'lane_one_sixth', laneT + (2 * L6) / vface, 8.9859175557918292e+00, 0);
fails = lineout(fid, fails, 'lane_one_half', laneT + (2 * Lh) / vface, 9.0650076710773586e+00, 0);
fails = lineout(fid, fails, 'lane_door_sixth', 2 * laneT + (2 * L6) / vface, 1.7064397464202035e+01, 0);
fails = lineout(fid, fails, 'lane_door_half', 2 * laneT + (2 * Lh) / vface, 1.7143487579487566e+01, 0);
fails = boundout(fid, fails, 'lane_rest_under_door_sixth', 2 * sqrt((2 * L6) / g), 2 * laneT + (2 * L6) / vface);
fails = boundout(fid, fails, 'lane_rest_under_door_half', 2 * sqrt((2 * Lh) / g), 2 * laneT + (2 * Lh) / vface);

fprintf(fid, 'NOTE the gate h on a pair is that pair kappa. The pin files were not edited.\n');
fprintf(fid, 'NOTE momentum_rhs takes rho, v, dv_dx, d2v_dx2, dP_dx, D_eff, observed. It does not take the flux.\n');
fprintf(fid, 'NOTE the closed depth-5 value is the unobserved reading of Particle_Physics and Quantum_Mechanics.\n');

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

function y = join_phi(r, Rs, V)
  r0 = 20;
  b = Rs + (r0 - Rs) .* r0 ./ r;
  y = -V .* b ./ (2 .* r .* (r - b));
end

function y = join_log(r, Rs, V)
  r0 = 20;
  y = V ./ (2 .* (Rs - 2 .* r0)) .* ( ...
    r0 .* log(r - r0) + (Rs - 2 .* r0) .* log(r) ...
    - (Rs - r0) .* log(r + r0 - Rs));
end

function [gain, cred, dl] = depart_shell(t0, tfloor, lam, vface, r0, Rs, g)
  gain = (tfloor - t0) - integral(@(t) 1 - sqrt(1 - exp(-lam * (t - t0))), t0, tfloor);
  dl = gain * vface;
  b = Rs + (r0 - Rs) * r0 / 40;
  gp = 1 - b / 40;
  rfin = 40 - dl * sqrt(gp);
  scale = sqrt(10 / (2 * g));
  geom = @(ss) 2 * sqrt(Rs * ss .^ 2 + r0 * (2 * r0 - Rs)) ./ ((ss .^ 2 + r0) .* sqrt(ss .^ 2 + (2 * r0 - Rs)));
  cred = scale * integral(geom, sqrt(rfin - r0), sqrt(r0), 'AbsTol', 1e-16, 'RelTol', 1e-14);
end

function a = fit_along(r, Rs, W)
  r0 = 20;
  g = 9.80665;
  A = (r0 - Rs) * r0;
  b = Rs + A ./ r;
  k = Rs ./ (2 .* r .^ 3) + A ./ r .^ 4;
  kp = -3 .* Rs ./ (2 .* r .^ 4) - 4 .* A ./ r .^ 5;
  a = -(g ./ (2 .* W)) .* (kp ./ k .^ 2) .* sqrt(1 - b ./ r);
end

function v = fit_speed(s, Rs, W, vt2)
  r0 = 20;
  g = 9.80665;
  r = r0 + s .^ 2;
  A = (r0 - Rs) .* r0;
  k = Rs ./ (2 .* r .^ 3) + A ./ r .^ 4;
  a = Rs ./ (2 .* r0);
  d = 1 - a;
  u = r ./ r0;
  disc = sqrt((u - a) .^ 2 - d .^ 2);
  sig = r0 .* (disc + a .* log((u - a + disc) ./ d));
  sig(s == 0) = 0;
  b = Rs + A ./ r;
  raw = 2 .* s ./ sqrt(1 - b ./ r);
  raw(s == 0) = 2 * r0 / sqrt(2 * r0 - Rs);
  vp = sqrt(g ./ (k .* W));
  va = sqrt(vt2 + 2 .* g .* sig);
  v = raw ./ min(vp, va);
end

function t = fit_dash(Rs, W)
  r0 = 20;
  g = 9.80665;
  k0 = Rs / (2 * r0 ^ 3) + (r0 - Rs) * r0 / r0 ^ 4;
  vt2 = g / (k0 * W);
  t = 2 * integral(@(s) fit_speed(s, Rs, W, vt2), 0, sqrt(r0), 'AbsTol', 1e-12, 'RelTol', 1e-12);
end
