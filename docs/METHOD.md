# How the 0.10c shell is built

This is a constant-speed metric in Warp Factory. The ship speed is the amplitude of the shift. It does not enter the shape of the shell or the shape of the shift profile.

## The shell

FSOT 2.1, pin AEB2AD, supplies the relaxation length of the scalar transport law in `vendor/fsot_dynamics.py`:

```
kappa = (POOF + SUCTION) * A_BLEED
gamma = |CHAOS| + PSI_CON * POOF
ell   = sqrt(kappa / gamma) = 0.8573494832025231
```

The wall is one relaxation length:

```
R1 = R2 * (1 - ell)
```

The outer radius is the one at which a shell of the pin's gluon-condensate density, with that wall fraction, has compactness 1/2. With the constants that wrote the shell file (`c = 2.99792e8`, `G = 6.674e-11`):

```
M = (1/2) * R2 * c² / (2 G)
```

That file is `data/shell_env.txt`:

| Quantity | Value |
| --- | --- |
| Cavity radius R1 | 1399.567 m |
| Outer radius R2 | 9811.159 m |
| Mass | 3.303043×10³⁰ kg |
| Unsmoothed density | 8.373888×10¹⁷ kg/m³ |

The first number in that file, 4.655124×10²⁴ kg, is a 110 m wall at the same density and the same wall fraction. The scorers read the radii and the mass. They do not use the first number.

On the 20 m grid the builder's mass smooth is four passes of 3.29 m, and the shift smooth is two passes of 1.84 m. `data/dial_cabin_vacuum.txt` records where that leaves the density and the shift. The unsmoothed inner radius is not the radius where the density is still zero.

Warp Factory integrates with `c = 2.99792458e8` and `G = 6.67430e-11`. Those constants put the same stored mass at Rs/R2 = 0.500021.

## The shift

Two profiles are built on the shell and smoothed twice with the solver's moving average, span 4000, before they are joined.

- `s` is the compact sigmoid: 1 in the cavity, 0 at the surface.
- `p` is the pressure fraction: 1 in the cavity, 0 outside, and `P / P(inner edge)` through the wall.

```
blend = s * (1 + p - s)
w     = min(1, s / p)    when p > 1e-8, else 1
cap   = s * (1 + (p - s) * w)
S     = s * blend + (1 - s) * cap
```

Where the sigmoid is still at least the pressure, the weight is 1, the cap equals the blend, and the mix is the blend. Below that crossing,

```
blend - cap = s * (p - s)² / p
```

so the cap sits under the mix, and the mix sits under the blend. Cabin `(1, 1)` is 1. Surface `(0, 0)` is 0. On the unit square the result is already between 0 and 1, so the closing clamp leaves it unchanged. The `1e-8` gate moves the join by at most `1e-16`.

The metric shift is `g_tx = -v S(r)` along the boost direction. `v` is the requested speed.

`lean/WarpMix.lean` proves those identities. `lean/WarpLedger.lean` proves the compactness mass, the bend-window chord and plateau, the payment identity, the printed clean and fail lines, and the ship-scale ledger. Neither file evaluates the Einstein tensor. The energy conditions are the Warp Factory witness in `data/dial_mix.txt`.

## The score

Warp Factory builds the comoving warp-shell metric at this mass and these radii, then replaces the shift with the mix. The Eulerian null, weak, strong, and dominant maps are read on the transverse grid. A point is clean when all four worst/peak ratios are under `1e-3`, the serious fraction is 0, the integrated energy is positive, and the peak shift equals the requested speed. `dial_mix.m`, `dial_mix_fine.m`, and `dial_flatball.m` apply that shift test in the clean flag, the same way `dial_fuchs_size.m` and `dial_cabin_gap.m` already did. The stored logs already satisfy it.

The scored grid at the clean point has `N = 160` and spacing `h = 166.790 m`. The raw Cartesian difference at `N = 320` (`h = 83.395 m`) puts the weak ratio at the central sample at 1.476×10⁻³. That log is `data/dial_mix_fine.txt`. The restored score is `data/dial_flatball.txt`. The same restoration at 0.11c is `data/dial_flatball_11.txt` on the 166.8 m grid and `data/dial_flatball_11_fine.txt` on the 83.4 m grid. Both fail in the outer wall.

The center census in `data/dial_center.txt` repeats both grids with the shift amplitude set to 0. The negative cavity cells are the four diagonal samples at `r = h / √2`. With the shift off, the 83.4 m weak ratio at that sample is 1.481×10⁻³, and the weak ratio times the sample radius is 0.0886 m on the coarse grid and 0.0873 m on the fine grid. One spacing farther out, the minimum weak ratio is positive on both grids.

The smoothed shell density is exactly zero for r < 87.55 m, and `B = 1` on that same interval. The shift profile is exactly 1 out past 500 m. Inside r < 87.55 m the continuum stress-energy is zero. The 83.4 m samples at 59 m lie in that ball. The 166.8 m samples at 118 m do not. `data/dial_flatball.txt` sets the stress-energy of every scored cell inside the ball back to zero and leaves every other cell on the Cartesian difference. The 166.8 m score has no such cell. The 83.4 m score then has its worst weak ratio at 4.006×10⁻⁷ in the exterior skirt.

## What was varied

Same body, same mass, same smoother. The ordinary compact sigmoid is clean at 0.075c and fails at 0.08c on the side of the wall. The blend `s(1 + p - s)` is clean through 0.095c and fails at 0.10c on the outer limb. The mix above is clean at 0.095c and at 0.10c on the 166.8 m grid. The same mix at 0.11c fails in the outer wall. Later joins that tried to hand the tail to the sigmoid also failed, and they lost the 0.10c pass with them. The pass remains the mix at 0.10c. On the 83.4 m grid the raw center sample is over the bar, and the flat-ball restoration puts that same 0.10c metric under the bar. The 0.11c failure in the outer wall is the same break on that finer grid. The same join at an outer radius of 20 m is `data/dial_fuchs_size.txt`. Compactness 1/3 there is the published mass and is clean at 0.06c. Compactness 1/2 is 1.5 times that mass and is clean at 0.10c. Their cabin, half the outer radius, is `data/dial_cabin_gap.txt`: clean at 0.04c when the compactness is 1/2, and over the bar at 0.06c. `data/dial_audit_bar.txt` repeats the 0.10c line and scores the same shell with the shift off. Both parked cases are clean. The write-up is [AUDIT.md](AUDIT.md).

