# Results

Scored in an Octave port of Warp Factory, upstream commit `03b10cb`. Date of the clean log: 2026-10-28. Pin AEB2AD.

The published positive-mass pass is 0.02c. This condensate shell is clean at 0.10c on the 166.8 m grid. The 83.4 m grid is clean at the same speed after cells inside the flat ball are restored to zero stress-energy. The 0.11c join fails in the outer wall. At the published 20 m outer radius the FSOT wall is also clean at 0.10c when the compactness is 1/2.

## Clean point

Grid spacing 166.790 m. Log `data/dial_mix.txt`.

| | 0.10c | 0.095c |
| --- | ---: | ---: |
| Null worst/peak | 6.534×10⁻⁴ | 6.459×10⁻⁴ |
| Weak | 7.887×10⁻⁴ | 7.856×10⁻⁴ |
| Strong | 6.558×10⁻⁴ | 6.488×10⁻⁴ |
| Dominant | 6.822×10⁻⁶ | 6.830×10⁻⁶ |
| Serious fraction | 0 | 0 |
| Energy | 4.0651×10³⁰ kg | 4.0664×10³⁰ kg |
| Shift | 0.100 | 0.095 |
| Verdict | CLEAN | CLEAN |

The 0.10c tight cell for the null, weak, and strong ratios is the cavity stencil at r = 117.94 m. The dominant ratio's worst cell is in the exterior at r = 12,993 m. On the printed side ray from 4.25 km to 8.92 km, every dominant ratio is 0. The shift at the center is 0.10c. `S(0) = 1` and `S(R2) = 0`.

## The edge at 0.11c

Same shell, same join, same grid. Log `data/dial_mix_11.txt`.

| | 0.11c |
| --- | ---: |
| Null, weak, and strong | 3.398×10⁻² at r = 7766.92 m |
| Dominant | 0.1746 at r = 7759.76 m |
| Serious fraction | 0.0119 |
| Energy | 4.0623×10³⁰ kg |
| Shift | 0.110 |
| Verdict | FAIL |

The break is in the outer wall, about 88° off the boost axis.

## Against the published Warp Factory pass

Fuchs, Helmerich, Bobrick, Sellers, Melcher, and Martire, Class. Quantum Grav. 41 (2024) 095013, arXiv:2405.02709. Their published positive-mass pass is a 10–20 m shell, mass 4.49×10²⁷ kg, compactness 1/3, shift 0.02c. This port reproduces that point as its W1 example.

| | Published pass | This shell |
| --- | ---: | ---: |
| Cavity / outer radius | 10 m / 20 m | 1,399.567 m / 9,811.159 m |
| Mass | 4.49×10²⁷ kg | 3.303043×10³⁰ kg |
| Unsmoothed density | 1.531×10²³ kg/m³ | 8.374×10¹⁷ kg/m³ |
| Clean speed | 0.02c | 0.10c |
| Radius ratio | 1 | 491 |
| Mass ratio | 1 | 736 |
| Density ratio | 1.83×10⁵ | 1 |
| Speed ratio | 1 | 5 |

A larger Fuchs-type shell in this same port, 50–110 m at compactness 1/3, fails at 0.10c with null ratio 1.11. The condensate 0.10c pass is the 9.81 km body. The 20 m scores below use the same join on a smaller radius, and the density rises with that shrink.

## At the published outer radius

Log `data/dial_fuchs_size.txt`. Outer radius 20 m. The FSOT wall has inner radius 2.85 m. Mass is compactness times R2·c²/(2G), with Warp Factory's c and G. The grid keeps the fraction used on the 110 m article, spacing 0.455 m.

| Compactness | Mass | Speed | Result |
| --- | ---: | ---: | --- |
| 1/3 | 4.489×10²⁷ kg | 0.06c | clean, dominant 1.70×10⁻⁵, energy 5.142×10²⁷ kg |
| 1/3 | 4.489×10²⁷ kg | 0.10c | fail, dominant 0.453 at 9.78 m |
| 1/2 | 6.733×10²⁷ kg | 0.10c | clean, null 1.07×10⁻⁵, weak 2.16×10⁻⁵, dominant 1.92×10⁻⁵, serious fraction 0, energy 8.287×10²⁷ kg, shift 0.10 |
| 1/2 | 6.733×10²⁷ kg | 0.11c | fail, dominant 0.177 at 15.70 m |

Compactness 1/3 is the published mass. The clean speed there is 0.06c. Compactness 1/2 is 1.5 times that mass, about 3.55 Jupiter masses, and it is clean at 0.10c. The wall volume is 3.34×10⁴ m³, so the density is 2.02×10²³ kg/m³, about 1.3 times the published density and about 2.4×10⁵ times the condensate. The 0.11c break is 0.785 of the radius, the same fraction as 7.72 km on the condensate body, and the dominant ratio is 0.177 on both.

## Lighter compactness, same wall

Logs `data/dial_mass_down.txt` and `data/dial_mass_down_16.txt`, dated 2026-10-29. Same mix, same builder lapse, same 20 m FSOT wall. The reference row is the compactness-1/2 shell above: mass 6.733×10²⁷ kg, density 2.015×10²³ kg/m³. Density falls in proportion to compactness. The smaller radius in the last column is that same compactness resized so the density matches the reference. It is not a second grid score. The ratios do not depend on the radius.

| Compactness | Mass at 20 m | Density / reference | 0.04c | 0.06c | Same density as the reference |
| --- | ---: | ---: | --- | --- | --- |
| 1/4 | 3.366×10²⁷ kg | 0.500 | clean, dominant 1.60×10⁻⁵, energy 3.737×10²⁷ kg | fail, dominant 0.224 at 15.72 m | 14.14 m, 2.380×10²⁷ kg |
| 1/5 | 2.693×10²⁷ kg | 0.400 | clean, dominant 1.54×10⁻⁵, energy 2.936×10²⁷ kg | fail, dominant 0.422 at 15.72 m | 12.65 m, 1.703×10²⁷ kg |
| 1/6 | 2.244×10²⁷ kg | 0.333 | fail, dominant 0.215 at 15.76 m | not scored | 11.55 m, 1.296×10²⁷ kg |

At compactness 1/5 and 0.04c the outer shoulder still has dominant margin +0.209 at 15.70 m, flux −0.465. At compactness 1/6 that shoulder is −0.209, flux −0.553, and the inner shoulder at 9.78 m is −0.131. One fifth is the light clean flat wall. The one-sixth mass is clean at 0.04c with the placement in the next sections. The 0.10c machine remains compactness 1/2. The 11.55 m resize on the failed flat row is the uniform density match. It is not a passing shell.

## One-sixth mass moved onto the slope

Same total mass, 2.244×10²⁷ kg, same mix, same outer radius. The flat wall fails where the shift slope is steep, so the mass was placed on that slope and returned to the same total. Peak density stays under the compactness-1/2 wall.

| Placement | Peak density / reference | 9.78 m | 15.70 m | Verdict |
| --- | ---: | ---: | ---: | --- |
| Flat wall | 0.333 | −0.131 | −0.209 | fail, dominant 0.215 at 15.76 m |
| Mass on the mix slope | 0.653 | +0.291 | +0.179 | fail, dominant 0.078 at 2.96 m |
| Wall plus the slope | 0.422 | +0.177 | −0.077 | fail, dominant 0.131 at 16.15 m |
| Larger of wall and slope | 0.504 | +0.149 | −0.143 | fail, dominant 0.197 at 16.15 m |

The slope placement clears both shoulders. At the inner edge the shift is still 0.995 and the density is 0.093 of peak, under a flux of 0.118. Putting wall density back under that edge, either by adding it to the slope or by taking the larger of the two profiles, reopens the outer shoulder before the edge reaches zero. Logs `data/dial_sixth_push.txt`, `data/dial_sixth_cover.txt`, and `data/dial_sixth_max.txt`.

## One-sixth mass across the bend window

Same total mass, 2.244×10²⁷ kg, same mix, same 20 m wall. Dated 2026-10-29.

The slope placement already carries a side notch at 16.5 m, dominant 0.031, 16 cells. The foot at 2.96 m is worse, 0.081, so the notch was not the reported cell. Joining the wall to the slope and smoothing afterward clears the foot and deepens the notch to 0.042. Log `data/dial_sixth_band.txt`.

