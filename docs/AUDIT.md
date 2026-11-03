# Audit, 2026-10-29

The chain from the pin through the wall, the mix, and the Warp Factory score was checked again. No scored claim changed.

## What was checked

The live pin still hashes to AEB2AD. The relaxation length from the transport coefficients is `ell = 0.8573494832025231`, and the stored cavity is `R2 * (1 - ell)`. The compactness-1/2 mass in `data/shell_env.txt` matches the constants that wrote that file. Warp Factory's constants put the same mass at Rs/R2 = 0.500021.

The first number in `data/shell_env.txt`, 4.655124×10²⁴ kg, is a 110 m wall at that same density and the same wall fraction. The scorers read the radii and the mass. They do not use the first number.

The mix is the join already proved in `lean/WarpMix.lean`. On 2,116 pairs of the unit square the scored `1e-8` gate moves the join by at most 1.25×10⁻¹⁷. Cabin `(1, 1)` is 1. Surface `(0, 0)` is 0. Lean 4.31.0 accepts the file from the FSOT-2.1-Lean checkout. The proof does not evaluate the Einstein tensor. The energy conditions stay with Warp Factory.

The integrated energy is 1.231 times the compactness mass on the 9.81 km body (4.0651×10³⁰ / 3.303043×10³⁰) and 1.231 times the compactness mass on the 20 m shell. The factor is the pressure and the curved volume in the solver integral. It is the same factor at both sizes.

Every stored CLEAN and FAIL line has its shift within 1.5×10⁻³ of the requested speed, and every CLEAN line has serious fraction 0.

## The clean flag

`dial_fuchs_size.m` and `dial_cabin_gap.m` already required the peak shift to equal the requested speed. `dial_mix.m`, `dial_mix_fine.m`, and `dial_flatball.m` printed the shift and did not require it inside the clean flag. They now do. The stored logs already passed that test, so no label changed. The logs were not regenerated.

## Fresh 20 m runs

`octave/dial_audit_bar.m` scores the same mix on the same N = 120 grid as `dial_fuchs_size.m`. The log is `data/dial_audit_bar.txt`.

| Case | Energy | Dominant / peak | Where | Result |
| --- | ---: | ---: | --- | --- |
| Compactness 1/2, shift off | 8.3144×10²⁷ kg | 1.95×10⁻⁵ | exterior, 26.47 m | clean |
| Compactness 1/2, 0.10c | 8.2868×10²⁷ kg | 1.92×10⁻⁵ | exterior, 26.47 m | clean |
| Compactness 1/3, shift off | 5.1495×10²⁷ kg | 1.71×10⁻⁵ | exterior, 26.47 m | clean |

The 0.10c line matches `data/dial_fuchs_size.txt` on energy, the four ratios, the serious fraction, the shift, and the cell that holds the dominant ratio. The wall-clock seconds differ. With the shift off, the same matter is already under the bar. Turning the shift on at 0.10c moves the energy from 8.3144×10²⁷ kg to 8.2868×10²⁷ kg and leaves the violation at 26.47 m. The smoothed density ends at 26.57 m, so that cell is the tip of the mass smooth.

## The cabin after the mass smooth

`data/dial_cabin_vacuum.txt` uses the builder's four-pass mass smooth and does not score the energy conditions. On the 20 m grid the mass window is 3.29 m and the shift window is 1.84 m.

On the FSOT wall the density is zero out to 0.18 m and under 1% of the wall out to 0.42 m. At 2.85 m the density is 49% of the wall and the shift is 0.994. On their cabin the density is zero out to 3.43 m and under 1% out to 5.72 m. At 9.78 m the density is 46% of the wall and the shift is 0.985. Lowering the compactness does not move those radii. The density ratio is set by the smooth, and the mass only sets the height of the wall.

That is a confirmation of the record. It is not a lighter shell and not a new speed. The 0.11c failure at compactness 1/2, dominant ratio 0.177 in the outer wall, is unchanged. Their 10 m cabin remains clean at 0.04c and over the bar at 0.06c.

## What this is

Inside this Eulerian Warp Factory test, the FSOT wall at 20 m is clean at 0.10c, five times the published Fuchs 0.02c pass, at 1.5 times that mass. Their cabin is clean at 0.04c. The run is a coast at constant speed. It is not a built device, and it is not faster than light.