The lighter 20 m runs keep that mix and that lapse and lower the compactness, so the density falls with the mass. `data/dial_mass_down.txt` is compactness 1/4 and 1/5. Both are clean at 0.04c and over the bar at 0.06c. `data/dial_mass_down_16.txt` is compactness 1/6 at 0.04c and fails on the outer shoulder. `data/dial_sixth_push.txt` places that same mass on the absolute slope of the mix. The shoulders clear and the inner edge fails. `data/dial_sixth_cover.txt` adds the wall to that slope and returns the sum to the same mass. `data/dial_sixth_max.txt` keeps the larger of the two densities and returns the total to the same mass. Both reopen the outer shoulder. `data/dial_sixth_band.txt` shows the 16.5 m notch already on the slope. `data/dial_sixth_inner.txt` restores the wall only in the foot and leaves that notch. `data/dial_sixth_chord.txt` holds the slope to a chord out to the shell face, clears the notch, and fails on the steepest slope. `data/dial_sixth_bend.txt` stops the chord one curvature-rise past the strongest bend and is clean at 0.04c at the same mass. `data/dial_seventh_bend.txt` is that window at compactness 1/7 and fails on the side. `data/dial_seventh_clip.txt` draws the chord to the shell face and applies it only inside the window; the break moves to 8.8 m. `data/dial_sixth_bend_06.txt` is the one-sixth window at 0.06c and fails across the side. `data/dial_seventh_plateau.txt` holds the max slope through the strongest bend and then falls to the slope at the window end. The side band clears and the steepest slope fails. The 0.10c pass remains compactness 1/2. The gravitational pull of that one-sixth mass, and the ship-scale sail ledger that follows from leaving the power plant at home, are written in [RESULTS.md](RESULTS.md). Those figures are not a Warp Factory grid.

`octave/dial_coast_stack.m` builds each of those two clean shapes once and changes only the shift amplitude. The half-compact wall uses the same mix as `dial_audit_bar.m`, at 0, 0.02, 0.04, 0.06, 0.08, and 0.10. The one-sixth bend window uses the same placement as `dial_sixth_bend.m`, at 0, 0.02, and 0.04. The log is `data/dial_coast_stack.txt`. Every tabulated coast is clean. No speed is inserted between those steps. `octave/dial_ship_beam.m` does not build a shell. It hands Minkowski dust, a forward null flux, and their sum to the same energy-condition function. The log is `data/dial_ship_beam.txt`. All three stay non-negative for the sampled Eulerian observers. The film hold from the lunar trip out to 0.04c is the acceleration already in `lean/WarpLedger.lean`. It is kinematics, not a metric score. The straight Earth–Moon beam table leaves both wells out. Hover on 10 tonnes is 14.7 TW. From a 200 km orbit the spiral to lunar distance is 6.770 km/s and 1.015×10¹⁶ J at any power. Mars, Jupiter, and Neptune use that same difference three times: 7.788 km/s to leave the 200 km orbit, the difference of the solar circular speeds, and the circular speed 200 km above the destination. The stacks are 16.898, 66.553, and 48.698 km/s. A short burn in that 200 km orbit, on the Hohmann excess, stacks 5.716, 23.985, and 15.451 km/s. The coasts are 259 days, 998 days, and 11,242 days. A short burn at Callisto's distance stacks 11.004 km/s. A short burn at Triton's distance stacks 11.271 km/s. With the beam held on across the gap, the trips at 1 TW are 8.06 days, 22.9 days, and 59.6 days, and at 15 TW they are 2.06 days, 5.83 days, and 15.3 days. The parabolic coasts are 69.9 days, 405 days, and 4,764 days. On the 63 TW plant the total trips are 1.00 day, 2.84 days, and 7.47 days. A one-day trip takes 507 TW at Jupiter and 3,745 TW at Neptune. At 1 µm the far-end aperture on the 1.13 km sheet is 69.4 m, 557 m, and 3.87 km, a matched return mirror is 34.7 m, 279 m, and 1.93 km, and at the 1 AU dust density the sheet sweeps 7.54 g across the Mars gap. The trip scorecard puts the Hohmann coasts, the parabolic coasts, and the powered total trips on one table. The sheet's matched mirror goes out on the parabola in 69.9 days, 405 days, and 4,764 days. Earth's rotation at 15 arcseconds a second walks an untracked ground beam by 5,000, 4.05×10⁴, and 2.83×10⁵ sheet-widths in one second. The Mars gap puts 0.51 peak-mass grains on each square metre of the sheet. The gate ledger keeps this architecture: the same pin, the same four documents, and a Warp Factory score only when a metric is justified. A shared entangled state is the candidate coupling between two mouths. It correlates outcomes and does not by itself carry a signal, a mass, or a ship. No entanglement factor is pasted onto the shell or the sail. The shell still uses the relaxation length as wall thickness, the pressure fraction inside the mix, and the 3.24 percent potential already scored. Density and pressure are the matter variables that metric reads.

`octave/dial_observers.m` takes the Eulerian tensor from those two shapes at shift off and at the clean speed. `octave/observer_lmi.m` minimizes the null contraction on the sphere, the weak and strong contractions on the ball, and reads the dominant slack from the rest-frame eigenvalues when the tensor has a timelike eigenvector. The log is `data/dial_observers.txt`. Every midplane cell is Type I. The minima stay under the 1e-3 bar, and the worst cell is the smoothing tail. The frame transfer is still the Eulerian one. The new step is the minimum over directions in that frame.