Restoring the uniform wall only inside the crossing, and paying the excess from the negative-curvature side, clears the foot. The dominant ratio inside 8 m is 0. The notch remains at 16.67 m, dominant 0.028, the same absolute size as on the slope. Crossing 8.01 m, curvature flip 12.97 m, payment scale 0.952, peak density 0.649 of the half-compact wall. Log `data/dial_sixth_inner.txt`.

Holding the slope up to the straight chord from the steepest point, 12.97 m, out to the shell face clears the notch. At 16.5 m the dominant margin is +0.083. The steepest slope then fails, dominant 0.216 at 12.96 m, 38° off the boost. The chord at 19 m is 23 times the real slope, and the mass fraction outside 18 m rises from 0.071 to 0.146. Log `data/dial_sixth_chord.txt`.

The strongest bend is at 15.71 m. Curvature takes 2.74 m to climb from the steepest slope to that bend. The chord in the clean run covers only that same distance on the far side, out to 18.45 m, and the slope is followed again after that. The foot stays the wall. Payment scale 0.945. Peak density 1.264×10²³ kg/m³, 0.627 of the half-compact wall. Mass fractions: 0.056 inside 8 m, 0.322 from 8 m to 13 m, 0.538 from 13 m to 18 m, 0.084 outside 18 m.

| | Bend window |
| --- | ---: |
| Null | 6.79×10⁻⁵ at 23.92 m |
| Strong | 1.89×10⁻⁴ at 23.54 m |
| Dominant | 1.61×10⁻⁴ at 23.65 m |
| Serious fraction | 0 |
| Energy | 2.379×10²⁷ kg |
| Shift | 0.04 |
| Verdict | clean |

The side ray is positive through the wall: +0.055 at 2.85 m, +0.210 at 9.78 m, +0.454 at 12 m, +0.165 at 15.70 m, +0.071 at 17.52 m. At 16.5 m the side minimum is +0.042. Log `data/dial_sixth_bend.txt`.

At this fixed 20 m radius the shell is 1.182 Jupiter masses. The uniform one-fifth wall at the same radius is 1.419 Jupiter masses. The peak here is 0.627 of the half-compact density, above the uniform one-fifth density and under that ceiling. Resizing this shape so the peak equals the ceiling, same profile, gives an outer radius of 15.84 m and a mass of 1.777×10²⁷ kg, 0.936 Jupiter. That is a scale of the scored shell, not a second grid. The uniform one-fifth wall, resized so its own density equals the ceiling, remains 12.65 m and 0.897 Jupiter. The 0.10c shell remains compactness 1/2.

## Where that window stops

Same placement, dated 2026-10-30. Compactness 1/7 is mass 1.924×10²⁷ kg, 1.013 Jupiter, peak density 0.538 of the half-compact wall. The mass fractions match the one-sixth pass. The side from 16.0 m to 17.5 m is negative. Dominant 0.118 at 16.59 m, flux −0.249. The foot inside 8 m is negative again, worst 0.033. Log `data/dial_seventh_bend.txt`.

Drawing the chord to the shell face and applying it only inside the window raises the raw weight at 16.67 m from 1.26 to 1.75. The notch at 17.5 m comes back positive. The band at 16.5 m stays at −0.099. The worst cell moves to 8.84 m, dominant 0.122, and the side ray at 9.78 m is −0.070. Log `data/dial_seventh_clip.txt`.

The one-sixth window at 0.06c fails across the side. Dominant 0.222 at 16.14 m, null 0.102, serious fraction 0.076. The side ray is negative at 2.85 m, 9.78 m, and 15.70 m. The middle at 12 m stays at +0.376. Log `data/dial_sixth_bend_06.txt`.

Holding the max slope through the strongest bend, then falling to the slope at the window end, puts the lift on the notch and keeps the floor continuous at both ends. At compactness 1/7 the side band comes back positive. At 16.5 m the margin is +0.049. The mass from 13 m to 18 m rises from 0.538 to 0.571. The steep side falls from 0.322 to 0.256, and the steepest slope fails: dominant 0.335 at 12.96 m, 38° off the boost, flux +0.143. The side ray at 9.78 m is −0.149. The foot ray at 2.85 m is −0.024. Energy 2.017×10²⁷ kg. Log `data/dial_seventh_plateau.txt`.

The light clean shell remains the one-sixth bend window at 0.04c.

## That mass is the pull

Dated 2026-10-30. The clean one-sixth window is an external gravitational mass of 2.244×10²⁷ kg, 1.182 Jupiter, 376 Earths, rest energy 2.017×10⁴⁴ J. Inside about 58,000 km the tide across the Earth exceeds 1 g. In low orbit the whole Earth falls toward the shell at about 330 g. At the Moon the pull is 0.10 g and the tide across the Earth is about 30,000 times the lunar tide. The shell matches the Moon's pull on the Earth from 0.45 AU. Earth escape is 11.2 km/s and solar escape from Earth's orbit is 42.1 km/s. Those wells do not supply 0.04c. A new well deep enough for 0.04c is a gravitational mass again.

A 10 tonne ship at 0.04c has kinetic energy 7.20×10¹⁷ J, 8.0 kg of mass-energy. A photon rocket to that speed is mass ratio 1.041 and 408 kg of directed light, 3.67×10¹⁹ J, for the outbound burn alone. Accel and stop with exhaust at 0.04c is mass ratio 7.40, 64 tonnes of propellant, 4.60×10¹⁸ J. At 1 g the plant on that burn needs 4.3×10⁸ W/kg and does not lift itself.

Two perfect sails, momentum 2E/c, plant at home, 10 tonne ship:

| Beam | Peak speed | Trip | Energy, both legs |
| --- | ---: | ---: | ---: |
| 1 GW | 0.51 km/s | 422 h | 1.52×10¹⁵ J |
| 10 GW | 1.60 km/s | 133 h | 4.80×10¹⁵ J |
| 100 GW | 5.06 km/s | 42 h | 1.52×10¹⁶ J |
| 1 TW | 16.0 km/s | 13.3 h | 4.80×10¹⁶ J |
| 15 TW | 62 km/s | 3.44 h | 1.86×10¹⁷ J |

Reaching 0.04c on a sail is 1.80×10¹⁹ J. A 15 TW beam takes 14 days and 48 AU. At 1 µm a 100 m sail needs a 3.8 m aperture at the Moon and a 73 km aperture at 49 AU.

Heat: both faces radiate, absorbed intensity equals 2 ε σ T⁴, and the spot is kept the size of the sail. Film 10 g/m², absorption 0.001, emissivity 0.5, 600 K, intensity 7.35×10⁶ W/m². A 10 tonne sheet is 1.13 km across. Plus 10 tonnes of ship: 0.25 g on 7.35 TW, peak 30.7 km/s, 7.0 hours, lunar aperture 0.34 m. Both beams deliver 1.84×10¹⁷ J. Station hardware at 100 W/kg is 7.3×10⁷ tonnes; at 10 W/kg it is 7.3×10⁸ tonnes, on the ground. The same film at 1200 K is 4 g, 1.18×10¹⁴ W, peak 123 km/s, 1.7 hours. One g at 600 K on this loading, with the same 2E/c, would need absorption 2.50×10⁻⁴. That is a material target, not a measured sail. This section is not an energy-condition score. The Eulerian light shell remains the one-sixth bend window at 0.04c.

## Audit of the 20 m shell

Log `data/dial_audit_bar.txt`, dated 2026-10-29. Same mix, same N = 120 grid. A fresh 0.10c run at compactness 1/2 reproduces the line above: energy 8.2868×10²⁷ kg, dominant ratio 1.92×10⁻⁵ in the exterior at 26.47 m, shift 0.10, clean. With the shift off, compactness 1/2 is clean at energy 8.3144×10²⁷ kg, dominant 1.95×10⁻⁵, and compactness 1/3 is clean at energy 5.1495×10²⁷ kg, dominant 1.71×10⁻⁵. Both parked violations sit at 26.47 m. The smoothed density on this grid ends at 26.57 m. The check is written out in [AUDIT.md](AUDIT.md).

## What is left of the cabin

