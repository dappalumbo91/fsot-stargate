% Gate stamp. MATLAB syntax, run here in Octave.
% The shape, the lateral coefficient, the proper length, and one scheduled
% crossing. Not a Warp Factory metric. The pin is not an input.

function dial_gate_stamp()
r0 = 20;
g = 9.80665;
c = 2.99792458e8;
G = 6.67430e-11;
n = 400000;
fid = fopen('data/dial_gate_stamp.txt', 'w');
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

fprintf(fid, 'fails %d\n', fails);
fprintf('fails %d\n', fails);
fclose(fid);
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