`octave/dial_observers_parked.m` runs that same reading at the stored failures, 0.11c on the half wall and 0.06c on the window. The log is `data/dial_observers_parked.txt`. The failing cells are in the outer wall and have no rest frame. `octave/dial_observers_fine.m` rebuilds the two clean shapes with the spacing cut in half and the smooth left at 4000. The log is `data/dial_observers_fine.txt`. The half-wall tail falls with the spacing. The window tail holds. `octave/passenger_score.m`, called from `octave/dial_passenger.m`, adds dust with coordinate velocity u^i = 0 to the coordinate stress-energy, scales the midplane ring integral to 10,000 kg, and reads the sum. The log is `data/dial_passenger.txt`. The shell integral is left as it was.

`octave/dial_refine_close.m` keeps those shapes. On the half wall it sets the midplane stress-energy back to zero where the builder density is still zero, then reads the observers again. On the window it keeps the half xy spacing and puts the z spacing back to the N = 120 value. The log is `data/dial_refine_close.txt`. `octave/dial_slope_ray.m` builds that same window once, with the shift off. It prints the placed density and the smoothed pressure beside the Cartesian density along the grid axis and on the worst cell. Cells inside the still-empty ball are set back to zero. Cells on the slope are left as the difference reads them. The log is `data/dial_slope_ray.txt`.

`octave/dial_shoulder_pressure.m` integrates μ d²S/dx² − S dS/dx along the mix, with x = r/R2 and π = 0 at the outer radius. Ship speed is not in that integral. The log is `data/dial_shoulder_pressure.txt`. `octave/dial_tension_lapse.m` sets the lapse pressure to that fraction times the shell density. The half wall keeps the mass's spatial metric. The one-sixth window keeps its bend placement and receives the same fraction. The mix shift is unchanged. The log is `data/dial_tension_lapse.txt`.

`octave/dial_adm_lapse.m` leaves that hydrostatic lapse and that mix in place. It adds γ^{xx} (S v)² to the time-time component, which is the 3+1 completion that keeps the Eulerian lapse fixed when the shift is on. The spatial metric is not changed. The log is `data/dial_adm_lapse.txt`.

`octave/dial_lip_brace.m` keeps the one-sixth window. After the Eulerian tensor is formed, and only where the energy density is above 10⁻⁸ of peak, it adds q_i q_j/ρ to the spatial stress. The metric, the mass, and the mix are unchanged. The sample maps are the unbraced rebuild. The exact observer scores the faced tensor. The log is `data/dial_lip_brace.txt`.

`octave/dial_face_curv.m` keeps that window and that mix. It multiplies the hydrostatic time-time component by exp(2 δa). δa is zero on the nose and follows a radial profile on the side, weighted by (y²+z²)/r². The profile is the least-squares inverse of the lapse response, so the change in longitudinal stress matches q²/ρ along the side ray. The profile is then multiplied by (v/0.06)². Ship speed stays the amplitude of the shift. The spatial metric is restored at each speed. The file as committed uses bells of width 0.75 m centered every meter from 3 m to 24 m, then one residual pass. It scores the observers only when the side ray is within 0.05 of peak of the face and the pull on the quiet radii stays within 0.02 of peak. The knob check, a side-weighted g_xx strain, the same lapse, and a traceless strain, is `data/dial_face_curv.txt`. The 1.6 m bells are `data/dial_face_lapse.txt` and `data/dial_face_lapse_ray.txt`. The tight pass is `data/dial_face_lapse_tight.txt`.

`octave/dial_level_fan.m` keeps that same book, that mass, and that hydrostatic lapse. The shift is rebuilt from the placed density. It stays 1 inside the inner half-peak shoulder and falls to 0 at the outer half-peak shoulder, with zero slope at both shoulders. Past that outer shoulder the shift is 0. The log is `data/dial_level_fan.txt`.

`octave/dial_ease_fan.m` keeps that same book, that mass, and that hydrostatic lapse. Inside the slope crest the shift is the mix. From the crest at 12.967 m to the window end at 18.454 m the slope is the straight chord of |dS| already used as the mass weight. Past the window the old slope continues from the value the chord arrives at. The log is `data/dial_ease_fan.txt`.

`octave/dial_slack_fan.m` keeps that same book, that mass, and that hydrostatic lapse. Inside the slope crest the shift is the mix. From the crest to the window end the recovery follows the placed density. The scale is fixed by the mix slope at the crest and the mix slope at the window end. Past the window the old slope continues. The log is `data/dial_slack_fan.txt`.

`octave/dial_build_fan.m` keeps that outer slack, that mass, and that hydrostatic lapse. The inner window runs from 6.866 m to the crest. It is the same span construction the outer bend uses, centered on the strongest steepening at 9.917 m. Between those edges the climb of |dS| follows the placed density, with the mix slopes at the two edges. The log is `data/dial_build_fan.txt`.

`octave/dial_wall_fan.m` keeps that outer slack, that mass, and that hydrostatic lapse. The climb runs from the cavity wall to the crest. |dS| follows the placed density, the crest slope stays the mix slope, and the scale is fixed so the crest height stays the mix. The log is `data/dial_wall_fan.txt`.

`octave/dial_cabin_fan.m` keeps that outer slack, that mass, and that hydrostatic lapse. The climb runs from the cavity wall to the crest. |dS| follows the cumulative thickness, the slope at the wall stays the mix slope, the crest slope stays the mix slope, and the exponent is fixed so the crest height stays the mix. The log is `data/dial_cabin_fan.txt`.

`octave/dial_cell_fan.m` keeps that outer slack, that mass, that hydrostatic lapse, and the cabin shift. From the cavity wall out to the corner of the fourth-order difference, |dS| stays at the mix slope. Past that corner |dS| follows the cumulative thickness, the crest slope stays the mix slope, and the exponent is fixed so the crest height stays the mix. The log is `data/dial_cell_fan.txt`.