Log `data/dial_cabin_vacuum.txt`. Same mass smooth as the metric builder: four passes, span 7,160 samples, 3.29 m on this grid. The shift smooth is two passes of 1.84 m. No energy-condition score.

| Shell | Density first exceeds 0 | Density reaches 1% of the wall | Shift falls below 0.9999 | At the unsmoothed inner radius |
| --- | ---: | ---: | ---: | --- |
| FSOT wall, inner radius 2.85 m | 0.18 m | 0.42 m | 1.52 m, density already 21% | density 49% of the wall, shift 0.994 |
| Their cabin, inner radius 10 m | 3.43 m | 5.72 m | 8.47 m, density already 22% | density 50% of the wall, shift 0.978 |

On their cabin at 9.78 m the density is 46% of the wall and the shift is 0.985. That is the fringe whose dominant margin is +0.012 at the clean 0.04c point and −0.19 at 0.06c. The thick wall passes at 0.10c with half the wall density already on while the shift is still 0.994. The empty center does not grow unless the whole shell grows, and the mass grows with the radius.

## Their cabin

Log `data/dial_cabin_gap.txt`. Their empty cabin is half the outer radius. At compactness 1/3 that geometry fails at 0.04c. At compactness 1/2, R1 = 10 m, R2 = 20 m, mass 6.733×10²⁷ kg, the same mix is clean at 0.04c: null 1.11×10⁻⁵, weak 2.23×10⁻⁵, dominant 1.97×10⁻⁵, serious fraction 0, energy 8.160×10²⁷ kg, shift 0.04. At 0.06c it fails in the outer wall, dominant ratio 0.352 at 17.51 m, flux −0.608, radial stress 0.033. At 0.10c that cell is dominant 0.678.

The legacy cabin, R1 = 50 m at R2 = 110 m, is clean at 0.04c and fails at 0.06c, dominant ratio 0.248 at 94.8 m. Their cabin holds twice the published speed at this compactness. The 0.10c cabin on a 20 m ship remains the FSOT wall.

The condensate mass is about 1.66 solar masses, about 1,740 Jupiter masses. Fuchs's published mass is about 2.37 Jupiter masses. The 20 m compactness-1/2 mass is about 3.55 Jupiter masses. Each figure is the positive mass of that shell in the metric. Each run is a scored coast in the solver.

At 0.10c a coast from Earth to the Moon is about 13 seconds, and a coast to a close Mars is about half an hour. The metric is already at constant speed. It does not model the acceleration.

## Resolution stress

The profile is sampled at about 0.225 m and smoothed over about 450 m. Changing `N` changes the metric grid, not that profile. Log `data/dial_mix_fine.txt`, `N = 320`, spacing 83.395 m, same 0.10c mix. Runtime 200.5 s.

| | 83.4 m |
| --- | ---: |
| Null | 7.016×10⁻⁴ at r = 58.97 m, cavity |
| Weak | 1.476×10⁻³ at r = 58.97 m, cavity |
| Strong | 7.016×10⁻⁴ at the same cell |
| Dominant | 5.506×10⁻⁷ at r = 13,017 m, exterior |
| Serious fraction | 0.0000 |
| Energy | 4.0657×10³⁰ kg |
| Shift | 0.100 |
| Verdict | FAIL |

The weak ratio is the central cavity sample. The side ray from 4.21 km to 8.97 km still prints dominant ratio 0. The 166.8 m pass is the clean record. The 83.4 m grid does not meet the same bar. The two grids are drawn in `figures/resolution.png`.

## Origin samples

Log `data/dial_center.txt`. Same mix. The shift amplitude is 0 or 0.10. The only negative cavity cells are four diagonal samples at `r = h / √2`, 45° off the boost axis. `n` is the cell count in the bin. The weak column is the minimum weak ratio in that bin.

| Grid | Shift | Origin cells | Origin weak ratio | Next ring weak ratio | Wall weak ratio |
| --- | --- | ---: | ---: | ---: | ---: |
| 166.8 m | off | 4 | −7.515×10⁻⁴ | +1.309×10⁻² | +0.249 |
| 166.8 m | 0.10c | 4 | −7.887×10⁻⁴ | +9.651×10⁻³ | +0.0168 |
| 83.4 m | off | 4 | −1.481×10⁻³ | +4.047×10⁻⁴ | +0.249 |
| 83.4 m | 0.10c | 4 | −1.476×10⁻³ | +3.339×10⁻⁴ | +0.0155 |

Peak energy density is 7.526×10³⁴ J/m³ with the shift off and 7.621×10³⁴ J/m³ at 0.10c. With the shift off, the origin weak ratio equals the energy-density ratio, and that ratio times the sample radius is 0.0886 m at 118 m and 0.0873 m at 59 m. The campaign bar on the 83.4 m grid fails on those four samples in both shift settings. The figure is `figures/center.png`.

The mass smoother leaves an exterior skirt. Its worst weak ratio is −7.94×10⁻⁶ at 166.8 m and −4.06×10⁻⁷ at 83.4 m. Both sit far under the clean bar, and the fine grid makes the skirt smaller.

## Flat ball restored

Log `data/dial_flatball.txt`. The flat ball is r < 87.55 m. Cells inside it are set to stress-energy zero. Cells outside keep the Cartesian difference.

| Grid | Shift | Cells restored | Weak ratio after | Where the worst cell sits | Verdict |
| --- | --- | ---: | ---: | --- | --- |
| 166.8 m | off | 0 | 7.515×10⁻⁴ | r = 118 m, the raw center sample | CLEAN |
| 166.8 m | 0.10c | 0 | 7.887×10⁻⁴ | r = 118 m, the raw center sample | CLEAN |
| 83.4 m | off | 4 | 4.057×10⁻⁷ | r = 12,979 m, exterior skirt | CLEAN |
| 83.4 m | 0.10c | 4 | 4.006×10⁻⁷ | r = 12,979 m, exterior skirt | CLEAN |

The corrected 0.10c line on the 83.4 m grid is null 1.971×10⁻⁷, weak 4.006×10⁻⁷, strong 1.971×10⁻⁷, dominant 5.506×10⁻⁷, serious fraction 0, energy 4.0657×10³⁰ kg, shift 0.10. The dominant ratio is the same cell the raw score already reported in the exterior. The figure is `figures/flatball.png`.

The same restoration at 0.11c on the 166.8 m grid finds no cell inside the ball. The failure stays at r = 7,766.92 m, dominant ratio 0.1746, serious fraction 0.0119, energy 4.0623×10³⁰ kg. Log `data/dial_flatball_11.txt`.

On the 83.4 m grid the same 0.11c join restores the four flat-ball cells and still fails. Dominant ratio 0.177 at r = 7,719.54 m, null ratio 3.549×10⁻² at r = 7,727.65 m, serious fraction 0.0111, energy 4.0628×10³⁰ kg, shift 0.11. Log `data/dial_flatball_11_fine.txt`. The wall break is stable under the finer grid.

## Coasts on the two clean shapes

Dated 2026-11-02. Log `data/dial_coast_stack.txt`. Same N = 120 grid, spacing 0.455 m. The shapes are the stored ones. The half-compact wall keeps the mix. The one-sixth window keeps the bend-window placement: mass 2.244×10²⁷ kg, peak density 0.627 of the half-compact wall, slope at 12.967 m, strongest bend at 15.711 m, window end at 18.454 m. Only the shift amplitude changes. Every line has serious fraction 0 and shift equal to the requested speed.

