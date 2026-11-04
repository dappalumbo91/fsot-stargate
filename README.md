# FSOT warp shell

**Author:** Damian Arthur Palumbo  
**License:** Apache-2.0  
**Pin:** FSOT 2.1 AEB2AD, from [FSOT-2.1-Lean](https://github.com/dappalumbo91/FSOT-2.1-Lean)

A constant-speed warp shell, scored in Warp Factory. The published positive-mass pass in this solver is Fuchs et al. 2024: **0.02c** on a 10–20 m shell, mass 4.49×10²⁷ kg.

At that same 20 m outer radius the FSOT wall is clean at **0.10c** when the compactness is 1/2. The mass is 6.73×10²⁷ kg, 1.5 times the published mass, and the unsmoothed wall starts at 2.85 m. At the published compactness 1/3, which is their mass, that wall is clean at **0.06c** and fails at 0.10c. Their own 10 m cabin, at compactness 1/2, is clean at **0.04c** and fails at 0.06c.

The condensate body, 1.40 km to 9.81 km, is the shell at the pin density. It is clean at **0.10c** on the 166.8 m grid and on the 83.4 m grid once the flat cavity is given its continuum value of zero. That body is 491 times larger in outer radius, 736 times heavier, and about 1.8×10⁵ times less dense than the published shell. The 20 m FSOT wall is the other way: about 1.3 times the published density. The pin does not fill 20 m.

The raw 83.4 m difference misses that bar on four samples at 59 m. Those samples sit inside a ball, r < 87.55 m, where the constructed metric is exactly flat, so the continuum stress-energy is zero. The fourth-order stencil reaches outside the ball and reports a false negative. Setting those four cells back to zero puts the 83.4 m score under the bar. The worst remaining weak ratio is 4.006×10⁻⁷, in the exterior mass skirt. The wall is quiet on both grids. This is a simulation of a coast at constant speed.

![Eulerian speeds](figures/speed_limit.png)

The green marks are under the clean bar. The red marks are over it. At the published 20 m radius, their cabin is clean at 0.04c and fails at 0.06c. The flat FSOT wall is clean at 0.04c for compactness 1/5 and 1/4, and the flat compactness 1/6 wall fails at 0.04c. That same one-sixth mass is clean at 0.04c when the foot stays the wall and the outer slope is held to the bend-window chord. At their mass the wall is clean at 0.06c. At compactness 1/2 it is clean at 0.10c and fails at 0.11c. The condensate shell is clean at 0.095c and 0.10c, and the 0.10c mark also holds on the 83.4 m grid after the flat-ball restoration. A 50–110 m Fuchs-type shell in this port still fails at 0.10c.

A fresh run of that 20 m wall reproduced the stored 0.10c line. With the shift turned off, the same shell is clean at compactness 1/2 and at compactness 1/3. The remaining violation sits at 26.47 m, near 2×10⁻⁵. The smoothed density ends at 26.57 m, so that cell is the tip of the mass smooth. The chain from the pin through the mix is written out in [docs/AUDIT.md](docs/AUDIT.md).

The mass smooth is four passes of a 3.29 m window. On the 0.10c ship, density is zero only out to 0.18 m and stays under 1% of the wall only out to 0.42 m. At the unsmoothed inner radius, 2.85 m, the density is already half the wall and the shift is still 0.994. Their 10 m cabin, through the same smooth, is empty out to 3.43 m and under 1% out to 5.72 m. At 9.78 m, the cell that fails when the speed goes from 0.04c to 0.06c, the density is 46% of the wall and the shift is still 0.985. A larger empty cabin at 0.10c is the same thick wall built at a larger radius, and the mass grows with that radius. The profile is `data/dial_cabin_vacuum.txt`.

On that same 20 m FSOT wall, lowering the compactness lowers the mass and the density together. Compactness 1/4 is clean at 0.04c, mass 3.37×10²⁷ kg, density half the half-compact wall. Compactness 1/5 is clean at 0.04c, mass 2.69×10²⁷ kg, density 0.40 of that wall. Both fail at 0.06c. The flat compactness-1/6 wall, mass 2.24×10²⁷ kg, fails at 0.04c on the outer shoulder. Placing that mass on the mix slope clears both shoulders and fails at the inner edge. Restoring the wall only in the foot clears that edge and leaves a side notch at 16.7 m. Holding the outer slope up to a chord that runs out to the face of the shell clears the notch and fails on the steepest slope, because the chord keeps feeding the dead tail. Stopping the chord one curvature-rise past the strongest bend is clean at 0.04c: energy 2.379×10²⁷ kg, dominant 1.61×10⁻⁴ in the mass skirt, peak density 0.627 of the half-compact wall. The same window at compactness 1/7 fails on the side at 16.6 m. Drawing the chord to the shell face and applying it only inside the window moves that break to 8.8 m. Holding the max slope through the strongest bend clears that side band and fails at 12.96 m. The one-sixth window fails at 0.06c. The 0.10c shell remains compactness 1/2. Logs: `data/dial_mass_down.txt`, `data/dial_mass_down_16.txt`, `data/dial_sixth_push.txt`, `data/dial_sixth_cover.txt`, `data/dial_sixth_max.txt`, `data/dial_sixth_band.txt`, `data/dial_sixth_inner.txt`, `data/dial_sixth_chord.txt`, `data/dial_sixth_bend.txt`, `data/dial_seventh_bend.txt`, `data/dial_seventh_clip.txt`, `data/dial_sixth_bend_06.txt`, `data/dial_seventh_plateau.txt`.

![Audit of the 20 m shell](figures/audit_bar.png)

## The shell

| | Published pass | This record |
| --- | ---: | ---: |
| Paper | Fuchs et al., Class. Quantum Grav. 41 (2024) 095013 | this repository |
| Radii | 10 m to 20 m | 1.40 km to 9.81 km |
| Mass | 4.49×10²⁷ kg | 3.303×10³⁰ kg (about 1.66 solar masses) |
| Density | 1.53×10²³ kg/m³ | 8.37×10¹⁷ kg/m³ |
| Clean speed | 0.02c | 0.10c on 166.8 m, and on 83.4 m after the flat-ball restoration |
| Finer grid, raw difference |  | 83.4 m, four samples at 59 m, weak ratio 1.476×10⁻³ |
| Finer grid, flat ball restored |  | 83.4 m, weak ratio 4.006×10⁻⁷ in the exterior skirt |

The clean speed on the condensate body is 5 times the published pass. The same speed is clean at 20 m on the FSOT wall when the compactness is 1/2. A 50–110 m shell of the Fuchs type, scored in this same port at compactness 1/3, fails at 0.10c. Both masses are the positive mass of the shell in the metric.

![Scale](figures/scale_contrast.png)

![Geometry](figures/geometry.png)

The wall thickness is one FSOT relaxation length, `ell = 0.8573494832025231`, from the live transport coefficients. The mass is the compactness-1/2 mass of that body. The shift profile is a join of the compact sigmoid and the pressure fraction. Ship speed only sets the amplitude. The algebra of that join is proved in Lean 4. The Einstein tensor is the Warp Factory log, not the Lean file.

## What the solver reports at 0.10c

Clean means all four worst/peak ratios under 1×10⁻³, serious fraction 0, positive integrated energy, and a shift equal to the requested speed.

| Ratio | 0.10c | Clean bar |
| --- | ---: | ---: |
| Null | 6.534×10⁻⁴ | 1×10⁻³ |
| Weak | 7.887×10⁻⁴ | 1×10⁻³ |
| Strong | 6.558×10⁻⁴ | 1×10⁻³ |
| Dominant | 6.822×10⁻⁶ | 1×10⁻³ |
| Serious fraction | 0 | 0 |
| Energy | 4.0651×10³⁰ kg | positive |
| Shift | 0.100c | 0.100c |

![Conditions](figures/conditions.png)

![Limb](figures/limb.png)

At 0.11c the dominant ratio is 0.175 on the 166.8 m grid and 0.177 on the 83.4 m grid, both in the outer wall near 7.7 km. Restoring the flat ball does not move that break.

The resolution stress uses the same profile at `N = 320`, spacing 83.395 m (`data/dial_mix_fine.txt`). The raw Cartesian difference gives null 7.016×10⁻⁴, weak 1.476×10⁻³, strong 7.016×10⁻⁴, dominant 5.506×10⁻⁷. The weak ratio is the sample at 59 m, so that raw score is over the bar. Along the side ray the dominant ratio is still 0.

`data/dial_flatball.txt` restores the continuum value inside the flat ball. On the 166.8 m grid no scored cell falls inside r < 87.55 m, so that score is unchanged. On the 83.4 m grid four cells are restored to zero. The corrected 0.10c ratios are null 1.971×10⁻⁷, weak 4.006×10⁻⁷, strong 1.971×10⁻⁷, dominant 5.506×10⁻⁷, serious fraction 0, energy 4.0657×10³⁰ kg, shift 0.10. The worst cell is the exterior skirt at 12,979 m. The same correction with the shift removed gives weak ratio 4.057×10⁻⁷. Both are under the bar.

![Resolution](figures/resolution.png)

## The origin samples

`data/dial_center.txt` scores the same mix with the shift removed and with the shift at 0.10c, on both grids. The negative cavity cells are the four diagonal samples at `r = h / √2`. Every other cavity bin has a positive minimum.

| Grid | Shift | Origin-sample weak ratio | Next ring, one spacing out |
| --- | --- | ---: | ---: |
| 166.8 m | off | −7.515×10⁻⁴ | +1.309×10⁻² |
| 166.8 m | 0.10c | −7.887×10⁻⁴ | +9.651×10⁻³ |
| 83.4 m | off | −1.481×10⁻³ | +4.047×10⁻⁴ |
| 83.4 m | 0.10c | −1.476×10⁻³ | +3.339×10⁻⁴ |

With the shift off, the weak ratio times the sample radius is 0.0886 m at 118 m and 0.0873 m at 59 m. The two points sit on that line. The 0.10c shift moves the coarse sample from −7.515×10⁻⁴ to −7.887×10⁻⁴ and the fine sample from −1.481×10⁻³ to −1.476×10⁻³. On the 83.4 m grid the wall's worst weak ratio is +1.55×10⁻². The smoothed mass outside the body leaves a skirt of order 10⁻⁶ on the coarse grid and 10⁻⁷ on the fine grid.

![Origin samples](figures/center.png)

## Flat ball

The shell metric is built from a smoothed density. That density is exactly zero for r < 87.55 m, `B = 1` there, and the shift profile is exactly 1 out past 500 m. A constant lapse, a Euclidean cavity, and a constant shift are flat. Their stress-energy is zero. The log `data/dial_flatball.txt` prints the raw stencil value beside the restored value.

![Flat ball](figures/flatball.png)

Full tables are in [docs/RESULTS.md](docs/RESULTS.md). How the shell and the shift are built is in [docs/METHOD.md](docs/METHOD.md).

## Reproduce

Algebra, shell arithmetic, and the stored 0.10c log:

```bash
python python/stress_mix.py
python python/figures.py
```

The pin check runs when `vendor/fsot_compute.py` from FSOT-2.1-Lean is available. Point `FSOT_VENDOR` at that directory, or clone FSOT-2.1-Lean next to this repository. The script checks that the file still hashes to pin AEB2AD and that `ell` matches the shell.

The Lean proofs use Lean 4.31.0 and Mathlib v4.31.0, from a checkout that already has those built. Run both from the FSOT-2.1-Lean repository so Mathlib resolves:

```bash
lake env lean /path/to/fsot-warp-shell/lean/WarpMix.lean
lake env lean /path/to/fsot-warp-shell/lean/WarpLedger.lean
```

Neither file is part of the published `FSOT` library. `WarpMix.lean` is the shift join. `WarpLedger.lean` is the compactness mass, the bend window, the printed clean and fail lines, and the ship-scale ledger, including the film hold from the lunar trip to 0.04c. Lean 4.31.0 accepted `WarpMix.lean` on 2026-11-01. The same checkout accepted `WarpLedger.lean` again on 2026-11-02. Neither file evaluates the Einstein tensor.

The metric score uses the Octave port of [Warp Factory](https://github.com/NerdsWithAttitudes/WarpFactory) at commit `03b10cb`. Copy `octave/dial_mix.m` into that port's `fsot_warp` directory. Set `SHELL_ENV` to `data/shell_env.txt` and `OUT` to a writable directory. The clean log from that script is `data/dial_mix.txt`. `octave/dial_mix_fine.m` is the same join at `N = 320`. Its log is `data/dial_mix_fine.txt`. `octave/dial_center.m` is the shift-off census. Its log is `data/dial_center.txt`. `octave/dial_flatball.m` restores the flat ball. Its log is `data/dial_flatball.txt`. `octave/dial_fuchs_size.m` scores the FSOT wall at 20 m. Its log is `data/dial_fuchs_size.txt`. `octave/dial_cabin_gap.m` scores their cabin at compactness 1/2. Its log is `data/dial_cabin_gap.txt`. `octave/dial_audit_bar.m` repeats the 0.10c line and scores the parked shell. Its log is `data/dial_audit_bar.txt`. `octave/dial_cabin_vacuum.m` prints how far the mass smooth reaches into the cabin. Its log is `data/dial_cabin_vacuum.txt`. It does not score the energy conditions. `octave/dial_mass_down.m` scores compactness 1/4 and 1/5 at 0.04c and 0.06c. Its log is `data/dial_mass_down.txt`. `octave/dial_mass_down_16.m` scores compactness 1/6 at 0.04c. Its log is `data/dial_mass_down_16.txt`. `octave/dial_sixth_push.m`, `octave/dial_sixth_cover.m`, and `octave/dial_sixth_max.m` keep that one-sixth mass and move it relative to the mix slope. Their logs are `data/dial_sixth_push.txt`, `data/dial_sixth_cover.txt`, and `data/dial_sixth_max.txt`. `octave/dial_sixth_band.m` compares the slope, the foot payment, and a join smoothed afterward. Its log is `data/dial_sixth_band.txt`. `octave/dial_sixth_inner.m` restores the wall only in the foot. Its log is `data/dial_sixth_inner.txt`. `octave/dial_sixth_chord.m` holds the outer slope to the chord out to the shell face. Its log is `data/dial_sixth_chord.txt`. `octave/dial_sixth_bend.m` stops that chord one curvature-rise past the strongest bend. Its log is `data/dial_sixth_bend.txt`, and that run is clean at 0.04c. `octave/dial_seventh_bend.m` is that window at compactness 1/7. Its log is `data/dial_seventh_bend.txt`. `octave/dial_seventh_clip.m` draws the chord to the shell face and applies it only inside the window. Its log is `data/dial_seventh_clip.txt`. `octave/dial_sixth_bend_06.m` is the one-sixth window at 0.06c. Its log is `data/dial_sixth_bend_06.txt`. `octave/dial_seventh_plateau.m` holds the max slope through the strongest bend. Its log is `data/dial_seventh_plateau.txt`. `octave/dial_coast_stack.m` scores the half-compact 20 m wall at 0, 0.02, 0.04, 0.06, 0.08, and 0.10, and the one-sixth bend window at 0, 0.02, and 0.04. Its log is `data/dial_coast_stack.txt`. `octave/dial_ship_beam.m` scores Minkowski dust, a forward null flux, and both together. Its log is `data/dial_ship_beam.txt`. That run is not a shell. `octave/dial_observers.m` minimizes the null, weak, and strong contractions over every direction, and reads the rest-frame dominant slack, on the half-compact wall at 0 and 0.10c and on the one-sixth bend window at 0 and 0.04c. Its log is `data/dial_observers.txt`. `octave/dial_observers_parked.m` reads the parked 0.11c and 0.06c failures the same way. Its log is `data/dial_observers_parked.txt`. `octave/dial_observers_fine.m` rebuilds those two clean shapes at half the spacing. Its log is `data/dial_observers_fine.txt`. `octave/dial_passenger.m` adds 10 tonnes of dust at rest in the ship on the two clean speeds. Its log is `data/dial_passenger.txt`. `octave/dial_refine_close.m` restores the half-wall flat ball on the N = 240 grid and rebuilds the window with the N = 120 z spacing. Its log is `data/dial_refine_close.txt`. `octave/dial_slope_ray.m` compares the placed density and pressure with the Cartesian tensor on that window, shift off, and restores the empty center cells. Its log is `data/dial_slope_ray.txt`. `octave/dial_shoulder_pressure.m` integrates the pressure the mix flow asks for. Its log is `data/dial_shoulder_pressure.txt`. `octave/dial_tension_lapse.m` puts that pressure into the lapse and scores the wall breaks. Its log is `data/dial_tension_lapse.txt`. `octave/dial_adm_lapse.m` adds the square of the shift to the hydrostatic time-time component and scores the same speeds. Its log is `data/dial_adm_lapse.txt`. `octave/dial_lip_brace.m` keeps that one-sixth window and adds the carrier face q_i q_j/ρ to the Eulerian stress. Its log is `data/dial_lip_brace.txt`. `octave/dial_face_curv.m` solves a side-weighted lapse for that same face. The knob check is `data/dial_face_curv.txt`. The scored inversions are `data/dial_face_lapse.txt` and `data/dial_face_lapse_ray.txt`. The tight basis, which this file repeats, is `data/dial_face_lapse_tight.txt`. `octave/dial_level_fan.m` keeps that book and brings the shift level by the outer half-peak shoulder. Its log is `data/dial_level_fan.txt`. `octave/dial_ease_fan.m` keeps that book and eases the outer slope onto the chord from the crest to the window end. Its log is `data/dial_ease_fan.txt`. `octave/dial_slack_fan.m` keeps that book and lets the outer recovery follow the placed density. Its log is `data/dial_slack_fan.txt`. `octave/dial_build_fan.m` keeps that outer slack and lets the inner buildup follow the placed density. Its log is `data/dial_build_fan.txt`. `octave/dial_wall_fan.m` keeps that outer slack, holds the crest at the mix, and starts the buildup at the cavity wall. Its log is `data/dial_wall_fan.txt`. `octave/dial_cabin_fan.m` keeps that crest and starts the climb on the mix slope. Its log is `data/dial_cabin_fan.txt`. `octave/dial_cell_fan.m` holds that wall slope through the corner of the fourth-order difference. Its log is `data/dial_cell_fan.txt`. `octave/dial_flat_fan.m` holds the full shift, with zero slope, through that corner. Its log is `data/dial_flat_fan.txt`. `octave/dial_band_fan.m` holds the shift flat across the stencil of the 8.44 m cell. Its log is `data/dial_band_fan.txt`. `octave/dial_rise_fan.m` squares the climb off the cabin so the steepening starts at zero. Its log is `data/dial_rise_fan.txt`. `octave/dial_leave_fan.m` squares the climb off that shelf so the steepening starts at zero. Its log is `data/dial_leave_fan.txt`. `octave/dial_even_fan.m` climbs off that shelf at one even steepening until the slope reaches the crest slope. Its log is `data/dial_even_fan.txt`. `octave/dial_arc_fan.m` carries that climb through the crest at one even steepening and back down to the window-end slope. Its log is `data/dial_arc_fan.txt`. `octave/dial_share_fan.m` shares that steepening between the cabin climb and that arc. Its log is `data/dial_share_fan.txt`. `octave/dial_span_fan.m` splits that climb's reversal across one stencil. Its log is `data/dial_span_fan.txt`. `octave/dial_taper_fan.m` eases that arc's return onto the book's own outer bend. Its log is `data/dial_taper_fan.txt`.

## The scored mass is an external pull

The one-sixth bend window is clean in the Eulerian test at 0.04c. Its gravitational mass is 2.244×10²⁷ kg, 1.182 Jupiter, 376 Earths. Rest energy 2.017×10⁴⁴ J. Outside the shell that mass is the pull. On an Earth-to-Moon coast it sits inside the Earth–Moon system for the whole 32 seconds.

Inside about 58,000 km the tide across the Earth exceeds 1 g. In low orbit the Earth falls toward the shell at about 330 g, and the tide from the near side to the far side is about 630 g. At the Moon the Earth is still pulled at 0.10 g, and the tide across the Earth is about 30,000 times the lunar tide. The shell pulls on the Earth as hard as the Moon does from 0.45 AU. Compactness changes on this shell do not remove that pull. The pin's correction to Newtonian gravity is 3.24 percent, and that correction was already scored. It does not screen the mass.

A 10 tonne ship that carries 0.04c itself has kinetic energy 7.20×10¹⁷ J. Its gravity stays 10 tonnes. A photon rocket to that speed, and a stop at the end, is a separate and larger bill because the exhaust is at c. Exhaust matched to 0.04c, for the same accel and stop, is a mass ratio of 7.40: 64 tonnes of propellant and 4.60×10¹⁸ J. At 1 g that burn wants about 4.3×10⁸ W per kilogram of dry mass, so the power plant stays home.

A perfect sail takes momentum 2E/c from a beam. The ship stays 10 tonnes. Two beams, one at Earth and one at the Moon:

| Beam | Peak speed | Trip | Energy, both legs |
| --- | ---: | ---: | ---: |
| 1 GW | 0.51 km/s | 422 h | 1.52×10¹⁵ J |
| 100 GW | 5.06 km/s | 42 h | 1.52×10¹⁶ J |
| 1 TW | 16.0 km/s | 13.3 h | 4.80×10¹⁶ J |
| 15 TW | 62 km/s | 3.44 h | 1.86×10¹⁷ J |

A film at 10 g/m² that absorbs one part in a thousand, radiates from both faces with emissivity 0.5, and is held at 600 K can take 7.35×10⁶ W/m². Ten tonnes of that film is 1.13 km across. With another 10 tonnes of ship the acceleration is 0.25 g on 7.35 TW. Half the way up and half the way down: peak 30.7 km/s, 7.0 hours. The 1 µm aperture that fills the sheet at lunar distance is 0.34 m. Both beams deliver 1.84×10¹⁷ J. At 100 W per kilogram of station, 7.35 TW is 7.3×10⁷ tonnes of hardware on the ground. One g at 600 K on this loading, with the same 2E/c, needs absorption 2.50×10⁻⁴. These sail figures are a ledger from the scored mass and from radiation pressure. They are not a Warp Factory grid. The Eulerian speeds above are unchanged. The 0.10c shell remains compactness 1/2.

The same 0.25 g film, on the same 20 tonne craft, reaches 0.04c in 56.6 days and 196 AU. Accel and stop is two of those legs: about 113 days and 392 AU. The round-trip beam energy is 7.19×10¹⁹ J. Lean checks the one-leg windows and the identity that two legs are twice one leg. The lunar trip is that acceleration on the short range. This timeline is kinematics. It is not a Warp Factory flight.

## Coasts on the two clean shapes

Dated 2026-11-02. Log `data/dial_coast_stack.txt`. The shapes stay fixed. The half-compact 20 m wall is clean at 0, 0.02, 0.04, 0.06, 0.08, and 0.10. The one-sixth bend window is clean at 0, 0.02, and 0.04. The 0.10c line matches the stored audit, energy 8.2868×10²⁷ kg. The parked half wall matches, energy 8.3144×10²⁷ kg. The 0.04c window matches the stored pass, energy 2.3794×10²⁷ kg. The steps between those anchors are clean. This is not a new speed. 0.11c on the half wall, and 0.06c on the light window, stay the stored failures and were not rerun.

## The ship and the beam

Dated 2026-11-02. Log `data/dial_ship_beam.txt`. The same energy-condition function, on Minkowski, with a tensor of order 1. Dust has null, weak, and strong equal to 0.5 and dominant equal to 0.707. A forward null flux has null, weak, and strong equal to 1.03×10⁻⁴, which is how far the angular grid sits from the exact forward ray, and dominant on the margin. Dust plus that flux stays non-negative for every sampled Eulerian observer. The floor used here is −1×10⁻⁶. This is ordinary matter plus a null flux. It is not the Jupiter shell, and these numbers are not densities in kilograms.

## Every observer

Dated 2026-11-02. Log `data/dial_observers.txt`. The Eulerian tensor is the one this port already computes. From that tensor the null, weak, and strong contractions are minimized over every direction, and the dominant slack is read in the rest frame. Every scored cell has a rest frame: 13,456 of 13,456 on the midplane. The half-compact wall, shift off and at 0.10c, stays under the bar. Its deepest rest-frame slack is 3.72×10⁻⁵, in the smoothing tail at 26.2 m. The contraction there points backward. The one-sixth window, shift off and at 0.04c, stays under the bar. Its deepest contraction is the strong ratio 1.89×10⁻⁴, in the tail at 23.5 m. The contraction there points to the side. The tail by itself is the same number, so the matter inside the shell is quieter. The sampled coast lines match the stored logs. The shift does not move the worst cell. This is still the Eulerian orthonormal frame. It is the minimum inside that frame, over every observer.

## The parked failures, the tail, and a passenger

Dated 2026-11-02. The shapes are the ones already scored. Nothing was retuned.

The parked failures are in `data/dial_observers_parked.txt`. The half wall at 0.11c fails where the stored line failed: sampled dominant ratio 0.177 at 15.7 m, 87.5° off the nose, in the outer wall. The exact contraction there is −7.52×10⁻², at 15.7 m and 89.2° off the nose, and that cell has no rest frame. One hundred eighty-four midplane cells are that kind. The one-sixth window at 0.06c fails where its stored line failed: sampled dominant ratio 0.222 at 16.1 m, on the side of the wall. The exact contraction is −0.205, at 16.2 m and 84.4° off the nose, and that cell has no rest frame. One thousand twenty-eight cells are that kind. On both shapes the smoothing tail still has a rest frame and still passes. The speeds were left where they were.

The half-spacing run is `data/dial_observers_fine.txt`. The smooth stays at 4000. The Cartesian spacing is cut in half, N = 240, and the five layers in z stay, so the slab is thinner. On the half wall the tail ratio falls by about fifteen times: the weak ratio goes from −2.19×10⁻⁵ to −1.48×10⁻⁶ with the shift off, and from −2.16×10⁻⁵ to −1.46×10⁻⁶ at 0.10c. That is the drop of a fourth-order spacing error. That tail is the stencil. On the window the tail moves by about fifteen percent, from −1.89×10⁻⁴ to −1.64×10⁻⁴, and stays under the bar. That tail holds. It is the join from the matter to the vacuum. The finer grid's own worst cells sit somewhere else. On the half wall the diagonal sample next to the origin, at 0.161 m, is over the bar, with a weak ratio of about 2.5×10⁻³, and that cell has a rest frame. On the window the steepest slope, at 12.96 m, carries a rest-frame dominant ratio of 0.306 with the shift off and 0.347 at 0.04c. The N = 120 clean record is the one that stands.

The passenger is `data/dial_passenger.txt`. Ten tonnes of dust at rest in the ship, filling the 2 m ball the slab contains, is added to the coordinate stress-energy of the half wall at 0.10c and the window at 0.04c. The recovered mass is 10,000 kg on both. The dust density is 297 kg/m³. The shell integrals stay 8.2868×10²⁷ kg and 2.3794×10²⁷ kg. The printed ratios, the tail, and the rest-frame count match the clean observer log. The smoother has already put about 10²¹ kg/m³ into that cavity, so the passenger does not move a printed digit. It leaves the tail where it was, and it opens no new violation. The shell mass stays the shell mass.

## The fine-grid centers and the slope ring

Dated 2026-11-02. Logs `data/dial_refine_close.txt` and `data/dial_slope_ray.txt`. The shapes stay fixed. The smooth stays at 4000.

On the half wall at N = 240 the builder density is still zero inside r = 0.1784 m. The four diagonal samples at 0.161 m sit in that ball. Setting them back to zero leaves the exterior tail as the worst cell, at the same ratios the fine-grid tail already printed. Shift off, the exact ratios are −1.465×10⁻⁶, −1.482×10⁻⁶, −1.465×10⁻⁶, and −2.182×10⁻⁶. At 0.10c they are −1.447×10⁻⁶, −1.464×10⁻⁶, −1.447×10⁻⁶, and −2.155×10⁻⁶. All 55,696 midplane cells have a rest frame. Serious fraction 0. Energies 8.3155×10²⁷ kg and 8.2879×10²⁷ kg. The half wall at this spacing is clean.

The window keeps that xy spacing and uses the N = 120 z spacing, 0.45455 m. With the shift off the sampled dominant ratio is 0.340 at 12.962 m, 117.7° off the nose. The exact rest-frame slack is −0.312, on 48 cells, each with a rest frame. At 0.04c the sampled dominant ratio is 0.357 at the same radius, 152.3° off the nose. The exact contraction is −2.304×10⁻², eight cells have no rest frame, and the rest-frame slack is −0.354. Both tails pass. On the thinner z slab that same station read −0.306 and −0.347.

The shift-off ray sets that tensor next to the density and pressure that were placed. At 12.967 m the placed density is 1.262×10²³ kg/m³ and the pressure is 0.0195 of ρc². The dominant margin of that radial matter is 0.980 of the peak. The deepest margin on the radial profile is −1.832×10⁻⁶, at 25.25 m. Along the grid axis the Cartesian density tracks the placed density and the dominant ratio stays near +0.51. The 48 cells under the bar lie from 12.954 m to 12.981 m. On the worst of them the Cartesian density is 3.72×10²² kg/m³, the placed density is 1.19×10²³ kg/m³, and the z stress is 8.93×10²² kg/m³. The four center cells are empty of placed density and read −3.00×10²⁰ kg/m³. Setting those four back to zero moves the null, weak, and strong ratios onto the tail, −1.160×10⁻⁴ and −1.644×10⁻⁴. The rest-frame slack stays −0.312 at 12.962 m. The N = 120 window remains the clean record. Those slope cells stay on the Cartesian difference.

## The flow's tension

Dated 2026-11-02. Logs `data/dial_shoulder_pressure.txt` and `data/dial_tension_lapse.txt`. The mix is unchanged. Ship speed stays out of the pressure. The momentum balance on that mix integrates to a pressure fraction that runs from 0 at the surface down to −0.960. At 9.78 m it is −0.812. At 15.70 m it is −0.473. The shell's hydrostatic fraction at those stations is +0.193 and +0.096.

That tension, times the shell density, is the lapse pressure. On the half wall, with the shift off, the dominant ratio is 0.617 at 16.4 m and the serious fraction is 0.211. At 0.10c the dominant ratio is 1.14 at 10.2 m. At 0.11c it is 1.19, and the side stations read −1.16 at 9.78 m and −0.65 at 15.70 m. On the one-sixth window the shift-off dominant ratio is 0.494. At 0.04c it is 0.789. At 0.06c it is 0.911. The energies stay on the stored masses, 8.3144×10²⁷ kg and 2.3822×10²⁷ kg with the shift off. The positive hydrostatic pressure is what holds those shells. The flow's tension opens a break before the shift is turned on.

## The shift square

Dated 2026-11-02. Log `data/dial_adm_lapse.txt`. The hydrostatic lapse and the mix stay. The builder keeps the lapse and the shift in separate metric components. The 3+1 split that keeps that same lapse writes the square of the shift into the time-time component, γ^{xx} (S v)². Ship speed stays the amplitude of the shift.

With the shift off, both shells match the stored clean lines. The one-sixth window at 0.04c stays clean. All 13,456 midplane cells have a rest frame, and the exact ratios match the stored observer log.

The half wall at 0.10c fails. The dominant ratio is 0.053 at 15.7 m, on the side. Sixteen cells have no rest frame. The exact contraction is −8.91×10⁻³. At 15.70 m the longitudinal stress is 0.075 of peak and the flux is −0.528, so the margin is −0.004. At 9.78 m that margin is +0.089.

At 0.11c the dominant ratio is 0.229 at that outer station. One hundred sixty-eight cells have no rest frame. The exact contraction is −0.119. The inner station at 9.78 m reads +0.176, and the longitudinal stress there is 0.162 of peak. The outer station reads −0.229, and the longitudinal stress there is 0.071 of peak. On the stored hydrostatic shell this speed fails at that outer station with dominant ratio 0.177.

The window at 0.06c fails. The dominant ratio is 0.228 at 16.1 m. Nine hundred fifty-six cells have no rest frame. The exact contraction is −0.211. The tail still has a rest frame.

The square of the shift moves stress from the outer shoulder onto the inner shoulder and loses the 0.10c pass. The hydrostatic time-time component, without that square, remains the record that holds 0.10c and 0.04c.

## The carrier face

Dated 2026-11-03. Log `data/dial_lip_brace.txt`. The one-sixth window keeps its mass, its mix, and its hydrostatic lapse. The metric is not changed. Where the Eulerian energy density is above 10⁻⁸ of peak, the spatial stress gains the face q_i q_j/ρ. The rush and the density stay what the curvature already produced. Ship speed stays the amplitude of the shift.

The unbraced sample maps reproduce the stored lines. With the shift off, the energy is 2.3822×10²⁷ kg and the dominant ratio is 1.604×10⁻⁴. At 0.04c the energy is 2.3794×10²⁷ kg and the dominant ratio is 1.605×10⁻⁴. At 0.06c the dominant ratio is 0.222 at 16.138 m and the serious fraction is 0.0758.

With the face on, the exact observer is clean at all three speeds. All 13,456 midplane cells have a rest frame. At 0.06c the exact ratios are −1.359×10⁻⁴, −1.359×10⁻⁴, −1.891×10⁻⁴, and −1.359×10⁻⁴. The worst cell is the tail at 23.917 m. On the side at 16.14 m the faced longitudinal stress is 0.270 of peak, against a rush of 0.358. At 9.78 m that stress is 0.199. At 12 m it is 0.078. With the shift off the face is zero, and the exact ratios sit on the stored clean line.

The curvature of this metric still produces the soft skin. The pass belongs to the faced matter.

## The side lapse

Dated 2026-11-03. Logs `data/dial_face_curv.txt`, `data/dial_face_lapse.txt`, `data/dial_face_lapse_ray.txt`, and `data/dial_face_lapse_tight.txt`. Same one-sixth window. The mass and the mix stay. A side-weighted change in the time-time component is solved so the Einstein tensor adds the carrier face to the longitudinal stress. The correction scales as (v/0.06)². At rest it is off.

A pure stretch of g_xx at the lip moves the density by about 84 peak-units per unit strain and leaves the longitudinal stress still. A traceless stretch moves the density and that stress together, about 41 and 42. The lapse leaves the density still, about 0.002, and moves the longitudinal stress by about −169 per unit deepening at 16.14 m. The nose, where the angular weight is zero, stays on the hydrostatic lapse.

The inverse of that lapse response does not land on the face. With bells 1.6 m wide the lip rises by 0.191 of peak against a face of 0.257, and the clock rate changes by at most 5.85×10⁻³. The shell at rest stays on the stored clean line, exact ratios −1.356×10⁻⁴. At 0.04c the exact contraction is −0.0801, with 188 cells in Type IV, worst at 19.029 m. At 0.06c the exact contraction is −0.296, with 704 cells in Type IV. The sample's worst cell is at 6.141 m.

Widening the target to the whole side and taking one residual step changes the clock rate by 1.2×10⁻⁵ on the second pass. The miss stays 0.185 of peak. At rest the shell is again the stored clean line. At 0.04c the exact contraction is −0.0172, with 16 cells in Type IV, at 2.963 m on the side. At 0.06c the exact contraction is −0.256, with 856 cells in Type IV. The sample cell at 3.870 m has longitudinal stress −0.269 of peak, where the face owed there is 0.072.

Bells 0.75 m wide, every meter from 3 m to 24 m, have condition 28 and a linear miss of 0.172 of peak. The clock rate changes by at most 9.73×10⁻⁴. The lip rises by 0.203 against a face of 0.257. The same profile pulls between the peaks and on the outer skin: −0.094 at 14 m, −0.092 at 18.97 m, −0.056 at 21 m. The observers were not scored. The side lapse is not adopted. The hydrostatic lapse remains the record that holds the shift-off shell and the 0.04c shell.

## The level fan

Dated 2026-11-03. Log `data/dial_level_fan.txt`. Same book, same mass, same lapse. The shift stays fully on through the inner half of the thick book and comes back level by the outer half-peak shoulder, 16.52 m. Past that shoulder the pages are together: at 17.52 m the flux is zero.

With the shift off, the shell is the stored clean line. At 0.04c the exact contraction is −1.25, with 1,136 cells in Type IV, at 16.15 m on the side. At 0.06c the exact contraction is −2.13, with 1,880 cells in Type IV, and the side flux at 16.14 m is −1.32 of peak against a density of 0.50. The old shift left a flux of −0.36 there. Closing the thin-edge step gathers that slide onto the shoulder, and the speed that used to hold now fails. The level fan is not adopted. The one-sixth window at 0.04c remains the light clean shell.

## The eased recovery

Dated 2026-11-03. Log `data/dial_ease_fan.txt`. Same book, same mass, same lapse. From the slope crest at 12.97 m out to 18.45 m, the shift follows the straight chord of slope the wall already uses. The bend is steady at 0.0236 per square meter. The old sharp bend was 0.0382 per square meter at 15.71 m. The pages inside the crest are the old shift.

With the shift off, the shell is the stored clean line. At 0.04c the exact contraction is −0.115, with 4,796 cells in Type IV, at 18.13 m on the side. At 0.06c the exact contraction is −0.274, with 5,688 cells in Type IV, at 18.07 m. The side flux at 16.14 m is −0.22 of peak, where the old shift left −0.36, and at 17.52 m it is −0.23, where the old shift left −0.19. The steady bend quiets the sharp page and keeps bending in the thin pages. The eased recovery is not adopted. The one-sixth window at 0.04c remains the light clean shell.

## The thickness slack

Dated 2026-11-03. Log `data/dial_slack_fan.txt`. Same book, same mass, same lapse. From the crest at 12.97 m to the window end at 18.45 m, the bend follows the placed density. The slope at the crest and the slope at the window end are the mix. The crest bend is 0.0351 per square meter. The old sharp bend was 0.0382 per square meter at 15.71 m. At 17.52 m the bend is 0.0119 per square meter. The shift is still 0.096 when the window ends. The old shift there is 0.001.

With the shift off, the shell is the stored clean line. At 0.04c the sample is clean and the exact contraction is −7.21×10⁻⁴, under the bar. The worst cell is the trail at 24.32 m, on the back, and 5,480 cells there have no rest frame. At 0.06c the exact contraction is −0.143, at 9.32 m on the side. The thin pages are quieter: the side flux at 17.52 m is −0.12 of peak, and at 16.14 m it is −0.21. The inner shoulder we left alone is now the loudest page. The thickness slack is not adopted. The one-sixth window at 0.04c remains the light clean shell.

## The inner buildup

Dated 2026-11-03. Log `data/dial_build_fan.txt`. Same book, same mass, same lapse. The outer recovery stays the thickness slack. From 6.87 m to the crest at 12.97 m, the climb of the slope follows the placed density. The steepening had peaked at 9.92 m. At 9.78 m that steepening falls from 0.0232 to 0.0158 per square meter, and the thick page at 12 m takes more of it. The crest shift rises from 0.384 to 0.433, so the leftover at the window end is 0.144.

With the shift off, the shell is the stored clean line. At 0.04c the sample is clean. The exact contraction is −1.11×10⁻³, just over the bar, in the trail at 24.32 m on the back, with 5,592 cells that have no rest frame. At 0.06c the side rush at 9.78 m is +0.25 of peak, where the slack left +0.36, and at 12 m it is +0.32, where the slack left +0.23. The exact contraction is −0.0952, at 2.96 m on the side, the cavity wall this window does not reach. The inner buildup is not adopted. The one-sixth window at 0.04c remains the light clean shell.

## The wall buildup

Dated 2026-11-03. Log `data/dial_wall_fan.txt`. Same book, same mass, same lapse. The outer recovery stays the thickness slack, and the crest stays the mix, so the trail is that slack's trail. From the cavity wall at 2.85 m to the crest, the climb follows the placed density. The slope at the wall is 0.0111 per meter. The mix slope there is 0.0089 per meter. The shift at 3 m stays 0.993.

With the shift off, the shell is the stored clean line. At 0.04c the sample fails at 2.75 m, just inside the wall, and the exact contraction is −9.01×10⁻³. The tail is −7.21×10⁻⁴, the thickness-slack tail. At 0.06c the side rush at 3 m is +0.17 of peak, where the mix left +0.16, and at 6.14 m it is +0.18, where the mix left +0.10. At 9.78 m it is +0.24, where the slack left +0.36. The exact contraction is −0.138, at 2.75 m. The wall buildup is not adopted. The one-sixth window at 0.04c remains the light clean shell.

## The cabin edge

Dated 2026-11-03. Log `data/dial_cabin_fan.txt`. Same book, same mass, same lapse. The outer recovery stays the thickness slack, and the crest stays the mix. The climb from the wall follows the cumulative thickness and starts on the mix slope. The exponent is 1.047, fixed by the mix drop. The first step matches the mix. At 2.75 m and at 2.85 m the shift stays the mix.

With the shift off, the shell is the stored clean line. At 0.04c the sample is clean. The exact contraction is −7.21×10⁻⁴, under the bar, in the trail at 24.32 m on the back, with 5,480 cells that have no rest frame. At 0.06c the side rush at 3 m is +0.12 of peak, where the wall buildup left +0.17. At 2.75 m it is +0.12 against a density of 0.21. The exact contraction is −0.0652, at 2.51 m on the side. The cabin-edge climb is not adopted. The one-sixth window at 0.04c remains the light clean shell.

## The cabin cell

Dated 2026-11-03. Log `data/dial_cell_fan.txt`. Same book, same mass, same lapse. The cabin shift stays the mix. The slope stays at the wall value, 0.0089 per meter, from the wall out to 4.14 m, the corner of the fourth-order difference. Past that corner the climb follows the cumulative thickness. The exponent is 1.269, fixed by the mix drop. The crest stays at 0.384. At 2.51 m the shift, the slope, and the bend stay the mix.

With the shift off, the shell is the stored clean line. At 0.04c the sample is clean. The exact contraction is −7.21×10⁻⁴, under the bar, in the trail at 24.32 m on the back, with 5,480 cells that have no rest frame. At 0.06c the side rush at 3 m is +0.06 of peak, where the cabin-edge climb left +0.12, and at 3.76 m it is +0.02. At 2.51 m it is +0.13 against a density of 0.19. The exact contraction is −0.0695, at 2.51 m on the side, place 95°. The sample's loudest page is at 8.44 m. The cabin-cell hold is not adopted. The one-sixth window at 0.04c remains the light clean shell.

## The flat cabin

Dated 2026-11-03. Log `data/dial_flat_fan.txt`. Same book, same mass, same lapse. The shift is held at 1, and the slope at 0, from the center out to 4.14 m, the corner of the fourth-order difference. That covers the 2.51 m page and the stencil that reads it. From that corner the climb follows the cumulative thickness, from zero slope up to the mix crest slope. The exponent is 1.561, fixed by the drop from a full shift down to the mix crest. The crest stays at 0.384. At 2.51 m the shift is 1 and the slope and the bend are 0.

With the shift off, the shell is the stored clean line. At 0.04c the sample is clean. The exact contraction is −7.21×10⁻⁴, under the bar, in the trail at 24.32 m on the back, with 5,480 cells that have no rest frame. At 0.06c the side flux at 2.51 m is −0.008 of peak against a density of 0.19, where the cabin-cell hold left +0.13. The pages through 3.76 m stay near −0.01. The exact contraction is −0.0938, at 8.44 m, place 63°, direction 6.9°. The flat cabin is not adopted. The one-sixth window at 0.04c remains the light clean shell.

## The flat band

Dated 2026-11-03. Log `data/dial_band_fan.txt`. Same book, same mass, same lapse. The cabin stays at shift 1, slope 0, out to 4.14 m. From 7.15 m to 9.72 m, the stencil of the 8.44 m cell, the shift is held flat at 0.737. The climb before that band peaks at the crest slope and returns to zero slope. The climb after it follows the thickness, exponent 5.32, and lands on the mix crest, 0.384. At 8.44 m the slope and the bend are 0. At 2.51 m the shift is still 1.

With the shift off, the shell is the stored clean line. At 0.04c the sample fails at 4.47 m. The exact contraction is −1.98, place 75°, direction 11°. At 0.06c the side flux at 8.44 m is −0.015 of peak against a density of 0.46, where the flat cabin left +0.26 at 8 m. The cabin at 2.51 m stays at −0.008. The exact contraction is −3.24, at 4.47 m, place 75°, direction 11°. The flat band is not adopted. The one-sixth window at 0.04c remains the light clean shell.

## The soft rise

Dated 2026-11-03. Log `data/dial_rise_fan.txt`. Same book, same mass, same lapse. The cabin stays at shift 1, slope 0, out to 4.14 m. From 7.15 m to 9.72 m the shift stays flat, now at 0.791, because the climb off the cabin spends less. That climb is the square of the band's quadratic. It starts and ends at zero slope and zero steepening, and it still peaks at the crest slope. It spends 0.209. The climb after the shelf follows the thickness, exponent 20.6, and lands on the mix crest, 0.384. At 4.14 m the steepening is about zero. At 8.44 m the slope and the bend are 0. At 2.51 m the shift is still 1.

With the shift off, the shell is the stored clean line. At 0.04c the sample fails at 9.84 m. The exact contraction is −3.57, place 83°, direction 3.9°. At 0.06c the side flux at 4.47 m is +0.97 of peak against a density of 0.36, where the flat band left +1.54 at 4.50 m. The shelf at 8.44 m stays at −0.017 against a density of 0.46. The cabin at 2.51 m stays at −0.008. The exact contraction is −5.78, at 9.84 m, place 83°, direction 3.8°. The soft rise is not adopted. The one-sixth window at 0.04c remains the light clean shell.

## The soft leave

Dated 2026-11-03. Log `data/dial_leave_fan.txt`. Same book, same mass, same lapse. The cabin stays at shift 1, slope 0, out to 4.14 m. The shelf stays flat from 7.15 m to 9.72 m at 0.791. The climb off that shelf is the square of the front law, so the steepening starts at zero. The exponent is 31.5, fixed by the same drop, and it lands on the mix crest, 0.384. At 9.72 m the slope and the bend are 0. At 8.44 m they are 0. At 2.51 m the shift is still 1.

With the shift off, the shell is the stored clean line. At 0.04c the sample fails at 9.90 m. The exact contraction is −3.84, place 99°, direction 5.2°. At 0.06c the side flux at 9.84 m is +2.62 of peak against a density of 0.62. The shelf at 8.44 m stays at −0.017. The cabin at 2.51 m stays at −0.008. The exact contraction is −6.20, at 9.90 m, place 99°, direction 5.1°. The soft leave is not adopted. The one-sixth window at 0.04c remains the light clean shell.

## The even ramp

Dated 2026-11-03. Log `data/dial_even_fan.txt`. Same book, same mass, same lapse. The cabin stays at shift 1, slope 0, out to 4.14 m. The shelf stays flat from 7.15 m to 9.72 m at 0.791. The climb off that shelf rises at one even steepening for 0.362 m, to 10.09 m, then holds the crest slope. The length is the one that spends the drop the quartic leaves, 0.407, and it lands on the mix crest, 0.384. At 9.72 m the slope and the bend are 0. At 9.90 m the steepening is 0.367 per square meter. At 11.19 m the slope is the crest slope and the bend is 0. At 8.44 m the slope and the bend are 0. At 2.51 m the shift is still 1.

With the shift off, the shell is the stored clean line. At 0.04c the sample fails at 9.90 m, louder than the soft leave. The exact contraction is −3.89, place 99°, direction 5.2°. At 0.06c the side flux at 9.90 m is +2.36 of peak against a density of 0.63, and at 9.78 m it is +2.81. The shelf at 8.44 m stays at −0.017. The cabin at 2.51 m stays at −0.008. The exact contraction is −6.28, at 9.90 m, place 99°, direction 5.1°. The even ramp is not adopted. The one-sixth window at 0.04c remains the light clean shell.

## The even arc

Dated 2026-11-03. Log `data/dial_arc_fan.txt`. Same book, same mass, same lapse. The cabin stays at shift 1, slope 0, out to 4.14 m. The shelf stays flat from 7.15 m to 9.72 m at 0.791. The climb off the shelf rises at one even steepening, 0.037 per square meter, until the slope reaches the crest slope at 13.30 m, holds that slope to 14.96 m, and comes back down to the window-end slope at the same steepening. That steepening is the one value that spends the drop from the shelf, 0.791, down to the slack leftover, 0.096. The shift at the crest radius is 0.595. The mix crest is 0.384. At 9.90 m the slope is −0.0066 per meter. At 8.44 m the slope and the bend are 0. At 2.51 m the shift is still 1.

With the shift off, the shell is the stored clean line. At 0.04c the sample fails at 4.91 m. The exact contraction is −1.98, place 103°, direction 10.5°. At 0.06c the side flux at 9.90 m is +0.32 of peak against a density of 0.63, where the even ramp left +2.36. The shelf at 8.44 m stays at −0.016. The cabin at 2.51 m stays at −0.008. The outer page at 17.52 m is −0.36, where the even ramp left −0.12. The exact contraction is −3.25, at 4.91 m, place 103°, direction 10.3°. The even arc is not adopted. The one-sixth window at 0.04c remains the light clean shell.

## The shared bend

Dated 2026-11-03. Log `data/dial_share_fan.txt`. Same book, same mass, same lapse. The cabin stays at shift 1, slope 0, out to 4.14 m. The shelf stays flat from 7.15 m to 9.72 m at 0.892. The climb off the cabin is an even triangle in radius, and the arc off the shelf uses the same steepening, 0.048 per square meter. That value is the one where the two bends meet. The triangle peaks at 0.072 per meter, under the crest slope. Its corner is at 5.65 m, and the bend sampled there is 0.018 per square meter. The arc reaches the crest slope at 12.51 m and holds it to 15.73 m. The shift at the crest radius is 0.647. The mix crest is 0.384. The leftover stays 0.096. At 8.44 m the slope and the bend are 0. At 2.51 m the shift is still 1.

With the shift off, the shell is the stored clean line. At 0.04c the sample fails at 5.23 m. The exact contraction is −0.630, place 87.5°, direction 1.6°. At 0.06c the side flux at 4.91 m is +0.70 of peak against a density of 0.39, where the even arc left +1.04 at 4.50 m. The corner at 5.65 m is +0.07. The page at 9.90 m is +0.41, where the even arc left +0.32. The shelf at 8.44 m stays at −0.019. The cabin at 2.51 m stays at −0.008. The outer page at 17.52 m is −0.46, where the even arc left −0.36. The exact contraction is −1.20, at 5.23 m, place 87.5°, direction 1.5°. The shared bend is not adopted. The one-sixth window at 0.04c remains the light clean shell.

## The spanned bend

Dated 2026-11-03. Log `data/dial_span_fan.txt`. Same book, same mass, same lapse. The cabin stays at shift 1, slope 0, out to 4.14 m. The shelf stays flat from 7.15 m to 9.72 m at 0.964. The climb off the cabin rises for 0.22 m, holds that slope across 2.57 m, one stencil, and falls over the last 0.22 m. The two reversals sit at 4.36 m and 6.93 m. The steepening is 0.059 per square meter, the one value shared with the arc. The climb peaks at 0.013 per meter. At 5.23 m the slope is −0.013 per meter and the bend is 0. The arc reaches the crest slope at 11.96 m and holds it to 16.27 m. The shift at the crest radius is 0.682. The mix crest is 0.384. The leftover stays 0.096. At 8.44 m the slope and the bend are 0. At 2.51 m the shift is still 1.

With the shift off, the shell is the stored clean line. At 0.04c the sample fails at 10.23 m. The exact contraction is −0.601 at 18.07 m, place 96.5°, direction 174°. At 0.06c the side flux at 5.23 m is +0.014 of peak against a density of 0.40. On the shared bend the side current at 4.91 m was +0.70. The page at 9.90 m is +0.52, where the shared bend left +0.41. The page at 16.14 m is −0.08, where the shared bend left −0.47. The outer page at 17.52 m is −0.58, where the shared bend left −0.46. The shelf at 8.44 m stays at −0.020. The cabin at 2.51 m stays at −0.008. The exact contraction is −1.00, at 18.07 m, place 96.5°, direction 174°. The spanned bend is not adopted. The one-sixth window at 0.04c remains the light clean shell.

## The tapered fall

Dated 2026-11-03. Log `data/dial_taper_fan.txt`. Same book, same mass, same lapse. The cabin stays at shift 1, slope 0, out to 4.14 m. The shelf stays flat from 7.15 m to 9.72 m at 0.942. The climb off the cabin stays the spanned climb. It rises for 0.22 m, holds that slope across 2.57 m, one stencil, and falls over the last 0.22 m. The two reversals sit at 4.36 m and 6.93 m. The steepening is 0.093 per square meter, the one value shared with the arc. The climb peaks at 0.021 per meter. At 5.23 m the slope is −0.021 per meter and the bend is 0. The arc reaches the crest slope at 11.14 m and holds it to 15.86 m. From there the bend eases from 0.093 down to the book's own 0.0063 per square meter over 2.60 m, and the slope lands on the book's end slope. The shift at the crest radius is 0.606. The mix crest is 0.384. The leftover stays 0.096. At 18.07 m the bend is 0.019 per square meter. At 8.44 m the slope and the bend are 0. At 2.51 m the shift is still 1.

With the shift off, the shell is the stored clean line. At 0.04c the sample fails at 10.70 m. The exact contraction is −0.975 at 10.70 m, place 93.7°, direction 3.0°. At 0.06c the side flux at 18.07 m is −0.194 of peak against a density of 0.21. On the spanned bend the exact cell was at 18.07 m with contraction −1.00, and the side current at 17.52 m was −0.58. The page at 17.52 m is −0.37. The page at 18.45 m is −0.081, where the spanned bend left −0.35. The page at 16.14 m is −0.81, where the spanned bend left −0.079. The page at 9.90 m is +0.83, where the spanned bend left +0.52. The page at 5.23 m is +0.032. The shelf at 8.44 m stays at −0.020. The cabin at 2.51 m stays at −0.008. The exact contraction is −1.88, at 10.70 m, place 93.7°, direction 2.9°. The tapered fall is not adopted. The one-sixth window at 0.04c remains the light clean shell.

## Limits

The metric is a coast at constant speed. Acceleration is not in the run. The test is Warp Factory's Eulerian energy conditions, sampled on the solver's observer set. On the 166.8 m grid the 0.10c mix is under the clean bar. On the 83.4 m grid the raw difference is over the bar on four samples inside the flat ball, and the restored continuum value is under the bar. The 166.8 m grid's tight cell at 118 m sits outside that ball, where the smoothed density has already turned on, and its stencil residual remains under the bar. On the two clean 20 m shapes at N = 120 the all-observer minima stay under the bar, and every cell has a rest frame. The frame transfer itself still builds only the Eulerian orthonormal frame. At half that spacing the half-wall tail falls by about fifteen times and the window tail holds to about fifteen percent. The parked 0.11c and 0.06c failures are wall cells with no rest frame. Ten tonnes of dust in the cavity does not move the clean ratios. On the N = 240 half wall the four origin samples sit inside r < 0.1784 m, and restoring them puts that metric under the bar at 0 and at 0.10c. On the window the same restoration clears the origin. Forty-eight cells from 12.954 m to 12.981 m stay under the bar on the Cartesian difference, while the density and pressure placed there keep a dominant margin of 0.980 of peak. The N = 120 window stays the clean record. The pressure the mix flow asks for is tension, down to −0.960 of ρc², and a lapse built from that tension breaks the half wall and the window with the shift off. Adding the square of the shift to the hydrostatic time-time component breaks the 0.10c half wall and leaves the 0.11c and 0.06c wall cells without a rest frame. The 0.04c window stays clean. The carrier face q_i q_j/ρ on the Eulerian matter of that window clears the exact observer at 0.06c, with every midplane cell in a rest frame, and leaves the shift-off shell and the 0.04c shell on the stored tail. The metric is unchanged, and the unbraced sample at 0.06c still fails at 16.138 m. A side-weighted lapse solved for that face keeps the shift-off shell on the stored line and fails at 0.04c and at 0.06c. The tight basis misses the face by 0.172 of peak and pulls on the outer skin. Bringing the shift back to level by the outer half-peak shoulder quiets the thin edge and fails the 0.04c shell at that shoulder. Easing the outer slope onto the straight chord from the crest to the window end quiets the lip at 16.14 m and fails the 0.04c shell at 18.13 m. Letting that recovery follow the placed density quiets the thin pages. At 0.04c the exact contraction stays under the bar and 5,480 trail cells have no rest frame. At 0.06c the worst cell is the inner shoulder at 9.32 m. Letting the inner buildup follow the placed density quiets that shoulder and moves the 0.06c cell to the cavity wall at 2.96 m. The leftover shift rises to 0.144 and the 0.04c trail crosses the bar. Holding the crest and starting that climb at the cavity wall puts the trail back and opens the cabin edge at 2.75 m. The 3 m rush stays. Starting that climb on the mix slope closes the cell at 2.75 m. The 0.04c sample is clean again. The 0.06c cell moves to 2.51 m on the side. Holding the wall slope through the fourth-order corner quiets the 3 m rush and leaves that 0.06c cell at 2.51 m. Holding the full shift flat through that corner quiets the 2.51 m page and moves the 0.06c cell to 8.44 m. Holding the shift flat across that cell's stencil quiets the 8.44 m page and breaks the 0.04c sample at 4.47 m. Squaring that climb so the steepening starts at zero lowers the flux on the 4.47 m page and moves the cell to 9.84 m, and the 0.04c sample fails harder. Squaring the climb off that shelf moves the cell from 9.84 m to 9.90 m, and the 0.04c sample fails harder. Holding that climb to one even steepening leaves the cell at 9.90 m, and the 0.04c sample fails harder. Spreading that climb through the crest at one even steepening moves the cell from 9.90 m to 4.91 m. The 0.04c peak eases, and more of the shell sits over the bar. Sharing one steepening between that cabin climb and that arc moves the cell from 4.91 m to 5.23 m. The 0.04c peak eases, and more of the shell sits over the bar. Splitting that climb's reversal across one stencil quiets the 5.23 m page and moves the exact cell to 18.07 m. The peak eases, and fewer cells sit over the bar. Easing that return onto the book's own outer bend quiets the 18.07 m page and moves the exact cell to 10.70 m. The peak rises, and fewer cells sit over the bar. 0.11c on this join fails in the outer wall on both grids, and at the same fraction of the radius on the 20 m shell. The 83.4 m score is in `data/dial_flatball_11_fine.txt`: dominant ratio 0.177 at 7,720 m. On the 20 m FSOT wall the same ratio is 0.177 at 15.7 m (`data/dial_fuchs_size.txt`). Their 10 m cabin does not hold 0.06c (`data/dial_cabin_gap.txt`).

## License

Apache License 2.0. See [LICENSE](LICENSE) and [NOTICE](NOTICE).