`octave/dial_flat_fan.m` keeps that outer slack, that mass, and that hydrostatic lapse. Through the corner of the fourth-order difference the shift is 1 and the slope is 0, including inside the cavity, so the 2.51 m page changes. From that corner |dS| follows the cumulative thickness from zero slope up to the mix crest slope, and the exponent is fixed so the crest height stays the mix. The log is `data/dial_flat_fan.txt`.

`octave/dial_band_fan.m` keeps that outer slack, that mass, that hydrostatic lapse, and that flat cabin. Across the stencil of the scored 8.44 m cell the shift is held flat. The climb before the band starts and ends at zero slope and peaks at the mix crest slope. The climb after the band starts at zero slope and ends at the mix crest slope, and the exponent is fixed so the crest height stays the mix. The log is `data/dial_band_fan.txt`.

`octave/dial_rise_fan.m` keeps that outer slack, that mass, that hydrostatic lapse, that flat cabin, and that flat shelf. The climb off the cabin is the square of the scored quadratic in the thickness fraction, so the value and the slope are zero at both ends and the peak is the mix crest slope. The power is the next integer above that quadratic. It is not swept. The climb after the shelf is the same front or back family, and the exponent is fixed by the drop the rise leaves. The log is `data/dial_rise_fan.txt`.

`octave/dial_leave_fan.m` keeps that outer slack, that mass, that hydrostatic lapse, that flat cabin, that quartic, and that flat shelf. The climb off the shelf is the square of the front law, so the steepening starts at zero and the slope ends at the mix crest slope. The exponent is fixed by the drop the quartic leaves. It is not swept by hand. The log is `data/dial_leave_fan.txt`.

`octave/dial_even_fan.m` keeps that outer slack, that mass, that hydrostatic lapse, that flat cabin, that quartic, and that flat shelf. The climb off the shelf rises at one even steepening until the slope reaches the mix crest slope, then holds that slope to the crest. The length is the one that spends the drop the quartic leaves. It is not swept. The log is `data/dial_even_fan.txt`.

`octave/dial_arc_fan.m` keeps that mass, that hydrostatic lapse, that flat cabin, that quartic, and that flat shelf. The leftover at the window end stays the slack leftover. The climb off the shelf rises at one even steepening up to the mix crest slope, holds that slope, and returns to the window-end slope at the same steepening. The steepening is fixed by the drop from the shelf down to that leftover. It is not swept. The crest height is whatever that arc produces. The log is `data/dial_arc_fan.txt`.

`octave/dial_share_fan.m` keeps that mass, that hydrostatic lapse, that flat cabin, and that flat shelf. The leftover at the window end stays the slack leftover. The climb off the cabin is an even triangle in radius. The climb off the shelf is the same arc. One steepening is shared: it is the value where the cabin-climb steepening equals the arc's own bisection. The climb's peak slope stays at or under the mix crest slope. It is not swept. The log is `data/dial_share_fan.txt`.

`octave/dial_span_fan.m` keeps that mass, that hydrostatic lapse, that flat cabin, and that flat shelf. The leftover at the window end stays the slack leftover. The climb off the cabin rises at one steepening, holds that slope across one full fourth-order stencil, and falls at the same steepening. The two reversals are one stencil apart. The climb off the shelf is the same arc, and its steepening is solved to equal the cabin climb. The climb's peak slope stays at or under the mix crest slope. It is not swept. The log is `data/dial_span_fan.txt`.

`octave/dial_taper_fan.m` keeps that mass, that hydrostatic lapse, that flat cabin, that flat shelf, and that spanned climb. The leftover at the window end stays the slack leftover. The climb off the shelf rises and holds as an even arc at the same steepening. On the return, the steepening eases in an even line from that shared value onto the book's own outer bend, and the slope lands on the book's own end slope. The steepening is solved to equal the cabin climb. The climb's peak slope stays at or under the mix crest slope. It is not swept. The log is `data/dial_taper_fan.txt`.

`octave/dial_stencil_fan.m` keeps that mass, that hydrostatic lapse, that flat cabin, and that flat shelf. The leftover at the window end stays the slack leftover. The climb off the shelf rises for one full fourth-order stencil, so one cell cannot hold both corners of that rise. The return is one stencil long as well, and its steepening eases onto the book's own outer bend. Those two lengths fix the two steepenings. The cabin climb keeps its stencil hold and spends the leftover. The climb's peak slope stays at or under the mix crest slope. It is not swept. The log is `data/dial_stencil_fan.txt`.

`octave/dial_reach_fan.m` keeps that mass, that hydrostatic lapse, that flat cabin, that flat shelf, and that stencil-long rise. The leftover at the window end stays the slack leftover. The return has one corner, where the crest slope starts to ease. That corner sits on the rim of the 18.07 m cell, one reach out, and the steepening eases onto the book's own outer bend. The crest hold takes the length a full-stencil return was using. The cabin climb keeps its stencil hold and spends the leftover. The climb's peak slope stays at or under the mix crest slope. It is not swept. The log is `data/dial_reach_fan.txt`.

`octave/dial_pack_fan.m` keeps that mass, that hydrostatic lapse, that flat cabin, that flat shelf, and that stencil-long rise. The leftover at the window end stays the slack leftover. The recovery follows the placed density, so the steepening tracks the packing and the slope lands on the book's own end slope. The cabin climb is held at the crest slope, the most it can spend without passing that slope. The crest hold is the length that leaves exactly that spend. It is not swept. The log is `data/dial_pack_fan.txt`.

`octave/dial_ogee_fan.m` keeps that mass, that hydrostatic lapse, that flat cabin, and that flat shelf. The leftover at the window end stays the slack leftover. The cabin hump and the outer arc share one scale. Steepening equals that scale times the placed density. The scale is the one value that spends the drop from a full shift down to the leftover. The crest slope stays the cap. It is not swept. The log is `data/dial_ogee_fan.txt`.