| Shape | Speed | Energy | Null | Weak | Strong | Dominant |
| --- | ---: | ---: | ---: | ---: | ---: | ---: |
| Half wall | 0 | 8.3144×10²⁷ kg | 1.081×10⁻⁵ | 2.185×10⁻⁵ | 1.081×10⁻⁵ | 1.947×10⁻⁵ |
| Half wall | 0.02c | 8.3133×10²⁷ kg | 1.080×10⁻⁵ | 2.184×10⁻⁵ | 1.080×10⁻⁵ | 1.946×10⁻⁵ |
| Half wall | 0.04c | 8.3100×10²⁷ kg | 1.079×10⁻⁵ | 2.181×10⁻⁵ | 1.079×10⁻⁵ | 1.943×10⁻⁵ |
| Half wall | 0.06c | 8.3045×10²⁷ kg | 1.076×10⁻⁵ | 2.176×10⁻⁵ | 1.076×10⁻⁵ | 1.938×10⁻⁵ |
| Half wall | 0.08c | 8.2967×10²⁷ kg | 1.072×10⁻⁵ | 2.168×10⁻⁵ | 1.072×10⁻⁵ | 1.931×10⁻⁵ |
| Half wall | 0.10c | 8.2868×10²⁷ kg | 1.067×10⁻⁵ | 2.158×10⁻⁵ | 1.067×10⁻⁵ | 1.923×10⁻⁵ |
| Bend window | 0 | 2.3822×10²⁷ kg | 6.780×10⁻⁵ | 6.780×10⁻⁵ | 1.888×10⁻⁴ | 1.604×10⁻⁴ |
| Bend window | 0.02c | 2.3815×10²⁷ kg | 6.782×10⁻⁵ | 6.782×10⁻⁵ | 1.888×10⁻⁴ | 1.604×10⁻⁴ |
| Bend window | 0.04c | 2.3794×10²⁷ kg | 6.785×10⁻⁵ | 6.785×10⁻⁵ | 1.889×10⁻⁴ | 1.605×10⁻⁴ |

All nine lines are clean. The half-wall endpoints match `data/dial_audit_bar.txt`. The 0.04c window matches `data/dial_sixth_bend.txt`. The speeds between those anchors do not cross the bar. This is not a new boundary. 0.11c on the half wall and 0.06c on the light window stay the stored failures.

## The ship and the beam

Dated 2026-11-02. Log `data/dial_ship_beam.txt`. Minkowski grid, hand-built contravariant stress-energy, the same energy-condition function, 48 angular samples and 8 time samples. The tensors are order 1. They are not kilogram densities, and this is not an Einstein-equation shell. On a uniform tensor the map's minimum and maximum are the same number, because the function stores the worst observer at each point.

| Case | Null, weak, strong | Dominant | Floor |
| --- | ---: | ---: | ---: |
| Dust | 0.5000000 | 0.7071068 | 0 |
| Forward null flux | 1.025620×10⁻⁴ | −0.0 | 0 |
| Dust plus that flux | 0.5001026 | 0.7171626 | 0 |

All three are clean against a floor of −1×10⁻⁶. The null flux is marginal in the forward direction. The angular grid never sits on the exact forward ray, and 1.03×10⁻⁴ is that gap. Dominant −0.0 is the margin. A 10 tonne ship plus a beam is ordinary matter plus a null flux on flat space. It does not replace the shell score.

## The film held to 0.04c

The 0.25 g film already in the ledger, 20 tonnes, acceleration 2.45 m/s², reaches 0.04c in 56.6 days and covers 196 AU on that one leg. Accel and stop is two legs: about 113 days and 392 AU. The round-trip beam energy is 7.19×10¹⁹ J, which is 20000 × (c/25) × c. Lean places the one-leg time between 56.5 and 56.7 days, the one-leg distance between 195.5 and 196.5 AU, and that energy between 7.185×10¹⁹ J and 7.195×10¹⁹ J, and it checks that two legs are twice one leg. The lunar trip is the same acceleration on the short range. This is kinematics. It is not a Warp Factory flight. The Eulerian light shell remains the one-sixth bend window at 0.04c. The 0.10c shell remains compactness 1/2.

## Every observer

Dated 2026-11-02. Log `data/dial_observers.txt`. Same two shapes, same N = 120 grid. The sampled lines reproduce the coast anchors: half-wall energy 8.3144×10²⁷ kg with the shift off and 8.2868×10²⁷ kg at 0.10c, window energy 2.3822×10²⁷ kg with the shift off and 2.3794×10²⁷ kg at 0.04c. The exact columns are signed ratios of the minimum contraction to the peak Eulerian density. A negative number is the depth of the dip. The dominant column is the rest-frame slack ρ − |p|.

| Shape | Speed | Exact null | Exact weak | Exact strong | Rest-frame dominant | Worst cell |
| --- | ---: | ---: | ---: | ---: | ---: | --- |
| Half wall | 0 | −2.17×10⁻⁵ | −2.19×10⁻⁵ | −2.17×10⁻⁵ | −3.72×10⁻⁵ | tail, 26.2 m, direction 180° |
| Half wall | 0.10c | −2.14×10⁻⁵ | −2.16×10⁻⁵ | −2.14×10⁻⁵ | −3.67×10⁻⁵ | tail, 26.2 m, direction 180° |
| Bend window | 0 | −1.36×10⁻⁴ | −1.36×10⁻⁴ | −1.89×10⁻⁴ | −1.36×10⁻⁴ | tail, 23.9 m, direction 90° |
| Bend window | 0.04c | −1.36×10⁻⁴ | −1.36×10⁻⁴ | −1.89×10⁻⁴ | −1.36×10⁻⁴ | tail, 23.9 m, direction 90° |

All four are clean on the campaign bar. Serious fraction 0. All 13,456 midplane cells are Type I, so each has a rest frame. No cell passes the exact weak bar and fails the rest-frame dominant bar. The tail, r > 20 m, holds the worst cell in every row, and the tail by itself is clean at those same ratios. The exact weak ratio on the half wall equals the sampled weak ratio. The exact strong ratio on the window equals the sampled strong ratio. The extra directions deepen the null ratio by about a factor of two and leave it under the bar. Turning the shift on does not move the cell. The angle in the table is the direction of the worst contraction: 0 looks toward the nose, 90 looks to the side, 180 looks backward. Where the cell sits is in the passenger log, on this same grid. At 0.10c the half-wall null cell is at 26.216 m and 4.5° off the nose, and the rest-frame cell is at 26.161 m and 87.5° off the nose. On the window the null cell is at 23.917 m and 3.8° off the nose, and the strong cell is at 23.542 m and 96.1° off the nose.

## The parked failures

Dated 2026-11-02. Log `data/dial_observers_parked.txt`. Same builders, same N = 120 grid. The speeds are the stored failures, 0.11c on the half wall and 0.06c on the one-sixth window. The sampled cells match the stored lines: dominant ratio 0.177 at 15.697 m on the half wall, and dominant ratio 0.222 at 16.138 m on the window.

| Shape | Speed | Sample dominant | Exact contraction | Cell | Place | Rest frame | Type IV cells |
| --- | ---: | ---: | ---: | ---: | ---: | --- | ---: |
| Half wall | 0.11c | 0.177 at 15.697 m | −7.523×10⁻² | 15.683 m | 89.2° | none | 184 |
| Bend window | 0.06c | 0.222 at 16.138 m | −0.2051 | 16.215 m | 84.4° | none | 1,028 |

Both are failures. Serious fraction 0.0134 on the half wall and 0.0764 on the window. No Type II cell. The rest-frame slack that does exist is the smoothing tail, −3.660×10⁻⁵ on the half wall and −1.359×10⁻⁴ on the window, and that tail passes. The break is the outer wall, on the side, in cells that have no rest frame.

## Half the spacing

Dated 2026-11-02. Log `data/dial_observers_fine.txt`. Same two clean shapes. smoothFactor stays 4000. Spacing is half, h = 0.227 m, N = 240, and the five z layers stay. The shell integrals stay on the stored masses: 8.3155×10²⁷ kg and 8.2879×10²⁷ kg on the half wall, 2.3817×10²⁷ kg and 2.3789×10²⁷ kg on the window.

| Shape | Speed | N = 120 tail | N = 240 tail | Tail verdict |
| --- | ---: | ---: | ---: | --- |
| Half wall | 0 | weak −2.185×10⁻⁵, dominant −3.716×10⁻⁵ | weak −1.482×10⁻⁶, dominant −2.182×10⁻⁶ | fell about 15 times |
| Half wall | 0.10c | weak −2.158×10⁻⁵, dominant −3.670×10⁻⁵ | weak −1.464×10⁻⁶, dominant −2.155×10⁻⁶ | fell about 15 times |
| Bend window | 0 | null −1.356×10⁻⁴, strong −1.888×10⁻⁴ | null −1.160×10⁻⁴, strong −1.644×10⁻⁴ | moved about 15 percent |
| Bend window | 0.04c | null −1.357×10⁻⁴, strong −1.889×10⁻⁴ | null −1.160×10⁻⁴, strong −1.645×10⁻⁴ | moved about 15 percent |