## Lean stamp, 2026-11-01

Lean 4.31.0 and Mathlib v4.31.0 accept `lean/WarpMix.lean` and `lean/WarpLedger.lean` from the FSOT-2.1-Lean checkout. The second file checks the compactness mass, the bend window, the printed clean and fail lines, and the ship-scale ledger. The one-g film target in that ledger is absorption 2.50×10⁻⁴, the 0.25 g cruise scaled with the same 2E/c. The proofs do not evaluate the Einstein tensor. The sail figures and the tidal radii are not Warp Factory scores.

## Coast stack, ship beam, and the film hold, 2026-11-02

`data/dial_coast_stack.txt` repeats the stored anchors and scores the tabulated speeds between shift off and the clean speed. The half-compact wall at 0.10c matches this audit: energy 8.2868×10²⁷ kg, null and strong 1.067×10⁻⁵, weak 2.158×10⁻⁵, dominant 1.923×10⁻⁵, serious fraction 0, shift 0.10. The parked half wall matches: energy 8.3144×10²⁷ kg, dominant 1.947×10⁻⁵. The one-sixth window at 0.04c matches `data/dial_sixth_bend.txt`: energy 2.3794×10²⁷ kg, null and weak 6.785×10⁻⁵, strong 1.889×10⁻⁴, dominant 1.605×10⁻⁴, shift 0.04. The coasts at 0.02, 0.04, 0.06, and 0.08 on the half wall, and at 0 and 0.02 on the window, are clean on the same bar. No speed was inserted between those steps. 0.11c was not rerun.

`data/dial_ship_beam.txt` scores order-1 Minkowski tensors in the same energy-condition function. Dust, a forward null flux, and both together stay at or above zero for every sampled Eulerian observer. The null flux prints dominant −0.0, which is the margin, and null 1.026×10⁻⁴, because the angular grid does not land on the exact forward ray. This is not a shell mass.

`lean/WarpLedger.lean` also checks the film hold. One leg to 0.04c lies between 56.5 and 56.7 days and between 195.5 and 196.5 AU. The round-trip energy 20000 × (c/25) × c lies between 7.185×10¹⁹ J and 7.195×10¹⁹ J. Two legs equal twice one leg. Lean 4.31.0 accepted the file on 2026-11-02 from the FSOT-2.1-Lean checkout. The proof does not evaluate the Einstein tensor. The public rounding is 56.6 days, 196 AU, and 7.19×10¹⁹ J.

The Octave frame transfer still implements only the Eulerian observer.

## Every observer, 2026-11-02

`data/dial_observers.txt` scores the half-compact wall at 0 and 0.10c and the one-sixth bend window at 0 and 0.04c. The sampled lines match the coast anchors above, including energy, the four ratios, the serious fraction, and the shift. The exact weak ratio on the shift-off half wall is −2.185×10⁻⁵, the same figure as the sampled weak ratio. The exact strong ratio on the 0.04c window is −1.889×10⁻⁴, the same figure as the sampled strong ratio. The rest-frame dominant slack is −3.716×10⁻⁵ with the shift off and −3.670×10⁻⁵ at 0.10c, both at 26.2 m, with the worst contraction pointing backward. On the window it is −1.356×10⁻⁴ at 0 and −1.357×10⁻⁴ at 0.04c, both at 23.9 m, with the worst contraction pointing to the side. All 13,456 midplane cells are Type I. Serious fraction 0. The tail by itself carries those worst cells and stays under the bar. The check does not add a second frame. It minimizes over every direction in the Eulerian frame this port already builds. The seat of the cell, as distinct from that direction, is in `data/dial_passenger.txt`: null at 26.216 m and 4.5° on the half wall, rest-frame slack at 26.161 m and 87.5°, window null at 23.917 m and 3.8°, window strong at 23.542 m and 96.1°.

## Parked failures, half spacing, and the passenger, 2026-11-02

`data/dial_observers_parked.txt` reads 0.11c on the half wall and 0.06c on the one-sixth window. The sampled dominant ratios match the stored failures: 0.1771 at 15.697 m, place 87.5°, and 0.2223 at 16.138 m, place 90.8°. The exact contractions are −7.523×10⁻² at 15.683 m, place 89.2°, direction 179.1°, and −0.2051 at 16.215 m, place 84.4°, direction 173.7°. Those cells are Type IV. The counts are 184 and 1,028. Type II is 0. The tails pass, at −3.660×10⁻⁵ and −1.359×10⁻⁴, and the tail cells are Type I.