`octave/dial_seat_fan.m` keeps that mass, that hydrostatic lapse, that flat cabin, and that flat shelf. The leftover at the window end stays the slack leftover. The rise leaves the shelf and arrives on the density peak with the bend already gone. Between those two densities the bend follows the packing, and that seats the crest slope on the peak. The cabin hump is held at the crest slope, the most it can spend without passing that slope. The fall scale is the one value that lands the leftover. The hold stays. It is not swept. The log is `data/dial_seat_fan.txt`.

`octave/dial_balance_fan.m` keeps that mass, that hydrostatic lapse, that flat cabin, that flat shelf, and that seated rise. The leftover at the window end stays the slack leftover. On the cabin, the split is the one radius where the up packing integral matches the down packing integral. Both halves use the rise scale, so the bend is already gone at the flat cabin, at that crest, and at the shelf. The fall scale is the one value that lands the leftover. The hold stays. The cap stays. It is not swept. The log is `data/dial_balance_fan.txt`.

`octave/dial_toe_fan.m` keeps that mass, that hydrostatic lapse, that flat cabin, that flat shelf, that seated rise, and that balanced cabin split. The leftover at the window end stays the slack leftover. The toe turns at one constant bend, equal to the rise's own peak bend. The crest slope is held for the length that bend leaves, and the ease then lands on the book's own end slope. The cabin scale is the one value that lands the leftover. The cap stays. It is not swept. The log is `data/dial_toe_fan.txt`.

`octave/dial_radius_fan.m` keeps that mass, that hydrostatic lapse, that flat cabin, that flat shelf, that seated rise, and that matched toe. The leftover at the window end stays the slack leftover. The cabin turns at one constant bend, equal to the rise's own peak bend. The length of that turn is the one value that lands the leftover. The cap stays. It is not swept. The log is `data/dial_radius_fan.txt`.

`octave/dial_straight_fan.m` keeps that mass, that hydrostatic lapse, that flat cabin, that flat shelf, that seated rise, and that matched toe. The leftover at the window end stays the slack leftover. The cabin rises at one bend until the 5.031 m cell, holds that slope straight, and recovers over the same length at the same bend. The bend is the one value that lands the leftover. The cap stays. It is not swept. The log is `data/dial_straight_fan.txt`.

`octave/dial_late_fan.m` keeps that mass, that hydrostatic lapse, that flat cabin, that flat shelf, that seated rise, and that matched toe. The leftover at the window end stays the slack leftover. The cabin stays flat through the 4.602 m cell. Past that cell one tent spends the leftover. The bend is the one value that lands the leftover. The cap stays. It is not swept. The log is `data/dial_late_fan.txt`.

## One-way funnel, 2026-11-09

The gate page reads the pin and does not build a metric. `derived_D_eff` places Particle Physics and Quantum Mechanics at 5, Fluid Dynamics at 12, and Cosmology at 25. `viscosity_eff(12)` returns 0.33282440671611235, the viscosity the shell already used. Its first term is `|CHAOS| * |D − 25| / 25`, which is 0.17213257495745055 at the fluid. Its second term is `A_BLEED * POOF`, which is 0.16069183175866183. `bleed_rate` is `POOF + SUCTION` and returns 0.30051620032255366 from `fsot_dynamics` and from `fsot_complex_interaction`. `yin_yang_fraction` is `POOF / (POOF + SUCTION)` and returns 0.510728588773961. The scalar transport coefficient is `bleed_rate * A_BLEED`, 0.3146325373020798. The relaxation rate is `|CHAOS| + PSI_CON * POOF`, 0.4280434460598068. The square root of that ratio is 0.8573494832025231, the relaxation length already used as wall thickness on the parent shell. That length stays on the shell. It is not a throat radius.

`coupling_kappa` divides by `1 + |D_i − D_j| / 25`. Between fluid and cosmology the factor is 0.6578947368421053, and the swapped depths return the same factor. Between quantum mechanics and cosmology it is 0.5555555555555556, and the swap returns the same factor. `adjacency_matrix` writes each coupling into both off-diagonal entries. On the pin's sector graph the largest absolute difference between an entry and its transpose is 0. `coupling_kappa("GR","EW")` and `coupling_kappa("EW","GR")` both return 0.0426152645973651. With a unit scalar gradient, zero curvature, and equilibrium equal to zero, `scalar_transport_rhs` returns minus the velocity. The bleed coefficients stay put when that velocity changes sign. The velocity is a state handed to the law. `observer_source(False)` returns 0. Fluid Dynamics is listed in `MEDIUM_ORIFICES`, so that source stays off on the fluid fold. `sound_speed_sq(1)` returns 0.5919208298447349, and `acoustic_metric_factor` returns its square root, 0.7693639124918291. `qm_de_broglie_scale(1)` returns 1.1458384123083372. The vendor has no tunneling amplitude. No shape function, no throat radius, and no double-trace coupling are introduced. A Warp Factory score waits until a metric is justified by a seed. The reading is in [RESULTS.md](RESULTS.md).

## The call, 2026-11-09

The call page integrates the pin's two-mouth law and does not build a metric. For mouths i and j,

dS_i/dt = κ_ij (S_j − S_i) − γ (S_i − E_i),

with κ_ij from `kappa_domains` and γ = |CHAOS| + PSI_CON · POOF = 0.4280434460598068. On two mouths of one domain, E_i = E_j and κ_ij = A_BLEED · POOF · |S|². An offset δ on mouth 1 splits into a sum mode that decays at γ and a difference mode that decays at 2κ + γ. The far mouth is half the sum minus half the difference. Its peak fraction is (1/2) exp(−γ t) · 2κ / (2κ + γ), at t = ln((2κ + γ)/γ) / (2κ). The fraction does not depend on δ, so no kick amplitude is chosen. Two quantum mouths give κ = 0.1450846749297095, fraction 0.09414684910198232, pin time 1.7835832717000715. Two fluid mouths give 0.04624101801466985 at 2.0541373850879614. Two cosmology mouths give 0.03187873648553654 at 2.139371566429859.