Every one of those tails passes, and every tail cell has a rest frame. The half-wall drop is the fourth-order stencil. The window tail holds, so that one is the join. The finer grid's worst cell is not the tail. On the half wall it is the diagonal sample at 0.161 m, weak ratio −2.493×10⁻³ with the shift off and −2.602×10⁻³ at 0.10c, Type I, serious fraction 0.0001. On the window it is the steepest slope at 12.962 m: rest-frame dominant −0.3060 with the shift off, and −0.3469 at 0.04c. At 0.04c eight cells there have no rest frame, and the exact contraction on that cell is −1.616×10⁻². The N = 120 clean lines stay the record. This spacing was not fed back into the shape.

## Ten tonnes in the cavity

Dated 2026-11-02. Log `data/dial_passenger.txt`. The metric is the clean half wall at 0.10c and the clean window at 0.04c. Dust at rest in the ship is added to the coordinate stress-energy after the metric is built, and the frame transfer moves the sum. The 2 m ball is the part the slab contains. The midplane ring integral of the dust is scaled to 10,000 kg.

| Shape | Shell integral | Recovered dust | Dust density | Exact ratios after the dust |
| --- | ---: | ---: | ---: | --- |
| Half wall, 0.10c | 8.2868×10²⁷ kg | 10,000.000 kg | 297.2505 kg/m³ | −2.141×10⁻⁵, −2.158×10⁻⁵, −2.141×10⁻⁵, −3.670×10⁻⁵ |
| Bend window, 0.04c | 2.3794×10²⁷ kg | 10,000.000 kg | 297.2902 kg/m³ | −1.357×10⁻⁴, −1.357×10⁻⁴, −1.889×10⁻⁴, −1.357×10⁻⁴ |

Both stay clean. All 13,456 midplane cells stay Type I. The tail cells stay the cells in the clean observer log. The dust is 1.457×10⁻²¹ of the half-wall peak and 2.049×10⁻²¹ of the window peak. At the center the shell smoother already reads 1.157×10²¹ kg/m³ on the half wall and 3.772×10²⁰ kg/m³ on the window, so the sum prints those same digits. The passenger leaves the tail where it was and opens no new violation. The shell mass is the shell integral above.

## The fine-grid centers and the slope ring

Dated 2026-11-02. Logs `data/dial_refine_close.txt` and `data/dial_slope_ray.txt`. Same shapes. smoothFactor stays 4000.

On the half wall at N = 240 the builder density is zero for r < 0.1784 m. Four midplane cells sit there, at 0.161 m. Setting them back to zero leaves the exterior tail as the worst cell. All 55,696 midplane cells are Type I. Serious fraction 0.

| Shape | Speed | Exact ratios after the restoration | Energy |
| --- | ---: | --- | ---: |
| Half wall | 0 | −1.465×10⁻⁶, −1.482×10⁻⁶, −1.465×10⁻⁶, −2.182×10⁻⁶ | 8.3155×10²⁷ kg |
| Half wall | 0.10c | −1.447×10⁻⁶, −1.464×10⁻⁶, −1.447×10⁻⁶, −2.155×10⁻⁶ | 8.2879×10²⁷ kg |

Those ratios are the fine-grid tail. The half wall at this spacing is clean.

The window keeps the half xy spacing and uses z spacing 0.45455 m. World size 38.4195 m. The bend stations print rSlope = 12.967 m, rCurv = 15.710 m, rEnd = 18.453 m, payment 0.9449.

| Speed | Sample dominant | Exact rest-frame slack | Exact contraction | Type IV | Tail |
| ---: | --- | --- | --- | ---: | --- |
| 0 | 0.340 at 12.962 m, place 117.7° | −0.3122, decMiss 48 | −1.667×10⁻³ at 0.161 m | 0 | clean, strong −1.644×10⁻⁴ |
| 0.04c | 0.357 at 12.962 m, place 152.3° | −0.3539, decMiss 40 | −2.304×10⁻², Type IV | 8 | clean, strong −1.645×10⁻⁴ |

Energies 2.3817×10²⁷ kg and 2.3789×10²⁷ kg. On the thinner z slab the rest-frame figures at this station were −0.3060 and −0.3469.

`data/dial_slope_ray.txt` is the shift-off window set against the placed matter. The anchor sample matches the row above. At 12.967 m the placed density is 1.261923×10²³ kg/m³, P/(ρc²) = 0.0195, and (ρ − |P|/c²)/ρ_peak = 0.98045. The minimum of that margin on the radial profile is −1.8315×10⁻⁶ at 25.2516 m. Placed density is first nonzero at 0.1784 m. Along the grid axis, from 12.160 m to 13.978 m, the Cartesian density tracks the placed density and the dominant ratio runs from +0.497 to +0.530. The 48 cells under the dominant bar lie from 12.954 m to 12.981 m, and none of them is inside the empty ball. On the worst cell, place 117.7°, the Cartesian density is 3.723080×10²² kg/m³, the placed density is 1.192595×10²³ kg/m³, and the z stress is 8.931030×10²² kg/m³. The flux component is zero. The ring within 0.25 m of the slope has 788 cells, median dominant ratio +0.543, minimum −0.340.

The four center cells read a Cartesian density down to −2.9975×10²⁰ kg/m³, and the placed density there is zero. Setting them back to zero moves null and weak to −5.798×10⁻⁵ at 23.947 m and strong to −1.644×10⁻⁴ at 23.556 m. The exact ratios become −1.160×10⁻⁴, −1.160×10⁻⁴, −1.644×10⁻⁴, and −0.3122. Type I count 55,696. Type IV count 0. decMiss stays 48. The rest-frame cell stays at 12.962 m, place 117.7°, direction 180°. The N = 120 window remains the clean record. The slope cells stay on the Cartesian difference.

## The flow's tension

Dated 2026-11-02. Logs `data/dial_shoulder_pressure.txt` and `data/dial_tension_lapse.txt`. Same mix. Ship speed is not in the pressure. The balance is μ d²S/dx² − S dS/dx = dπ/dx on x = r/R2, with μ = 0.332824, π(R2) = 0.

| r | S | π flow | π hydrostatic |
| ---: | ---: | ---: | ---: |
| 2.85 m | 0.9945 | −0.5573 | +0.2468 |
| 9.78 m | 0.7382 | −0.8120 | +0.1932 |
| 12.99 m | 0.3787 | −0.9445 | +0.1449 |
| 15.70 m | 0.0801 | −0.4726 | +0.0957 |
| 17.52 m | 0.0084 | −0.0956 | +0.0649 |

The flow fraction bottoms at −0.9598. The lapse is built with P = π ρ c². The mass and the mix shift stay.

| Shape | Speed | Dominant ratio | Worst cell | Serious fraction | Energy |
| --- | ---: | ---: | --- | ---: | ---: |
| Half wall | 0 | 0.617 | 16.417 m, 68.1° | 0.2108 | 8.3144×10²⁷ kg |
| Half wall | 0.10c | 1.137 | 10.230 m, 91.3° | 0.3239 | 8.2924×10²⁷ kg |
| Half wall | 0.11c | 1.188 | 10.230 m, 91.3° | 0.3343 | 8.2878×10²⁷ kg |
| Bend window | 0 | 0.494 | 9.984 m, 48.7° | 0.4587 | 2.3822×10²⁷ kg |
| Bend window | 0.04c | 0.789 | 10.230 m, 91.3° | 0.5360 | 2.3796×10²⁷ kg |
| Bend window | 0.06c | 0.911 | 10.230 m, 91.3° | 0.5758 | 2.3764×10²⁷ kg |

Every row fails. With the shift off, the side of the half wall reads −0.453 at 9.78 m and −0.473 at 15.70 m. At 0.11c those stations read −1.160 and −0.651. The hydrostatic lapse at these same speeds is the stored record: the half wall is clean through 0.10c, and the window is clean through 0.04c. The tension opens the break on its own.

## The shift square

Dated 2026-11-02. Log `data/dial_adm_lapse.txt`. Same hydrostatic lapse, same mix. The time-time component gains γ^{xx} (S v)². Ship speed stays the shift amplitude.