`data/dial_observers_fine.txt` is N = 240, h = 0.22727 m, smoothFactor 4000, nz = 5. Half-wall tail weak ratios: −1.482×10⁻⁶ with the shift off and −1.464×10⁻⁶ at 0.10c, against −2.185×10⁻⁵ and −2.158×10⁻⁵ at N = 120. Window tail strong ratios: −1.644×10⁻⁴ and −1.645×10⁻⁴, against −1.888×10⁻⁴ and −1.889×10⁻⁴. The half-wall global failure is the diagonal at 0.161 m, exact weak −2.493×10⁻³ and −2.602×10⁻³, Type I, 55,696 cells with a rest frame. The window global failure is 12.962 m, rest-frame dominant −0.3060 with the shift off (decMiss 52) and −0.3469 at 0.04c, with 8 Type IV cells and exact null −1.616×10⁻². Energies 8.3155×10²⁷, 8.2879×10²⁷, 2.3817×10²⁷, and 2.3789×10²⁷ kg.

`data/dial_passenger.txt` recovers 10000.000000 kg on both clean speeds. Dust maxima are 297.2505 kg/m³ and 297.2902 kg/m³. Shell integrals are 8.2868×10²⁷ kg and 2.3794×10²⁷ kg. Exact ratios after the dust are −2.141×10⁻⁵, −2.158×10⁻⁵, −2.141×10⁻⁵, −3.670×10⁻⁵ and −1.357×10⁻⁴, −1.357×10⁻⁴, −1.889×10⁻⁴, −1.357×10⁻⁴. Type I count 13,456. Type IV count 0. Center shell densities 1.157367×10²¹ kg/m³ and 3.772404×10²⁰ kg/m³.

## Fine-grid centers and the slope ring, 2026-11-02

`data/dial_refine_close.txt` restores the N = 240 half wall inside r < 0.1784 m, four cells. After that restoration the exact ratios are −1.465×10⁻⁶, −1.482×10⁻⁶, −1.465×10⁻⁶, −2.182×10⁻⁶ with the shift off, and −1.447×10⁻⁶, −1.464×10⁻⁶, −1.447×10⁻⁶, −2.155×10⁻⁶ at 0.10c. Type I count 55,696. Type IV count 0. Serious fraction 0. Energies 8.3155×10²⁷ kg and 8.2879×10²⁷ kg. The window on the same xy grid with z spacing 0.45455 m reads, shift off, exact contraction −1.667×10⁻³ at 0.161 m and rest-frame slack −0.3122 at 12.962 m, place 117.7°, decMiss 48. At 0.04c the exact contraction is −2.304×10⁻², Type IV count 8, rest-frame slack −0.3539, decMiss 40, both worst cells at 12.962 m. Tail strong ratios −1.644×10⁻⁴ and −1.645×10⁻⁴. Energies 2.3817×10²⁷ kg and 2.3789×10²⁷ kg.

`data/dial_slope_ray.txt` repeats the shift-off window. The anchor sample is null 8.320×10⁻⁴, weak 1.797×10⁻³, dominant 0.3400, energy 2.3817×10²⁷ kg. Placed matter at 12.9667 m: density 1.261923×10²³ kg/m³, P/(ρc²) = 0.0195, margin 0.98045 of peak. Profile minimum margin −1.8315×10⁻⁶ at 25.2516 m. Worst Cartesian cell: density 3.723080×10²² kg/m³, placed density 1.192595×10²³ kg/m³, z stress 8.931030×10²² kg/m³, flux 0. The 48 cells under the bar run from 12.954 m to 12.981 m. Empty-ball restoration, four cells, moves the exact contraction to the tail: −1.160×10⁻⁴, −1.160×10⁻⁴, −1.644×10⁻⁴, rest-frame slack −0.3122. Type I count 55,696. decMiss 48. The N = 120 window remains the clean record.

## Flow tension, 2026-11-02

