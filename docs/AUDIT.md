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

`data/dial_observers.txt` scores the half-compact wall at 0 and 0.10c and the one-sixth bend window at 0 and 0.04c. The sampled lines match the coast anchors above, including energy, the four ratios, the serious fraction, and the shift. The exact weak ratio on the parked half wall is −2.185×10⁻⁵, the same figure as the sampled weak ratio. The exact strong ratio on the 0.04c window is −1.889×10⁻⁴, the same figure as the sampled strong ratio. The rest-frame dominant slack is −3.716×10⁻⁵ on the parked half wall and −3.670×10⁻⁵ at 0.10c, both at 26.2 m on the back. On the window it is −1.356×10⁻⁴ at 0 and −1.357×10⁻⁴ at 0.04c, both at 23.9 m on the side. All 13,456 midplane cells are Type I. Serious fraction 0. The tail by itself carries those worst cells and stays under the bar. The check does not add a second frame. It minimizes over every direction in the Eulerian frame this port already builds.