The vendor's own integrator step is dt = POOF · SUCTION = 0.022567101748263627, and its default count is round(1/POOF) = 7. At that horizon the closed form has carried 0.020936964617341736 of a quantum kick. Forward Euler on the same step, run out to the peak, reaches 0.09473377563036962. The relative gap against the closed form is 0.006234160080615503. The closed form is the score. The Euler pass is the check.

`domain_scalar("Particle_Physics")` and `domain_scalar("Quantum_Mechanics")` both return 0.9501974701670142. The fluid scalar is −0.6179071388700196. The cosmology scalar is −0.5023773181761478. For two different equilibria the steady difference is (γ/2) / (κ + γ/2) times (E_1 − E_2), and the flux is κ times that difference. Quantum–cosmology κ is 0.0426152645973651 in both orders. The flux is 0.05162288816705389. Substituting the steady scalars 0.8295954877228278 and −0.3817753357319615 back into the two-mouth law leaves a residual at roundoff. Fluid–cosmology flux is −0.0032873163967901955. Quantum–fluid flux is 0.085974065417346. Swapping the names swaps the sign of the flux and leaves κ unchanged.

`momentum_rhs` at unit density, with velocity and every gradient set to zero, returns `observer_source`. That value is 0.0794560282152649 when observed is true and 0 when it is false, at depths 5, 12, and 25 alike. Quantum mechanics is observed. Fluid dynamics and cosmology are listed in `MEDIUM_ORIFICES`. Over the vendor interval the observed velocity grows by 0.01255164591272752. The uniform momentum law has no decay term for that piece. `scalar_transport_rhs` has no observer argument.

`compact_remainder` is ((D − 25)/25) / ln(D/25), and the pin returns 1 at D = 25. The values are 0.4970679476476895 at depth 5 and 0.7084766195299412 at depth 12. The scalar third-term factor is 1 + CHAOS · (D − 25)/25: 1.2648193460883854, 1.1721325749574505, and 1. Pin time is not converted to seconds. No shape function, no throat radius, and no double-trace coupling are introduced. The reading is in [RESULTS.md](RESULTS.md).

## The hold, 2026-11-09

The hold page reads `momentum_rhs`, `viscosity_eff`, `viscous_mode_rhs_error_pct`, `scalar_at_D`, and `scalar_transport_rhs`. It does not build a metric. The Stokes sample is the vendor's own: unit density, v = 1, first derivative 0, second derivative −k² at k = 1, pressure gradient 0. With the observer off, that sample returns −μ. `viscous_mode_rhs_error_pct()` returns 0. The viscosities are 0.4255111778470473, 0.33282440671611235, and 0.16069183175866183 at depths 5, 12, and 25. The e-fold is 1/μ. After the vendor interval 0.1579697122378454 the remaining fractions are exp(−μ t): 0.9349914647745501, 0.9487820441147276, and 0.9749350335878659.

The node of the same sine has v = 0, first derivative 1, and second derivative 0. With the observer on, `momentum_rhs` there returns the source 0.0794560282152649 at each of the three depths. The crest at depth 5 returns −0.3460551496317824, which is −μ + J. The source over the viscosity is 0.18673076608066422, 0.2387325767338876, and 0.49446214748860096. Each is below 1, so a unit crest still falls.

`momentum_rhs(1, 0.01255164591272752, 0, 0, 0, D, False)` returns 0 at depths 5, 12, and 25. The ratio of γ = 0.4280434460598068 to that leftover velocity is 34.102574995823105. `momentum_rhs(1, 0, 0, 0, J, 5, True)` returns 0. `momentum_rhs(1, 0, 0, 0, J, 5, False)` returns −0.0794560282152649.

`scalar_at_D(5, True)` equals `domain_scalar("Quantum_Mechanics")`, 0.9501974701670142. The quantum fold has look 1, hits 0, and observed true. `scalar_at_D(5, False)` returns −0.6456729548144859. The offset is 1.5958704249815001. `scalar_transport_rhs` on the open value, with the equilibrium set to that value, returns 0. With the equilibrium set to the closed value, it returns −0.6831018761740097. The e-fold 1/γ is 2.3362114505084106. `scalar_at_D(12, False)` matches the fluid fold and `scalar_at_D(25, False)` matches the cosmology fold. No shape function, no throat radius, and no double-trace coupling are introduced. The reading is in [RESULTS.md](RESULTS.md).

## The carry, 2026-11-10

The carry page uses the hold's leftover and the scalar law's own scales. `observer_source(True)` returns J = 0.0794560282152649. The vendor interval is 0.1579697122378454, and J times that interval is 0.01255164591272752. `momentum_rhs` at unit density, with that velocity and every gradient zero and the observer off, returns 0 at the fluid depth. γ = |CHAOS| + PSI_CON · POOF = 0.4280434460598068. The e-fold is 1/γ = 2.3362114505084106. The carry is the leftover divided by γ, 0.029323298904041128.

κ = bleed_rate · A_BLEED = 0.3146325373020798. The smoothing length is sqrt(κ/γ) = 0.8573494832025231. That is the relaxation length already used as wall thickness on the parent shell, read here as the unit of x in the transport law. The carry divided by that length is 0.034202270460941514. The length divided by the carry is 29.237825048544227.

With the source on and the flow starting from rest, v = J t and the distance is J t²/2. At the vendor interval the distance is 0.0009913899464724474. At one scalar e-fold it is 0.21683089022520075, and the velocity is J/γ = 0.18562608292842123. No off time is read from the fold. Pin time is not converted to seconds. No shape function, no throat radius, and no double-trace coupling are introduced. The reading is in [RESULTS.md](RESULTS.md).

## The split, 2026-11-10

The split page evaluates `scalar_transport_rhs` on the leftover coast 0.01255164591272752. γ = 0.4280434460598068 and κ = 0.3146325373020798. The smoothing length is 0.8573494832025231, and the wavenumber is its reciprocal, 1.166385493421683. Then κ k² − γ is roundoff, −5.551115123125783×10⁻¹⁷.

