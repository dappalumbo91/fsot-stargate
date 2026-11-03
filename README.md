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

The metric score uses the Octave port of [Warp Factory](https://github.com/NerdsWithAttitudes/WarpFactory) at commit `03b10cb`. Copy `octave/dial_mix.m` into that port's `fsot_warp` directory. Set `SHELL_ENV` to `data/shell_env.txt` and `OUT` to a writable directory. The clean log from that script is `data/dial_mix.txt`. `octave/dial_mix_fine.m` is the same join at `N = 320`. Its log is `data/dial_mix_fine.txt`. `octave/dial_center.m` is the shift-off census. Its log is `data/dial_center.txt`. `octave/dial_flatball.m` restores the flat ball. Its log is `data/dial_flatball.txt`. `octave/dial_fuchs_size.m` scores the FSOT wall at 20 m. Its log is `data/dial_fuchs_size.txt`. `octave/dial_cabin_gap.m` scores their cabin at compactness 1/2. Its log is `data/dial_cabin_gap.txt`. `octave/dial_audit_bar.m` repeats the 0.10c line and scores the parked shell. Its log is `data/dial_audit_bar.txt`. `octave/dial_cabin_vacuum.m` prints how far the mass smooth reaches into the cabin. Its log is `data/dial_cabin_vacuum.txt`. It does not score the energy conditions. `octave/dial_mass_down.m` scores compactness 1/4 and 1/5 at 0.04c and 0.06c. Its log is `data/dial_mass_down.txt`. `octave/dial_mass_down_16.m` scores compactness 1/6 at 0.04c. Its log is `data/dial_mass_down_16.txt`. `octave/dial_sixth_push.m`, `octave/dial_sixth_cover.m`, and `octave/dial_sixth_max.m` keep that one-sixth mass and move it relative to the mix slope. Their logs are `data/dial_sixth_push.txt`, `data/dial_sixth_cover.txt`, and `data/dial_sixth_max.txt`. `octave/dial_sixth_band.m` compares the slope, the foot payment, and a join smoothed afterward. Its log is `data/dial_sixth_band.txt`. `octave/dial_sixth_inner.m` restores the wall only in the foot. Its log is `data/dial_sixth_inner.txt`. `octave/dial_sixth_chord.m` holds the outer slope to the chord out to the shell face. Its log is `data/dial_sixth_chord.txt`. `octave/dial_sixth_bend.m` stops that chord one curvature-rise past the strongest bend. Its log is `data/dial_sixth_bend.txt`, and that run is clean at 0.04c. `octave/dial_seventh_bend.m` is that window at compactness 1/7. Its log is `data/dial_seventh_bend.txt`. `octave/dial_seventh_clip.m` draws the chord to the shell face and applies it only inside the window. Its log is `data/dial_seventh_clip.txt`. `octave/dial_sixth_bend_06.m` is the one-sixth window at 0.06c. Its log is `data/dial_sixth_bend_06.txt`. `octave/dial_seventh_plateau.m` holds the max slope through the strongest bend. Its log is `data/dial_seventh_plateau.txt`. `octave/dial_coast_stack.m` scores the half-compact 20 m wall at 0, 0.02, 0.04, 0.06, 0.08, and 0.10, and the one-sixth bend window at 0, 0.02, and 0.04. Its log is `data/dial_coast_stack.txt`. `octave/dial_ship_beam.m` scores Minkowski dust, a forward null flux, and both together. Its log is `data/dial_ship_beam.txt`. That run is not a shell. `octave/dial_observers.m` minimizes the null, weak, and strong contractions over every direction, and reads the rest-frame dominant slack, on the half-compact wall at 0 and 0.10c and on the one-sixth bend window at 0 and 0.04c. Its log is `data/dial_observers.txt`. `octave/dial_observers_parked.m` reads the parked 0.11c and 0.06c failures the same way. Its log is `data/dial_observers_parked.txt`. `octave/dial_observers_fine.m` rebuilds those two clean shapes at half the spacing. Its log is `data/dial_observers_fine.txt`. `octave/dial_passenger.m` adds 10 tonnes of dust at rest in the ship on the two clean speeds. Its log is `data/dial_passenger.txt`. `octave/dial_refine_close.m` restores the half-wall flat ball on the N = 240 grid and rebuilds the window with the N = 120 z spacing. Its log is `data/dial_refine_close.txt`. `octave/dial_slope_ray.m` compares the placed density and pressure with the Cartesian tensor on that window, shift off, and restores the empty center cells. Its log is `data/dial_slope_ray.txt`. `octave/dial_shoulder_pressure.m` integrates the pressure the mix flow asks for. Its log is `data/dial_shoulder_pressure.txt`. `octave/dial_tension_lapse.m` puts that pressure into the lapse and scores the wall breaks. Its log is `data/dial_tension_lapse.txt`. `octave/dial_adm_lapse.m` adds the square of the shift to the hydrostatic time-time component and scores the same speeds. Its log is `data/dial_adm_lapse.txt`. `octave/dial_lip_brace.m` keeps that one-sixth window and adds the carrier face q_i q_j/ρ to the Eulerian stress. Its log is `data/dial_lip_brace.txt`.

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

## Limits

The metric is a coast at constant speed. Acceleration is not in the run. The test is Warp Factory's Eulerian energy conditions, sampled on the solver's observer set. On the 166.8 m grid the 0.10c mix is under the clean bar. On the 83.4 m grid the raw difference is over the bar on four samples inside the flat ball, and the restored continuum value is under the bar. The 166.8 m grid's tight cell at 118 m sits outside that ball, where the smoothed density has already turned on, and its stencil residual remains under the bar. On the two clean 20 m shapes at N = 120 the all-observer minima stay under the bar, and every cell has a rest frame. The frame transfer itself still builds only the Eulerian orthonormal frame. At half that spacing the half-wall tail falls by about fifteen times and the window tail holds to about fifteen percent. The parked 0.11c and 0.06c failures are wall cells with no rest frame. Ten tonnes of dust in the cavity does not move the clean ratios. On the N = 240 half wall the four origin samples sit inside r < 0.1784 m, and restoring them puts that metric under the bar at 0 and at 0.10c. On the window the same restoration clears the origin. Forty-eight cells from 12.954 m to 12.981 m stay under the bar on the Cartesian difference, while the density and pressure placed there keep a dominant margin of 0.980 of peak. The N = 120 window stays the clean record. The pressure the mix flow asks for is tension, down to −0.960 of ρc², and a lapse built from that tension breaks the half wall and the window with the shift off. Adding the square of the shift to the hydrostatic time-time component breaks the 0.10c half wall and leaves the 0.11c and 0.06c wall cells without a rest frame. The 0.04c window stays clean. The carrier face q_i q_j/ρ on the Eulerian matter of that window clears the exact observer at 0.06c, with every midplane cell in a rest frame, and leaves the shift-off shell and the 0.04c shell on the stored tail. The metric is unchanged, and the unbraced sample at 0.06c still fails at 16.138 m. 0.11c on this join fails in the outer wall on both grids, and at the same fraction of the radius on the 20 m shell. The 83.4 m score is in `data/dial_flatball_11_fine.txt`: dominant ratio 0.177 at 7,720 m. On the 20 m FSOT wall the same ratio is 0.177 at 15.7 m (`data/dial_fuchs_size.txt`). Their 10 m cabin does not hold 0.06c (`data/dial_cabin_gap.txt`).

## License

Apache License 2.0. See [LICENSE](LICENSE) and [NOTICE](NOTICE).