| Shape | Speed | Sample dominant | Exact contraction | Type IV | Energy |
| --- | ---: | --- | --- | ---: | ---: |
| Half wall | 0 | 1.947×10⁻⁵ at 26.467 m | stored clean line | 0 | 8.3144×10²⁷ kg |
| Half wall | 0.10c | 0.0535 at 15.697 m, 87.5° | −8.911×10⁻³, 16 cells | 16 | 8.2867×10²⁷ kg |
| Half wall | 0.11c | 0.2286 at 15.683 m, 90.8° | −0.1189, 168 cells | 168 | 8.2809×10²⁷ kg |
| Bend window | 0 | 1.604×10⁻⁴ at 23.647 m | stored clean line | 0 | 2.3822×10²⁷ kg |
| Bend window | 0.04c | 1.605×10⁻⁴ at 23.647 m | −1.357×10⁻⁴, Type I 13,456 | 0 | 2.3794×10²⁷ kg |
| Bend window | 0.06c | 0.2275 at 16.138 m, 90.8° | −0.2114, 956 cells | 956 | 2.3758×10²⁷ kg |

The 0.04c exact ratios are −1.357×10⁻⁴, −1.357×10⁻⁴, −1.889×10⁻⁴, and −1.357×10⁻⁴. At 0.10c the outer side station is flux −0.5282, longitudinal stress 0.0748 of peak, margin −0.0044. The inner station is flux +0.4830, longitudinal stress 0.1672, margin +0.0888. At 0.11c those stations are margin +0.0369 at 9.78 m and −0.0594 at 15.70 m, with longitudinal stress 0.1620 and 0.0711. The 0.06c tail stays Type I at 23.917 m, slack −1.359×10⁻⁴. The shift square moves stress onto the inner shoulder and off the outer shoulder. The 0.10c pass belongs to the hydrostatic time-time component without that square.

## The carrier face

Dated 2026-11-03. Log `data/dial_lip_brace.txt`. Same one-sixth window. The metric is unchanged. The Eulerian spatial stress gains q_i q_j/ρ where the energy density is above 10⁻⁸ of peak. Sample rows are the unbraced rebuild. Exact rows score the face.

| Speed | Unbraced sample | Exact, with the face | Type IV | Energy |
| --- | --- | --- | ---: | ---: |
| 0 | 1.604×10⁻⁴ at 23.647 m, clean | −1.356×10⁻⁴, −1.356×10⁻⁴, −1.888×10⁻⁴, −1.356×10⁻⁴ | 0 | 2.3822×10²⁷ kg |
| 0.04c | 1.605×10⁻⁴ at 23.647 m, clean | −1.357×10⁻⁴, −1.357×10⁻⁴, −1.889×10⁻⁴, −1.357×10⁻⁴ | 0 | 2.3794×10²⁷ kg |
| 0.06c | 0.2223 at 16.138 m, serious 0.0758 | −1.359×10⁻⁴, −1.359×10⁻⁴, −1.891×10⁻⁴, −1.359×10⁻⁴ | 0 | 2.3758×10²⁷ kg |

All 13,456 midplane cells are Type I on each exact row. The 0.06c worst cell is the tail at 23.917 m, place 3.8°, direction 90°, Type I. Side stations at 0.06c, faced longitudinal stress over peak: 0.1986 at 9.78 m, 0.0779 at 12 m, 0.2699 at 16.14 m, 0.1246 at 17.52 m. The rush at 16.14 m is −0.3580 and the density is 0.4986 of peak. With the shift off the face is zero. The curvature of this metric still produces the soft skin. The pass belongs to the faced matter.

## The side lapse

Dated 2026-11-03. Logs `data/dial_face_lapse.txt`, `data/dial_face_lapse_ray.txt`, and `data/dial_face_lapse_tight.txt`. Same window, same mix, same mass. The hydrostatic time-time component is multiplied by exp(2 δa), with δa side-weighted and scaled by (v/0.06)². The radial profile is the least-squares inverse of the lapse response against the carrier face.

The knob check in `data/dial_face_curv.txt` separates the handles. At 16.14 m, per unit step over peak, a g_xx strain moves density by +84 and longitudinal stress by −0.0025. A traceless strain moves density by +41 and longitudinal stress by +42. The lapse moves density by +0.002 and longitudinal stress by −169. Shallowing the side clock raises that stress. The nose stays on the hydrostatic lapse.

| Pass | What was solved | Lip rise / face 0.257 | max \|δa\| | 0.04c exact | 0.06c exact |
| --- | --- | ---: | ---: | --- | --- |
| Bells 1.6 m, 8–19 m | side stations 9–18 m | 0.191 | 5.85×10⁻³ | −0.0801, Type IV 188 | −0.296, Type IV 704 |
| Bells 1.6 m, whole side | one residual pass, step 1.2×10⁻⁵ | 0.179 | 4.76×10⁻³ | −0.0172, Type IV 16 | −0.256, Type IV 856 |
| Bells 0.75 m, every 1 m | linear miss 0.172, not scored | 0.203 | 9.73×10⁻⁴ | — | — |

Shift off, both scored passes sit on the stored clean line: energy 2.3822×10²⁷ kg, exact ratios −1.356×10⁻⁴, Type I 13,456, Type IV 0. The density along the side stays within 10⁻⁴ of the unbraced ray. On the whole-side pass the 0.06c sample cell is at 3.870 m, place 86.6°, longitudinal stress −0.269 of peak, against a local face of 0.072. The tight pass pulls −0.094 of peak at 14 m and −0.092 at 18.97 m. A bend in the side clock raises the squeeze at one radius and lowers it at the next. The face is a squeeze at every radius where the rush is strong. The side lapse is not adopted.

## The level fan

Dated 2026-11-03. Log `data/dial_level_fan.txt`. Same one-sixth book, same mass, same hydrostatic lapse. The shift stays 1 until the inner half-peak shoulder at 8.244 m and is 0 from the outer half-peak shoulder at 16.520 m outward. The thin edge is level: at 17.52 m the shift is 0 and the flux is 0.

| Speed | Sample dominant | Exact contraction | Type IV | Energy |
| --- | --- | --- | ---: | ---: |
| 0 | 1.604×10⁻⁴ at 23.647 m, clean | −1.356×10⁻⁴, Type I 13,456 | 0 | 2.3822×10²⁷ kg |
| 0.04c | 0.6174 at 16.138 m | −1.248, 1,136 cells | 1,136 | 2.3764×10²⁷ kg |
| 0.06c | 0.9317 at 16.138 m | −2.132, 1,880 cells | 1,880 | 2.3691×10²⁷ kg |

The tail stays on the stored line, about −1.36×10⁻⁴. At 0.06c the side flux over peak is −1.318 at 16.14 m, where the density is 0.501 of peak and the shift has already fallen to 0.009. The old shift there was 0.053 and the flux was −0.358. Closing the leftover step gathers the slide onto the shoulder. The 0.04c shell, which held with the old shift, fails there. The level fan is not adopted.

## The eased recovery

Dated 2026-11-03. Log `data/dial_ease_fan.txt`. Same one-sixth book, same mass, same hydrostatic lapse. Inside the slope crest at 12.967 m the shift is the mix. From the crest to the window end at 18.454 m the slope is the straight chord of |dS| the mass weight already uses, from 0.1327 per meter to 0.00306 per meter. The recovery is constant at 2.362×10⁻² per square meter. The old peak recovery is 3.824×10⁻² per square meter at 15.711 m. The shift arrives at 0.0117 at the window end. The old shift there is 0.0012.

| Speed | Sample dominant | Exact contraction | Type IV | Energy |
| --- | --- | --- | ---: | ---: |
| 0 | 1.604×10⁻⁴ at 23.647 m, clean | −1.356×10⁻⁴, Type I 13,456 | 0 | 2.3822×10²⁷ kg |
| 0.04c | 0.1084 at 18.071 m | −0.1148, 4,796 cells | 4,796 | 2.3796×10²⁷ kg |
| 0.06c | 0.2002 at 9.321 m | −0.2739, 5,688 cells | 5,688 | 2.3763×10²⁷ kg |