A unit flat offset uses slope 0 and curvature 0. The call returns −0.4280434460598068, which matches −γ, so the coast does not enter. The distance of that pattern is 0. The e-fold is 1/γ = 2.3362114505084106.

A unit cosine at that wavenumber has, at its crest, value 1, slope 0, and curvature −k². The call returns −0.8560868921196136, which matches −2γ. The e-fold is 1/(2γ) = 1.1681057252542053. At the node the value is 0, the slope is −k, and the curvature is 0. The call returns 0.014640057711170941, which matches the coast times k. The peak moves at the coast, so in one shaped e-fold the distance is the coast times 1/(2γ) = 0.014661649452020564. Twice that distance matches the recorded carry. Dividing by the smoothing length gives 0.017101135230470757. No off time, no mouth separation, and no double-trace coupling are introduced. The reading is in [RESULTS.md](RESULTS.md).

## The flux, 2026-11-10

The flux page uses the two-mouth balance on the observed branch at depth 5. `scalar_at_D(5, True)` returns 0.9501974701670142 and `scalar_at_D(5, False)` returns −0.6456729548144859. The gap is 1.5958704249815001. γ = 0.4280434460598068. The coupling is the `kappa_domains` product with these two evaluations in place of two domain scalars: A_BLEED · POOF · |open| · |closed| = 0.0985871397275971. The depths are equal, so 1 + |D_i − D_j|/25 = 1.

The steady difference is (γ/2) / (κ + γ/2) times the gap, 1.0925823889771018. The flux is κ times that difference, 0.10771457264599738. The steady scalars are 0.698553452164815 on the open side and −0.3940289368122868 on the closed side. Each side of the two-mouth law then returns a residual at roundoff, 1.3877787807814457×10⁻¹⁷ and its negative. Swapping the two evaluations negates the gap, leaves κ unchanged, and negates the flux.

`DOMAINS` at depth 5 contains Particle_Physics and Quantum_Mechanics. Both are observed. `domain_scalar` returns 0.9501974701670142 for each. The closed evaluation is not in that list. No shape function, no throat radius, and no double-trace coupling are introduced. The reading is in [RESULTS.md](RESULTS.md).

## The seats, 2026-11-10

The seats page reads `NEST_GENERATIONS` and, inside each generation, every pair of names. `domain_scalar` and `kappa_domains` are the calls from the call page. The steady flux is the flux page's balance: (γ/2) / (κ + γ/2) times the gap, times κ. γ = 0.4280434460598068.

For the recorded branch, κ = 0.0985871397275971. The difference rate is 2κ + γ = 0.625217725515001. The held fraction of the gap is γ / (2κ + γ) = 0.6846310150711437. With both mouths starting at the open value and one equilibrium equal to the closed evaluation, the difference is the steady difference times (1 − exp(−(2κ + γ) t)). At the vendor interval 0.1579697122378454 that factor is 0.09404483795972873, and the flux is 0.010129999530394252.

Same-generation pairs share a depth, so the scale suppressor is 1. Eight pairs differ only by the observed bit. Their domain scalars match `scalar_at_D(D, True)` and `scalar_at_D(D, False)`. `kappa_domains("Quantum_Computing", "Quantum_Optics")` returns 0.10001300937604073. The flux from the open scalar toward the closed scalar is 0.10948671535321428. The steady scalars are 0.6978753342253736 and −0.39684940244916417. The residual is roundoff.

At depth 12, `domain_scalar("Thermodynamics")` and `domain_scalar("Nuclear_Physics")` return 0.9363875640629747. `domain_scalar("Fluid_Dynamics")` and `domain_scalar("Ecology")` return −0.6179071388700196. Each specimen–medium pair has flux 0.10074608467195591. `kappa_domains("Fluid_Dynamics", "Ecology")` returns 0.06135362491527767 and the flux is 0.

`domain_scalar("High_Energy_Physics")` is 0.8873295223725087 and `domain_scalar("Atomic_Physics")` is 0.7587603802989923. Both are observed. The looks are 0.9511450936457113 and 0.8652559794322651, and the hits are 1 and 0. The flux from high-energy physics toward atomic physics is 0.009239275123069976.

`kappa_domains("Particle_Physics", "Quantum_Mechanics")` returns 0.1450846749297095 and the flux is 0. Those two names are generations 0 and 1. Ten pairs inside a generation have equal scalars and flux 0. The two orders of each coupling agree to roundoff. No shape function, no throat radius, and no double-trace coupling are introduced. The reading is in [RESULTS.md](RESULTS.md).

## The clock, 2026-11-10

The clock page calls `coupled_equilibrium` with its own defaults. The step is POOF · SUCTION = 0.022567101748263627. The step count is round(1/POOF) = 7. The law inside the loop is

dS_i/dt = Σ_j κ_ij (S_j − S_i) − γ (S_i − E_i),

with γ = 0.4280434460598068. E_i is `domain_scalar` of the sector's domain. The start is `sector_scalar_at_interface` on that domain's own observed bit, and it matches E_i. The edges and the domains are the vendor lists: cosmology, particle physics, nuclear physics, electromagnetism, high-energy physics, quantum mechanics, thermodynamics, and atomic physics. κ_ij is `coupling_kappa`. The gravity–electroweak value is 0.0426152645973651. The electroweak–lepton value is 0.1450846749297095.

Forward Euler on those seven steps returns the moves in the table. Cosmology's initial rate is 0.13345450567211478. Thermodynamics' initial rate is −0.07374981045099419. The fixed point is the same linear system with every rate set to 0. Its residual is roundoff. High-energy physics moves to 0.8911164249970055 in the seven steps, and its fixed point is 0.884590585428397.

`matter_unobserved_S("Particle_Physics")` and `matter_unobserved_S("Quantum_Mechanics")` return −0.6456729548144859. `coupled_equilibrium` does not call that function. The observed flags are read from `DOMAINS` and are not entries in the integrated state. No shape function, no throat radius, and no double-trace coupling are introduced. The reading is in [RESULTS.md](RESULTS.md).