`data/dial_shoulder_pressure.txt` integrates the mix. π runs from 0 at 20 m to a minimum −0.9598. Stations: 9.78 m is −0.8120 against a hydrostatic +0.1932, and 15.70 m is −0.4726 against +0.0957. `data/dial_tension_lapse.txt` builds the lapse from P = π ρ c². Half wall, shift off: dominant 0.6174 at 16.417 m, serious 0.2108, energy 8.3144×10²⁷ kg. At 0.10c: dominant 1.137 at 10.230 m, serious 0.3239, energy 8.2924×10²⁷ kg. At 0.11c: dominant 1.188, side stations −1.160 and −0.651, serious 0.3343, energy 8.2878×10²⁷ kg. Window, shift off: dominant 0.4943 at 9.984 m, serious 0.4587, energy 2.3822×10²⁷ kg. At 0.04c: dominant 0.7893, serious 0.5360, energy 2.3796×10²⁷ kg. At 0.06c: dominant 0.9112, serious 0.5758, energy 2.3764×10²⁷ kg. All six rows fail. Center lapse on the half wall is g₀₀ = −0.5726.

## Shift square, 2026-11-02

`data/dial_adm_lapse.txt` adds γ^{xx} (S v)² to the hydrostatic g₀₀. Shift off, the half wall reproduces the stored clean line, energy 8.3144×10²⁷ kg, dominant 1.947×10⁻⁵, center g₀₀ = −0.3224. The window reproduces its stored clean line, energy 2.3822×10²⁷ kg, dominant 1.604×10⁻⁴. At 0.04c the window stays clean: exact ratios −1.357×10⁻⁴, −1.357×10⁻⁴, −1.889×10⁻⁴, −1.357×10⁻⁴, Type I 13,456, Type IV 0, energy 2.3794×10²⁷ kg. At 0.10c the half wall fails: dominant 0.05345 at 15.697 m, place 87.5°, serious 0.0009, energy 8.2867×10²⁷ kg. Exact contraction −8.911×10⁻³ at 15.683 m, place 89.2°, direction 179.1°, Type IV 16, Type I 13,440. Outer station 15.70 m: flux −0.5282, T^{xx}/peak 0.0748, margin −0.0044. Inner station 9.78 m: flux +0.4830, T^{xx}/peak 0.1672, margin +0.0888. At 0.11c: dominant 0.2286 at 15.683 m, place 90.8°, serious 0.0122, energy 8.2809×10²⁷ kg. Exact contraction −0.1189, Type IV 168, Type I 13,288. Inner station dominant +0.1755, T^{xx}/peak 0.1620, margin +0.0369. Outer station dominant −0.2286, T^{xx}/peak 0.0711, margin −0.0594. At 0.06c the window fails: dominant 0.2275 at 16.138 m, place 90.8°, serious 0.0696, energy 2.3758×10²⁷ kg. Exact contraction −0.2114 at 16.176 m, place 94.0°, direction 175.5°, Type IV 956, Type I 12,500. The tail cell at 23.917 m stays Type I, slack −1.359×10⁻⁴. The shift square is not adopted.

## Carrier face, 2026-11-03

`data/dial_lip_brace.txt` keeps the one-sixth window. The metric is unchanged. The unbraced samples match the stored lines: shift off, dominant 1.604×10⁻⁴, energy 2.3822×10²⁷ kg; 0.04c, dominant 1.605×10⁻⁴, energy 2.3794×10²⁷ kg; 0.06c, dominant 0.2223 at 16.138 m, serious 0.0758, energy 2.3758×10²⁷ kg. The face q_i q_j/ρ is added to the Eulerian spatial stress where the energy density exceeds 10⁻⁸ of peak. Exact observer, shift off: −1.356×10⁻⁴, −1.356×10⁻⁴, −1.888×10⁻⁴, −1.356×10⁻⁴, Type I 13,456, Type IV 0. At 0.04c: −1.357×10⁻⁴, −1.357×10⁻⁴, −1.889×10⁻⁴, −1.357×10⁻⁴, Type I 13,456, Type IV 0. At 0.06c: −1.359×10⁻⁴, −1.359×10⁻⁴, −1.891×10⁻⁴, −1.359×10⁻⁴, Type I 13,456, Type IV 0, serious 0. The worst cell is the tail at 23.917 m, place 3.8°, direction 90°, Type I. Faced longitudinal stress over peak at 0.06c is 0.1986 at 9.78 m, 0.0779 at 12 m, and 0.2699 at 16.14 m, where the rush is −0.3580 and the density is 0.4986 of peak. The curvature still produces the soft skin. The pass belongs to the faced matter.