At 0.06c the side flux over peak is −0.219 at 16.14 m, where the density is 0.498 of peak and the old flux was −0.358. At 17.52 m the flux is −0.230, where the old flux was −0.185. At 12 m the flux is +0.232 and that page holds. The exact worst cell at 0.06c is at 18.071 m, place 96.5°, direction 173.9°. At 0.04c it is at 18.128 m, place 82.1°, direction 172.9°. The tail stays under the bar, −1.76×10⁻⁴ at 0.04c and −1.97×10⁻⁴ at 0.06c. The steady recovery quiets the sharp bend and keeps bending where the book is thinner. The 0.04c shell fails there. The eased recovery is not adopted.

## The thickness slack

Dated 2026-11-03. Log `data/dial_slack_fan.txt`. Same one-sixth book, same mass, same hydrostatic lapse. Inside the slope crest at 12.967 m the shift is the mix. From the crest to the window end at 18.454 m the recovery follows the placed density. The scale is fixed by the mix slopes at those two stations, 0.132691 per meter and 0.003063 per meter. The crest recovery is 3.512×10⁻² per square meter. The corner on that join peaks at 3.718×10⁻² per square meter. The old peak recovery is 3.824×10⁻² per square meter at 15.711 m. At 17.52 m the recovery is 1.194×10⁻² per square meter. The shift arrives at 0.0955. The old shift there is 0.0012.

| Speed | Sample | Exact contraction | Type IV | Energy |
| --- | --- | --- | ---: | ---: |
| 0 | dominant 1.604×10⁻⁴ at 23.647 m, clean | −1.356×10⁻⁴, Type I 13,456 | 0 | 2.3822×10²⁷ kg |
| 0.04c | all four under 4.03×10⁻⁴, clean | −7.214×10⁻⁴, Type I 7,976 | 5,480 | 2.3801×10²⁷ kg |
| 0.06c | dominant 0.2002 at 9.321 m | −0.1427, 5,964 cells | 5,964 | 2.3774×10²⁷ kg |

At 0.04c the side flux over peak is −0.222 at 14 m, −0.139 at 16.14 m, −0.079 at 17.52 m, and −0.043 at 18.45 m. The 12 m page holds at +0.155. The exact worst cell is at 24.319 m, place 179.5°, direction 1.0°. The tail contraction is −7.214×10⁻⁴. Serious fraction is 0. The cells with no rest frame are the trail of the leftover shift. At 0.06c the side flux is +0.358 at 9.78 m, +0.232 at 12 m, −0.333 at 14 m, −0.208 at 16.14 m, −0.118 at 17.52 m, and −0.065 at 18.45 m. The exact worst cell is at 9.321 m, place 88.6°, direction 0.7°. The tail contraction is −1.100×10⁻³. The thin pages are quieter than the chord left them. The leftover shift and the inner shoulder keep the run failed. The thickness slack is not adopted.

## The inner buildup

Dated 2026-11-03. Log `data/dial_build_fan.txt`. Same one-sixth book, same mass, same hydrostatic lapse. The outer recovery is the thickness slack. The inner window is 6.866 m to the crest at 12.967 m, the same span construction centered on the strongest steepening at 9.917 m. The climb of |dS| follows the placed density, from 0.03388 per meter to 0.132691 per meter. The crest shift is 0.4330. The mix crest is 0.3841. The shift at the window end is 0.1444.

| Speed | Sample | Exact contraction | Type IV | Energy |
| --- | --- | --- | ---: | ---: |
| 0 | dominant 1.604×10⁻⁴ at 23.647 m, clean | −1.356×10⁻⁴, Type I 13,456 | 0 | 2.3822×10²⁷ kg |
| 0.04c | all four under 5.91×10⁻⁴, clean | −1.113×10⁻³, Type I 7,864 | 5,592 | 2.3804×10²⁷ kg |
| 0.06c | dominant 0.1046 at 2.963 m | −0.09522, 5,788 cells | 5,788 | 2.3780×10²⁷ kg |

At 0.06c the side flux over peak is +0.198 at 8 m, +0.255 at 9.78 m against density 0.613, and +0.317 at 12 m against density 0.809. On the thickness slack those fluxes were +0.358 at 9.78 m and +0.232 at 12 m. The outer side is unchanged at the level of the slack: −0.334 at 14 m, −0.209 at 16.14 m, −0.119 at 17.52 m. The exact worst cell is at 2.963 m, place 94.4°, direction 2.2°. The tail contraction is −1.719×10⁻³. At 0.04c the exact worst cell is at 24.319 m, place 179.5°, direction 0.9°, and the tail contraction is −1.113×10⁻³, with serious fraction 0.0253. The gentler climb leaves a higher crest, and the leftover slide in the trail gets larger. The inner buildup is not adopted.

## The wall buildup

Dated 2026-11-03. Log `data/dial_wall_fan.txt`. Same one-sixth book, same mass, same hydrostatic lapse. The outer recovery is the thickness slack. The climb runs from the cavity wall at 2.853 m to the crest. |dS| follows the placed density. The crest slope stays 0.132691 per meter, and the scale keeps the crest shift at the mix value 0.38409. The shift at the window end is 0.09553, the thickness-slack value. The slope at the wall is 0.011052 per meter. The mix slope there is 0.008879 per meter.

| Speed | Sample | Exact contraction | Type IV | Energy |
| --- | --- | --- | ---: | ---: |
| 0 | dominant 1.604×10⁻⁴ at 23.647 m, clean | −1.356×10⁻⁴, Type I 13,456 | 0 | 2.3822×10²⁷ kg |
| 0.04c | null 3.800×10⁻³ at 2.746 m | −9.008×10⁻³, Type I 7,972 | 5,484 | 2.3802×10²⁷ kg |
| 0.06c | dominant 0.1213 at 2.746 m | −0.1384, 5,640 cells | 5,640 | 2.3777×10²⁷ kg |

At 0.06c the side flux over peak is +0.173 at 3 m against density 0.236, +0.136 at 3.87 m, +0.184 at 6.14 m, +0.242 at 9.78 m against density 0.612, and +0.293 at 12 m. On the mix the 3 m flux is +0.164 and the 6.14 m flux is +0.098. On the thickness slack the 9.78 m flux is +0.358. The outer side matches the slack: −0.333 at 14 m, −0.208 at 16.14 m, −0.118 at 17.52 m. The exact worst cell at both speeds is at 2.746 m, place 65.6°. The tail is the slack tail, −7.214×10⁻⁴ at 0.04c and −1.100×10⁻³ at 0.06c. The shift at 3 m stays 0.993. The wall buildup is not adopted.

## The cabin edge

Dated 2026-11-03. Log `data/dial_cabin_fan.txt`. Same one-sixth book, same mass, same hydrostatic lapse. The outer recovery is the thickness slack. The climb runs from the cavity wall at 2.853 m to the crest. |dS| follows the cumulative thickness and stays between the mix slope at the wall, 0.008879 per meter, and the mix crest slope, 0.132691 per meter. The exponent is 1.047080, fixed by the mix drop 0.61072. The crest shift stays 0.38409. The shift at the window end is 0.09553. The first step is 8.88177×10⁻³ per meter against the mix first step 8.88170×10⁻³ per meter. At 2.75 m and at 2.85 m the shift, the slope, and the steepening stay the mix. The radial peak |d²S| on the buildup is 2.431×10⁻² per square meter.

| Speed | Sample | Exact contraction | Type IV | Energy |
| --- | --- | --- | ---: | ---: |
| 0 | dominant 1.604×10⁻⁴ at 23.647 m, clean | −1.356×10⁻⁴, Type I 13,456 | 0 | 2.3822×10²⁷ kg |
| 0.04c | all four under 4.024×10⁻⁴, clean | −7.214×10⁻⁴, Type I 7,976 | 5,480 | 2.3802×10²⁷ kg |
| 0.06c | dominant 7.746×10⁻² at 2.510 m | −0.06519, 5,616 cells | 5,616 | 2.3777×10²⁷ kg |

At 0.06c the side flux over peak is +0.123 at 2.75 m against density 0.212, +0.120 at 3 m against density 0.236, +0.136 at 3.87 m, +0.189 at 6.14 m against density 0.433, +0.202 at 8 m, +0.248 at 9.78 m against density 0.612, and +0.289 at 12 m. On the wall buildup the 3 m flux is +0.173 and the exact contraction is −0.138 at 2.746 m. On the mix the 3 m flux is +0.164 and the 6.14 m flux is +0.098. The outer side matches the slack: −0.333 at 14 m, −0.208 at 16.14 m, −0.118 at 17.52 m. The exact worst cell at 0.04c is at 24.319 m, place 179.5°, direction 1.0°. The tail is the slack tail, −7.214×10⁻⁴ at 0.04c and −1.100×10⁻³ at 0.06c. At 0.06c the exact worst cell is at 2.510 m, place 95.2°, direction 2.8°. The cabin-edge climb is not adopted.

