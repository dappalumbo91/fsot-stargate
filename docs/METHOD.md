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

`octave/dial_coast_stack.m` builds each of those two clean shapes once and changes only the shift amplitude. The half-compact wall uses the same mix as `dial_audit_bar.m`, at 0, 0.02, 0.04, 0.06, 0.08, and 0.10. The one-sixth bend window uses the same placement as `dial_sixth_bend.m`, at 0, 0.02, and 0.04. The log is `data/dial_coast_stack.txt`. Every tabulated coast is clean. No speed is inserted between those steps. `octave/dial_ship_beam.m` does not build a shell. It hands Minkowski dust, a forward null flux, and their sum to the same energy-condition function. The log is `data/dial_ship_beam.txt`. All three stay non-negative for the sampled Eulerian observers. The film hold from the lunar trip out to 0.04c is the acceleration already in `lean/WarpLedger.lean`. It is kinematics, not a metric score. The shell still uses the relaxation length as wall thickness, the pressure fraction inside the mix, and the 3.24 percent potential already scored. Density and pressure are the matter variables that metric reads.

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