## The map, 2026-11-10

The map page uses the mouth radius already on this ledger and the shell relation already in this file. R₂ = 20 m. ell = sqrt(κ/γ) = 0.8573494832025231. The cavity is R₂ (1 − ell) = 2.8530103359495373 m. The wall thickness is R₂ ell = 17.146989664050462 m.

Compactness C means M = C R₂ c² / (2 G), so the horizon Rs = C R₂. The constants are the Warp Factory pair already printed above, c = 2.99792458×10⁸ m/s and G = 6.67430×10⁻¹¹ m³ kg⁻¹ s⁻². Compactness 1/2 gives Rs = 10 m and M = 6.732954607500545×10²⁷ kg. Compactness 1/6 gives Rs = 3.3333333333333335 m and M = 2.2443182025001816×10²⁷ kg. The printed mouths are 6.73×10²⁷ kg and 2.244×10²⁷ kg. Their horizons, 2 G M / c², are 9.995611722233722 m and 3.332860728780457 m.

The cavity minus the half-compact horizon is −7.146989664050462 m. The cavity minus the one-sixth horizon is −0.48032299738379614 m. The cavity is inside both horizons. No shape function is introduced, and the cavity is not adopted as a throat.

One pin-time unit is read as R₂/c = 6.671281903963041×10⁻⁸ s. A pin interval t becomes t R₂/c. The vendor interval 0.1579697122378454 becomes 1.0538604826265869×10⁻⁸ s. The scalar e-fold 2.3362114505084106 becomes 1.5585525173608007×10⁻⁷ s. The scalar law does not contain c. The converter is the parent's. No double-trace coupling is introduced. The reading is in [RESULTS.md](RESULTS.md).

## The shape, 2026-11-10

The shape page sets the throat at the mouth's outer radius, r₀ = 20 m, the published radius that lies outside both horizons. The redshift function is Φ = 0. The shape is the single inverse power that equals r₀ at the throat and Rs at infinity:

b(r) = Rs + (r₀ − Rs) r₀ / r.

Rs = r₀/6 on the one-sixth mouth and Rs = r₀/2 on the half-compact mouth. Then b(r₀) = r₀ and b'(r) = −(r₀ − Rs) r₀ / r², so b'(r₀) = −5/6 and −1/2. The flare-out (b − b' r)/(2 b²) at the throat is (1 − b')/(2 r₀), which is 11/240 m⁻¹ and 0.0375 m⁻¹. For r > r₀, r − b(r) is positive because its derivative at the throat is positive and its value there is 0.

With Φ = 0 the Einstein reading quoted by Morris and Thorne gives, at the throat,

ρ = b' c⁴ / (8 π G r₀²), τ = c⁴ / (8 π G r₀²).

c and G are the Warp Factory pair already printed. The one-sixth energy density is −1.003219559733838×10⁴⁰ Pa and the half-compact energy density is −6.019317358403028×10³⁹ Pa. The tension is 1.2038634716806056×10⁴⁰ Pa on both. ρ + p_r = ρ − τ is −2.2070830314144437×10⁴⁰ Pa and −1.8057952075209085×10⁴⁰ Pa. The exoticity (τ − ρ)/|ρ| is 11/5 and 3.

The proper radial distance from the throat to coordinate radius r₀ U is r₀ times

sqrt((U − a)² − d²) + a ln( (U − a + sqrt((U − a)² − d²)) / d ),

with a = Rs/(2 r₀) and d = 1 − a. From 20 m to 40 m that distance is 35.94488696565487 m and 39.077758146657835 m. With Φ = 0 the coordinate light time of the same segment is that distance over c, 1.1989923697698516×10⁻⁷ s and 1.3034937038562135×10⁻⁷ s. The reading is in [RESULTS.md](RESULTS.md).

## The crossing, 2026-11-10

The crossing page joins two copies of one shape at r₀ = 20 m. The one-sixth pair uses Rs = r₀/6 on both sides. The half-compact pair uses Rs = r₀/2 on both sides. The proper distance already scored from 20 m to 40 m is L. The through-distance is 2L, because the two sides use the same formula. That is 71.88977393130973 m and 78.15551629331567 m. Twice the recorded one-sided length differs from 2L by 0.

With Φ = 0 the radial null ray satisfies dl/dt = c, so the light time is 2L/c: 2.397984739539703×10⁻⁷ s and 2.606987407712427×10⁻⁷ s. The coordinate speed is dr/dt = c √(1 − b(r)/r). At r = r₀ that factor is 0, and dl/dt remains c. The reading is in [RESULTS.md](RESULTS.md).

## The stress, 2026-11-10

The stress page reads the pin and the shell file. It does not edit either one. `Gluon_condensate` in `fsot_compute.py` is C_cosm − e⁻³ = 0.012832866903470668. That result is a pure number. This page does not multiply it by a GeV conversion.

The condensate body is `data/shell_env.txt`. Its mass divided by the volume between its two radii is 8.373887575889153×10¹⁷ kg/m³, which rounds to the printed 8.373888×10¹⁷ kg/m³. Rest energy is that density times the Warp Factory c², 7.5260748249902725×10³⁴ Pa.

The mouth wall is the compactness mass spread over the 20 m ell wall. The inner radius is 20 m × (1 − ell) = 2.8530103359495373 m. The wall volume is 33413.047219545326 m³. The masses are the shape-page masses, 2.2443182025001816×10²⁷ kg and 6.732954607500545×10²⁷ kg. The densities are 6.716891721229614×10²² kg/m³ and 2.015067516368884×10²³ kg/m³. The rest energies are 6.036841219469572×10³⁹ Pa and 1.8110523658408714×10⁴⁰ Pa.

The throat tension and the throat energy density are the shape-page values. The ratios of these positive rest energies to that tension, and to the absolute value of that energy density, are the table in [RESULTS.md](RESULTS.md). `momentum_rhs` takes the pressure gradient as an argument and does not return a pressure. The reading is in [RESULTS.md](RESULTS.md).