## The cabin cell

Dated 2026-11-03. Log `data/dial_cell_fan.txt`. Same one-sixth book, same mass, same hydrostatic lapse. The cabin shift stays the mix. From the cavity wall at 2.853 m out to 4.139 m, the corner of the fourth-order difference, |dS| stays at the mix wall slope 0.008879 per meter. Past that corner |dS| follows the cumulative thickness up to the mix crest slope 0.132691 per meter. The exponent is 1.269081, fixed by the mix drop 0.61072. The crest shift stays 0.38409. The shift at the window end is 0.09553. The first step is 8.87928×10⁻³ per meter against the mix first step 8.88170×10⁻³ per meter. At 2.51 m the shift is 0.9973, the slope is −5.675×10⁻³ per meter, and the steepening is −8.168×10⁻³ per square meter, each matching the mix. The radial peak |d²S| on the buildup is 2.697×10⁻² per square meter.

| Speed | Sample | Exact contraction | Type IV | Energy |
| --- | --- | --- | ---: | ---: |
| 0 | dominant 1.604×10⁻⁴ at 23.647 m, clean | −1.356×10⁻⁴, Type I 13,456 | 0 | 2.3822×10²⁷ kg |
| 0.04c | all four under 4.024×10⁻⁴, clean | −7.214×10⁻⁴, Type I 7,976 | 5,480 | 2.3801×10²⁷ kg |
| 0.06c | dominant 8.384×10⁻² at 8.437 m | −0.06953, 5,716 cells | 5,716 | 2.3775×10²⁷ kg |

At 0.06c the side flux over peak is +0.130 at 2.51 m against density 0.188, +0.094 at 2.75 m against density 0.212, +0.058 at 3 m against density 0.236, +0.019 at 3.76 m, +0.092 at 4.14 m, +0.156 at 4.50 m, +0.216 at 6.14 m against density 0.433, +0.230 at 8 m against density 0.441, +0.273 at 9.78 m against density 0.612, and +0.265 at 12 m. On the cabin-edge climb the 3 m flux is +0.120 and the exact contraction is −0.0652 at 2.510 m. The outer side matches the slack: −0.333 at 14 m, −0.208 at 16.14 m, −0.118 at 17.52 m. The exact worst cell at 0.04c is at 24.319 m, place 179.5°, direction 1.0°. The tail is the slack tail, −7.214×10⁻⁴ at 0.04c and −1.100×10⁻³ at 0.06c. At 0.06c the exact worst cell is at 2.510 m, place 95.2°, direction 2.6°. The cabin-cell hold is not adopted.

## The flat cabin

Dated 2026-11-03. Log `data/dial_flat_fan.txt`. Same one-sixth book, same mass, same hydrostatic lapse. The shift is held at 1, and the slope at 0, from the center through 4.139 m, the corner of the fourth-order difference. That page at 2.51 m was still the mix on the cabin-cell hold. From 4.139 m to the crest, |dS| follows the cumulative thickness from 0 up to the mix crest slope 0.132691 per meter. The front exponent is 1.560986, fixed by the drop 0.61591 from a full shift down to the mix crest. A straight climb from 0 to that crest slope would spend 0.49263. The crest shift stays 0.38409. The shift at the window end is 0.09553. At 2.51 m, 2.75 m, 2.85 m, 3.00 m, and 3.76 m the shift is 1, the slope is 0, and the steepening is 0. The radial peak |d²S| on the buildup is 2.734×10⁻² per square meter.

| Speed | Sample | Exact contraction | Type IV | Energy |
| --- | --- | --- | ---: | ---: |
| 0 | dominant 1.604×10⁻⁴ at 23.647 m, clean | −1.356×10⁻⁴, Type I 13,456 | 0 | 2.3822×10²⁷ kg |
| 0.04c | all four under 4.024×10⁻⁴, clean | −7.214×10⁻⁴, Type I 7,976 | 5,480 | 2.3800×10²⁷ kg |
| 0.06c | dominant 0.1406 at 8.338 m | −0.09377, 6,008 cells | 6,008 | 2.3772×10²⁷ kg |

At 0.06c the side flux over peak is −0.0080 at 2.51 m against density 0.188, −0.0091 at 2.75 m against density 0.212, −0.0102 at 3 m against density 0.236, −0.0098 at 3.76 m against density 0.305, +0.0885 at 4.14 m against density 0.336, +0.175 at 4.50 m against density 0.361, +0.253 at 6.14 m against density 0.433, +0.262 at 8 m against density 0.440, +0.293 at 9.78 m against density 0.611, and +0.226 at 12 m. On the cabin-cell hold the 2.51 m flux is +0.130 and the exact contraction is −0.0695 at 2.510 m. The outer side matches the slack: −0.333 at 14 m, −0.208 at 16.14 m, −0.118 at 17.52 m. The exact worst cell at 0.04c is at 24.319 m, place 179.5°, direction 1.0°. The tail is the slack tail, −7.214×10⁻⁴ at 0.04c and −1.100×10⁻³ at 0.06c. At 0.06c the exact worst cell is at 8.437 m, place 62.7°, direction 6.9°. The flat cabin is not adopted.

## The flat band

Dated 2026-11-03. Log `data/dial_band_fan.txt`. Same one-sixth book, same mass, same hydrostatic lapse. The cabin stays at shift 1 and slope 0 through 4.139 m. From 7.151 m to 9.723 m, the fourth-order stencil of the scored cell at 8.437 m, the shift is held at 0.73689. The climb before the band follows the thickness, starts and ends at zero slope, and peaks at the mix crest slope 0.132691 per meter. That quadratic spends 0.26311. The climb after the band follows the thickness from zero slope up to the same crest slope. The front exponent is 5.316401, fixed by the remaining drop 0.35280. A straight after-climb would spend 0.20445. The crest shift stays 0.38409. The shift at the window end is 0.09553. At 2.51 m the shift is 1, the slope is 0, and the steepening is 0. At 8.00 m, 8.44 m, and 9.72 m the shift is 0.7369 and the slope and the steepening are 0. The radial peak |d²S| on the buildup is 0.1925 per square meter, at the return onto the band.

| Speed | Sample | Exact contraction | Type IV | Energy |
| --- | --- | --- | ---: | ---: |
| 0 | dominant 1.604×10⁻⁴ at 23.647 m, clean | −1.356×10⁻⁴, Type I 13,456 | 0 | 2.3822×10²⁷ kg |
| 0.04c | dominant 0.8258 at 4.465 m | −1.980, 6,256 cells | 6,256 | 2.3800×10²⁷ kg |
| 0.06c | dominant 1.255 at 4.465 m | −3.241, 6,508 cells | 6,508 | 2.3772×10²⁷ kg |

At 0.06c the side flux over peak is −0.0080 at 2.51 m against density 0.188, +0.937 at 4.14 m against density 0.335, +1.537 at 4.50 m against density 0.360, −0.419 at 6.14 m against density 0.427, −1.195 at 7.15 m against density 0.448, −0.010 at 8 m against density 0.442, −0.015 at 8.44 m against density 0.464, +1.027 at 9.72 m against density 0.608, +1.185 at 9.78 m against density 0.615, and +0.114 at 12 m. On the flat cabin the 8 m flux is +0.262 and the exact contraction is −0.0938 at 8.437 m. The outer side matches the slack: −0.333 at 14 m, −0.208 at 16.14 m, −0.118 at 17.52 m. At 0.04c the sample null is 0.982. The exact worst cell is at 4.465 m, place 75.3°, direction 11.4°. The tail is still the slack tail, −7.214×10⁻⁴ at 0.04c and −1.100×10⁻³ at 0.06c. At 0.06c the sample null is 1.608, and the exact worst cell is at 4.465 m, place 75.3°, direction 11.2°. The flat band is not adopted.