## Side lapse, 2026-11-03

`data/dial_face_curv.txt` reads three side-weighted metric changes at 0.06c, step 10⁻³, on the same window. At 16.14 m, per unit step over peak: a g_xx strain moves density by +84.3 and longitudinal stress by −0.0025; the lapse moves density by +0.0021 and longitudinal stress by −169; a traceless strain moves density by +41.0 and longitudinal stress by +42.3. The nose lapse response in longitudinal stress is +5.67, with the density still.

`data/dial_face_lapse.txt` inverts bells of width 1.6 m at 8, 10, 12, 14, 15.5, 16.5, 17.5, and 19 m. Condition 22.5. Maximum |δa| is 5.853×10⁻³. At 16.14 m the longitudinal stress rises by 0.1909 of peak against a face of 0.2570. The density change is under 10⁻⁴ of peak. Shift off: energy 2.3822×10²⁷ kg, exact ratios −1.356×10⁻⁴, −1.356×10⁻⁴, −1.888×10⁻⁴, −1.356×10⁻⁴, Type I 13,456, Type IV 0. At 0.04c: energy 2.3794×10²⁷ kg, sample dominant 0.1049 at 18.974 m, serious 0.0742, exact contraction −0.08005, Type IV 188, Type I 13,268. Worst null at 19.029 m, place 97.5°, direction 172.6°. Tail contraction −0.01265. At 0.06c: energy 2.3758×10²⁷ kg, sample dominant 0.3692 at 6.141 m, serious 0.1819, exact contraction −0.2960, Type IV 704, Type I 12,752. Worst null at 18.974 m, place 96.2°, direction 173.9°. Tail contraction −0.08615.

`data/dial_face_lapse_ray.txt` uses the same width on the whole side, centers from 6 m to 23 m, and one residual pass. The residual step is 1.233×10⁻⁵. The miss stays 0.185 of peak. Maximum |δa| is 4.756×10⁻³. Shift off matches the stored clean line, exact −1.356×10⁻⁴, Type IV 0. At 0.04c: sample dominant 0.04632 at 2.963 m, place 94.4°, density 0.2324, longitudinal stress −0.0299, exact contraction −0.01715, Type IV 16, Type I 13,440. Tail −0.01219. At 0.06c: sample dominant 0.2725 at 3.870 m, place 86.6°, density 0.3146, flux 0.1510, longitudinal stress −0.2686, exact contraction −0.2563, Type IV 856, Type I 12,600, serious 0.3291. Tail −0.03691. Lip rise 0.1792 of peak against a face of 0.2570.

`data/dial_face_lapse_tight.txt` uses width 0.75 m, centers every meter from 3 m to 24 m. Condition 28.1. Linear miss 0.172 of peak. Maximum |δa| is 9.733×10⁻⁴. Lip rise 0.2032 against a face of 0.2570. Pulls, as a fraction of peak: −0.0938 at 14 m, −0.0918 at 18.97 m, −0.0560 at 21 m. The observers were not scored. The side lapse is not adopted.

## Level fan, 2026-11-03

`data/dial_level_fan.txt`. Same book. Thick-book shoulders at half the placed peak: 8.244 m and 16.520 m. Shift is 1 inside the inner shoulder and 0 outside the outer shoulder. Station slope of the new fan peaks at 0.216 per meter at 12.97 m. The old peak slope is 0.133 per meter. Shift off matches the stored clean line, exact −1.356×10⁻⁴, Type IV 0, energy 2.3822×10²⁷ kg. At 0.04c the exact contraction is −1.248, Type IV 1,136, Type I 12,320, worst null at 16.151 m, place 92.4°, direction 177.8°. Side flux at 16.14 m is −0.876 of peak. At 0.06c the exact contraction is −2.132, Type IV 1,880, Type I 11,576, worst null at 16.138 m, place 89.2°, direction 179.3°. Side flux at 16.14 m is −1.318 of peak against density 0.501. At 17.52 m the flux is 0. The tail at each speed is about −1.36×10⁻⁴. The level fan is not adopted.
