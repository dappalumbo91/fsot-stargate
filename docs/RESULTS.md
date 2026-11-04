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

## The soft rise

Dated 2026-11-03. Log `data/dial_rise_fan.txt`. Same one-sixth book, same mass, same hydrostatic lapse. The cabin stays at shift 1 and slope 0 through 4.139 m. From 7.151 m to 9.723 m the shift is held flat. The climb before that shelf is the square of the scored quadratic in the thickness fraction. The value and the slope are zero at both ends, and the peak is the mix crest slope 0.132691 per meter. That quartic spends 0.20938. The shelf sits at 0.79062. The climb after the shelf follows the thickness from zero slope up to the same crest slope. The front exponent is 20.614969, fixed by the remaining drop 0.40653. A straight after-climb would spend 0.20445. The most that after climb can spend without passing the crest slope is 0.42236. The crest shift stays 0.38409. The shift at the window end is 0.09553. At 2.51 m the shift is 1, the slope is 0, and the steepening is 0. At 4.14 m the steepening is −4.221×10⁻⁴ per square meter. At 4.47 m the slope is −0.01521 per meter and the steepening is −0.08511 per square meter. At 8.00 m, 8.44 m, and 9.72 m the shift is 0.7906 and the slope and the steepening are 0. The radial peak |d²S| on the buildup is 0.6766 per square meter, at 9.724 m, where the after climb starts.

| Speed | Sample | Exact contraction | Type IV | Energy |
| --- | --- | --- | ---: | ---: |
| 0 | dominant 1.604×10⁻⁴ at 23.647 m, clean | −1.356×10⁻⁴, Type I 13,456 | 0 | 2.3822×10²⁷ kg |
| 0.04c | dominant 1.469 at 9.839 m | −3.565, 6,128 cells | 6,128 | 2.3798×10²⁷ kg |
| 0.06c | dominant 2.220 at 9.839 m | −5.779, 6,340 cells | 6,340 | 2.3768×10²⁷ kg |

At 0.06c the side flux over peak is −0.0080 at 2.51 m against density 0.188, +0.362 at 4.14 m against density 0.336, +0.973 at 4.47 m against density 0.359, +1.042 at 4.50 m against density 0.361, +0.244 at 5.75 m against density 0.416, −0.991 at 6.14 m against density 0.428, −0.517 at 7.15 m against density 0.449, −0.015 at 8 m against density 0.442, −0.017 at 8.44 m against density 0.464, +2.506 at 9.72 m against density 0.607, +2.858 at 9.78 m against density 0.614, and +0.090 at 12 m. On the flat band the 4.50 m flux is +1.537 and the exact contraction is −3.241 at 4.465 m. The outer side matches the slack: −0.333 at 14 m, −0.208 at 16.14 m, −0.118 at 17.52 m. At 0.04c the sample null is 1.770. The exact worst cell is at 9.839 m, place 83.4°, direction 3.9°. The tail is still the slack tail, −7.214×10⁻⁴ at 0.04c and −1.100×10⁻³ at 0.06c. At 0.06c the sample null is 2.871, and the exact worst cell is at 9.839 m, place 83.4°, direction 3.8°. The soft rise is not adopted.

## The soft leave

Dated 2026-11-03. Log `data/dial_leave_fan.txt`. Same one-sixth book, same mass, same hydrostatic lapse. The cabin stays at shift 1 and slope 0 through 4.139 m. From 7.151 m to 9.723 m the shift is held flat at 0.79062. The climb off the cabin stays the scored quartic. The climb off the shelf is the square of the front law. The steepening starts at zero, and the slope ends at the mix crest slope 0.132691 per meter. The exponent is 31.454738, fixed by the remaining drop 0.40653. At exponent 1 that square spends 0.13380. The most it can spend without passing the crest slope is 0.41835. The crest shift stays 0.38409. The shift at the window end is 0.09553. At 2.51 m the shift is 1, the slope is 0, and the steepening is 0. At 8.44 m and at 9.72 m the shift is 0.7906 and the slope and the steepening are 0. At 9.84 m the slope is −0.04921 per meter and the steepening is −0.5198 per square meter. At 11.13 m the slope is the crest slope and the steepening is 0. The radial peak |d²S| on the buildup is 0.5388 per square meter, at 9.813 m.

| Speed | Sample | Exact contraction | Type IV | Energy |
| --- | --- | --- | ---: | ---: |
| 0 | dominant 1.604×10⁻⁴ at 23.647 m, clean | −1.356×10⁻⁴, Type I 13,456 | 0 | 2.3822×10²⁷ kg |
| 0.04c | dominant 1.566 at 9.901 m | −3.835, 6,124 cells | 6,124 | 2.3798×10²⁷ kg |
| 0.06c | dominant 2.366 at 9.901 m | −6.195, 6,332 cells | 6,332 | 2.3767×10²⁷ kg |

At 0.06c the side flux over peak is −0.0080 at 2.51 m against density 0.188, +0.973 at 4.47 m against density 0.359, −0.017 at 8.44 m against density 0.464, +2.505 at 9.72 m against density 0.607, +2.863 at 9.78 m against density 0.614, +2.621 at 9.84 m against density 0.620, +0.101 at 11.13 m against density 0.751, and +0.090 at 12 m. On the soft rise the exact contraction is −5.779 at 9.839 m, and the 9.78 m flux is +2.858. The outer side matches the slack: −0.333 at 14 m, −0.208 at 16.14 m, −0.118 at 17.52 m. At 0.04c the sample null is 1.903. The exact worst cell is at 9.901 m, place 99.2°, direction 5.2°. The tail is still the slack tail, −7.214×10⁻⁴ at 0.04c and −1.100×10⁻³ at 0.06c. At 0.06c the sample null is 3.075, and the exact worst cell is at 9.901 m, place 99.2°, direction 5.1°. The soft leave is not adopted.

## The even ramp

Dated 2026-11-03. Log `data/dial_even_fan.txt`. Same one-sixth book, same mass, same hydrostatic lapse. The cabin stays at shift 1 and slope 0 through 4.139 m. From 7.151 m to 9.723 m the shift is held flat at 0.79062. The climb off the cabin stays the scored quartic, spend 0.20938. The climb off the shelf rises at one even steepening until the slope reaches the mix crest slope 0.132691 per meter, then holds that slope to the crest. The length is 0.36192 m, fixed by the remaining drop 0.40653. The ramp ends at 10.085 m. The steepening on that stretch is 0.366631 per square meter. A ramp one sample long would spend 0.43051. A ramp across the whole window would spend 0.21529. The crest shift stays 0.38409. The shift at the window end is 0.09553. At 2.51 m the shift is 1, the slope is 0, and the steepening is 0. At 8.44 m and at 9.72 m the shift is 0.7906 and the slope and the steepening are 0. At 9.78 m the slope is −0.02111 per meter. At 9.84 m the slope is −0.04311 per meter. At 9.90 m the slope is −0.06511 per meter. On those three stations the steepening is −0.366631 per square meter. At 11.13 m and at 11.19 m the slope is the crest slope and the steepening is 0. The radial peak |d²S| on the buildup is 0.366631 per square meter, at 10.066 m.

| Speed | Sample | Exact contraction | Type IV | Energy |
| --- | --- | --- | ---: | ---: |
| 0 | dominant 1.604×10⁻⁴ at 23.647 m, clean | −1.356×10⁻⁴, Type I 13,456 | 0 | 2.3822×10²⁷ kg |
| 0.04c | dominant 1.585 at 9.901 m | −3.893, 6,124 cells | 6,124 | 2.3798×10²⁷ kg |
| 0.06c | dominant 2.395 at 9.901 m | −6.283, 6,312 cells | 6,312 | 2.3767×10²⁷ kg |

At 0.06c the side flux over peak is −0.0080 at 2.51 m against density 0.188, +0.973 at 4.47 m against density 0.359, −0.017 at 8.44 m against density 0.464, +2.463 at 9.72 m against density 0.607, +2.814 at 9.78 m against density 0.614, +2.587 at 9.84 m against density 0.620, +2.361 at 9.90 m against density 0.627, +0.102 at 11.13 m against density 0.751, +0.102 at 11.19 m against density 0.756, and +0.090 at 12 m. On the soft leave the exact contraction is −6.195 at 9.901 m, and the 9.78 m flux is +2.863. The outer side matches the slack: −0.333 at 14 m, −0.208 at 16.14 m, −0.118 at 17.52 m. At 0.04c the sample null is 1.931. The exact worst cell is at 9.901 m, place 99.2°, direction 5.2°. The tail is still the slack tail, −7.214×10⁻⁴ at 0.04c and −1.100×10⁻³ at 0.06c. At 0.06c the sample null is 3.119, and the exact worst cell is at 9.901 m, place 99.2°, direction 5.1°. The even ramp is not adopted.

## The even arc

Dated 2026-11-03. Log `data/dial_arc_fan.txt`. Same one-sixth book, same mass, same hydrostatic lapse. The cabin stays at shift 1 and slope 0 through 4.139 m. From 7.151 m to 9.723 m the shift is held flat at 0.79062. The climb off the cabin stays the scored quartic, spend 0.20938. The climb off the shelf rises at one even steepening until the slope reaches the mix crest slope 0.132691 per meter, holds that slope, and returns to the window-end slope 0.003063 per meter at the same steepening. The steepening is 0.037117 per square meter, fixed by the drop 0.69509 from the shelf down to the slack leftover 0.09553. An arc that only just reaches the crest slope and turns back would spend 0.58592. An arc that reaches it in one sample would spend 1.15856. The rise ends at 13.298 m. The hold ends at 14.962 m. The shift at the crest radius is 0.59523. The mix crest is 0.38409. The shift at the window end is 0.09553. At 2.51 m the shift is 1, the slope is 0, and the steepening is 0. At 8.44 m and at 9.72 m the shift is 0.7906 and the slope and the steepening are 0. At 9.90 m the slope is −0.006591 per meter and the steepening is −0.037117 per square meter. At 12.97 m the slope is −0.12054 per meter and the steepening is still −0.037117 per square meter. At 13.30 m and at 14.00 m the slope is the crest slope and the steepening is 0. At 15.00 m the steepening is +0.037117 per square meter. The largest |d²S| inside the window is 0.1461 per square meter at 6.572 m, on the quartic.

| Speed | Sample | Exact contraction | Type IV | Energy |
| --- | --- | --- | ---: | ---: |
| 0 | dominant 1.604×10⁻⁴ at 23.647 m, clean | −1.356×10⁻⁴, Type I 13,456 | 0 | 2.3822×10²⁷ kg |
| 0.04c | dominant 0.8349 at 4.906 m | −1.979, 6,560 cells | 6,560 | 2.3794×10²⁷ kg |
| 0.06c | dominant 1.268 at 4.906 m | −3.254, 7,692 cells | 7,692 | 2.3759×10²⁷ kg |

At 0.06c the side flux over peak is −0.0080 at 2.51 m against density 0.188, +0.973 at 4.47 m against density 0.359, +1.042 at 4.50 m against density 0.361, −0.991 at 6.14 m against density 0.428, −0.016 at 8.44 m against density 0.464, +0.229 at 9.72 m against density 0.608, +0.268 at 9.78 m against density 0.615, +0.320 at 9.90 m against density 0.629, +0.468 at 11.19 m against density 0.761, +0.478 at 12 m against density 0.811, +0.249 at 13.30 m against density 0.858, +0.058 at 14 m against density 0.800, −0.347 at 16.14 m against density 0.497, −0.363 at 17.52 m against density 0.280, and −0.230 at 18.45 m against density 0.165. On the even ramp the exact contraction is −6.283 at 9.901 m, and the 9.90 m flux is +2.361. The outer side of that ramp is −0.208 at 16.14 m and −0.118 at 17.52 m. At 0.04c the sample null is 0.980. The exact worst cell is at 4.906 m, place 103.4°, direction 10.5°. The tail is −7.213×10⁻⁴ at 0.04c and −1.100×10⁻³ at 0.06c. At 0.06c the sample null is 1.611, serious fraction 0.156, and the exact worst cell is at 4.906 m, place 103.4°, direction 10.3°. The exact serious fraction is 0.179. The even arc is not adopted.

## The shared bend

Dated 2026-11-03. Log `data/dial_share_fan.txt`. Same one-sixth book, same mass, same hydrostatic lapse. The cabin stays at shift 1 and slope 0 through 4.139 m. From 7.151 m to 9.723 m the shift is held flat at 0.89215. The climb off the cabin is an even triangle in radius across the 3.013 m window. The climb off the shelf is the even arc. One steepening, 0.047528 per square meter, is the crossing where the cabin-climb steepening equals the arc's own bisection. At the steepening that only just reaches the crest slope, 0.030042 per square meter, the arc wants 0.053379. At the triangle whose peak is the crest slope, 0.088088 per square meter, the arc wants 0.037894. The climb peaks at 0.071584 per meter, under the crest slope 0.132691 per meter. The corner is at 5.645 m. The steepening sampled on that corner is +0.017831 per square meter. The largest |d²S| on the climb is 0.047528 per square meter, at 4.469 m. The arc reaches the crest slope at 12.514 m and holds it to 15.727 m. The shift at the crest radius is 0.64684. The mix crest is 0.38409. The shift at the window end is 0.09553. The climb spends 0.10785. The arc spends 0.79663. At 2.51 m the shift is 1, the slope is 0, and the steepening is 0. At 8.44 m and at 9.72 m the shift is 0.8922 and the slope and the steepening are 0. At 4.91 m the slope is −0.036671 per meter and the steepening is −0.047528 per square meter. At 5.65 m the slope is −0.071346 per meter and the steepening is +0.047528 per square meter. At 9.90 m the slope is −0.008440 per meter and the steepening is −0.047528 per square meter. At 12.97 m the slope is the crest slope and the steepening is 0.

| Speed | Sample | Exact contraction | Type IV | Energy |
| --- | --- | --- | ---: | ---: |
| 0 | dominant 1.604×10⁻⁴ at 23.647 m, clean | −1.356×10⁻⁴, Type I 13,456 | 0 | 2.3822×10²⁷ kg |
| 0.04c | dominant 0.3676 at 5.232 m | −0.6299, 6,832 cells | 6,832 | 2.3789×10²⁷ kg |
| 0.06c | dominant 0.5697 at 5.232 m | −1.197, 7,704 cells | 7,704 | 2.3746×10²⁷ kg |

At 0.06c the side flux over peak is −0.008 at 2.51 m against density 0.188, +0.584 at 4.47 m against density 0.359, +0.593 at 4.50 m against density 0.361, +0.703 at 4.91 m against density 0.385, +0.074 at 5.65 m against density 0.418, −0.562 at 6.14 m against density 0.433, −0.019 at 8.44 m against density 0.464, +0.296 at 9.72 m against density 0.608, +0.346 at 9.78 m against density 0.615, +0.413 at 9.90 m against density 0.629, +0.603 at 11.19 m against density 0.761, +0.636 at 12 m against density 0.809, +0.059 at 13.30 m against density 0.857, −0.466 at 16.14 m against density 0.495, −0.465 at 17.52 m against density 0.279, and −0.288 at 18.45 m against density 0.165. On the even arc the exact contraction is −3.254 at 4.906 m, the 4.50 m flux is +1.042, and the 9.90 m flux is +0.320. The outer side of that arc is −0.347 at 16.14 m and −0.363 at 17.52 m. At 0.04c the sample null is 0.312. The exact worst cell is at 5.232 m, place 87.5°, direction 1.6°. The tail is −7.213×10⁻⁴ at 0.04c and −1.100×10⁻³ at 0.06c. At 0.06c the sample null is 0.594, serious fraction 0.156, and the exact worst cell is at 5.232 m, place 87.5°, direction 1.5°. The exact serious fraction is 0.180. The shared bend is not adopted.

## The spanned bend

Dated 2026-11-03. Log `data/dial_span_fan.txt`. Same one-sixth book, same mass, same hydrostatic lapse. The cabin stays at shift 1 and slope 0 through 4.139 m. From 7.151 m to 9.723 m the shift is held flat at 0.96352. The climb off the cabin rises at one steepening for 0.2205 m, holds that slope across 2.571 m, and falls over the last 0.2205 m. The hold is one full fourth-order stencil, 2 × 2√2 h. The reversals are at 4.359 m and 6.931 m. One steepening, 0.059199 per square meter, is the crossing where the cabin-climb steepening equals the arc's own bisection. At the steepening that only just reaches the crest slope, 0.030042 per square meter, the arc wants 0.063100. At the top of the bracket, 0.51698 per square meter, the arc wants 0.030042. The climb peaks at 0.013065 per meter, under the crest slope 0.132691 per meter. The steepening sampled on the inner reversal is −0.017311 per square meter. On the outer reversal it is +0.042212 per square meter. The largest |d²S| on the climb is 0.059199 per square meter. The arc reaches the crest slope at 11.964 m and holds it to 16.265 m. The shift at the crest radius is 0.68169. The mix crest is 0.38409. The shift at the window end is 0.09553. The climb spends 0.03648. The arc spends 0.86799. At 2.51 m the shift is 1, the slope is 0, and the steepening is 0. At 5.23 m the shift is 0.9872, the slope is −0.013065 per meter, and the steepening is 0. At 8.44 m and at 9.72 m the shift is 0.9635 and the slope and the steepening are 0. At 9.90 m the slope is −0.010513 per meter and the steepening is −0.059199 per square meter. At 12.97 m the slope is the crest slope and the steepening is 0.

| Speed | Sample | Exact contraction | Type IV | Energy |
| --- | --- | --- | ---: | ---: |
| 0 | dominant 1.604×10⁻⁴ at 23.647 m, clean | −1.356×10⁻⁴, Type I 13,456 | 0 | 2.3822×10²⁷ kg |
| 0.04c | dominant 0.3467 at 10.230 m | −0.6009, 6,724 cells | 6,724 | 2.3784×10²⁷ kg |
| 0.06c | dominant 0.6068 at 11.593 m | −1.003, 7,224 cells | 7,224 | 2.3737×10²⁷ kg |

At 0.06c the side flux over peak is −0.008 at 2.51 m against density 0.188, +0.231 at 4.14 m against density 0.335, +0.335 at 4.36 m against density 0.352, +0.222 at 4.50 m against density 0.361, +0.001 at 4.91 m against density 0.386, +0.014 at 5.23 m against density 0.403, +0.011 at 5.65 m against density 0.419, −0.276 at 6.93 m against density 0.446, −0.020 at 8.44 m against density 0.464, +0.372 at 9.72 m against density 0.607, +0.435 at 9.78 m against density 0.615, +0.518 at 9.90 m against density 0.629, +0.759 at 11.19 m against density 0.759, +0.343 at 12 m against density 0.807, +0.064 at 13.30 m against density 0.857, −0.079 at 16.14 m against density 0.493, −0.579 at 17.52 m against density 0.279, and −0.353 at 18.45 m against density 0.165. On the shared bend the exact contraction is −1.197 at 5.232 m, the 4.91 m flux is +0.703, the 9.90 m flux is +0.413, and the outer side is −0.466 at 16.14 m and −0.465 at 17.52 m. At 0.04c the sample null is 0.300. The exact worst cell is at 18.071 m, place 96.5°, direction 174.0°. The tail is −7.213×10⁻⁴ at 0.04c and −1.099×10⁻³ at 0.06c. At 0.06c the sample null is 0.501, serious fraction 0.121, and the exact worst cell is at 18.071 m, place 96.5°, direction 174.0°. The exact serious fraction is 0.143. The spanned bend is not adopted.

## The tapered fall

Dated 2026-11-03. Log `data/dial_taper_fan.txt`. Same one-sixth book, same mass, same hydrostatic lapse. The cabin stays at shift 1 and slope 0 through 4.139 m. From 7.151 m to 9.723 m the shift is held flat at 0.94244. The climb off the cabin stays the spanned climb. It rises at one steepening for 0.2205 m, holds that slope across 2.571 m, and falls over the last 0.2205 m. The hold is one full fourth-order stencil, 2 × 2√2 h. The reversals are at 4.359 m and 6.931 m. One steepening, 0.0934055 per square meter, is the crossing where the cabin-climb steepening equals the arc's own bisection. At the shortest taper that still fits the window, 0.040899 per square meter, the arc wants 0.104988. At the top of the bracket, 0.60123 per square meter, the arc wants 0.043389. The climb peaks at 0.020614 per meter, under the crest slope 0.132691 per meter. The steepening sampled on the inner reversal is −0.027313 per square meter. On the outer reversal it is +0.066602 per square meter. The largest |d²S| on the climb is 0.0934055 per square meter. The arc reaches the crest slope at 11.143 m and holds it to 15.855 m. The return then eases from 0.0934055 per square meter down to the book's own outer bend, 0.0063465 per square meter, over 2.599 m. The slope at the window end is the book's own end slope. The shift at the crest radius is 0.60615. The mix crest is 0.38409. The shift at the window end is 0.09553. The climb spends 0.05756. The arc spends 0.84692. At 2.51 m the shift is 1, the slope is 0, and the steepening is 0. At 5.23 m the shift is 0.9798, the slope is −0.020614 per meter, and the steepening is 0. At 8.44 m and at 9.72 m the shift is 0.9424 and the slope and the steepening are 0. At 9.90 m the slope is −0.016587 per meter and the steepening is −0.0934055 per square meter. At 12.97 m the slope is the crest slope and the steepening is 0. At 18.07 m the steepening is +0.019182 per square meter. At the window end it is +0.006346 per square meter, against the book's 0.0063465.

| Speed | Sample | Exact contraction | Type IV | Energy |
| --- | --- | --- | ---: | ---: |
| 0 | dominant 1.604×10⁻⁴ at 23.647 m, clean | −1.356×10⁻⁴, Type I 13,456 | 0 | 2.3822×10²⁷ kg |
| 0.04c | dominant 0.6105 at 10.704 m | −0.9746, 6,608 cells | 6,608 | 2.3787×10²⁷ kg |
| 0.06c | dominant 0.9323 at 10.704 m | −1.882, 7,072 cells | 7,072 | 2.3742×10²⁷ kg |

At 0.06c the side flux over peak is −0.008 at 2.51 m against density 0.188, +0.373 at 4.14 m against density 0.335, +0.538 at 4.36 m against density 0.352, +0.359 at 4.50 m against density 0.361, +0.011 at 4.91 m against density 0.386, +0.032 at 5.23 m against density 0.403, −0.425 at 6.93 m against density 0.446, −0.020 at 8.44 m against density 0.464, +0.603 at 9.72 m against density 0.608, +0.833 at 9.90 m against density 0.628, +0.677 at 11.13 m against density 0.752, +0.596 at 11.19 m against density 0.756, +0.077 at 12 m against density 0.807, +0.066 at 13.30 m against density 0.858, −0.815 at 16.14 m against density 0.495, −0.375 at 17.52 m against density 0.280, −0.194 at 18.07 m against density 0.208, and −0.081 at 18.45 m against density 0.165. On the spanned bend the exact contraction is −1.003 at 18.071 m, the 17.52 m flux is −0.579, the 18.45 m flux is −0.353, and the 16.14 m flux is −0.079. At 0.04c the sample null is 0.482. The exact worst cell is at 10.704 m, place 93.7°, direction 3.0°. The tail is −7.213×10⁻⁴ at 0.04c and −1.100×10⁻³ at 0.06c. At 0.06c the sample null is 0.934, serious fraction 0.110, and the exact worst cell is at 10.704 m, place 93.7°, direction 2.9°. The exact serious fraction is 0.133. The tapered fall is not adopted.

## The stencil rise

Dated 2026-11-03. Log `data/dial_stencil_fan.txt`. Same one-sixth book, same mass, same hydrostatic lapse. The cabin stays at shift 1 and slope 0 through 4.139 m. From 7.151 m to 9.723 m the shift is held flat at 0.86834. The climb off the cabin still rises for 0.2205 m, holds that slope across 2.571 m, and falls over the last 0.2205 m. The hold is one full fourth-order stencil, 2 × 2√2 h. The reversals are at 4.359 m and 6.931 m. The cabin steepening is 0.213664 per square meter. It is the one value that spends what the arc leaves. The climb peaks at 0.047155 per meter, under the crest slope 0.132691 per meter. The steepening sampled on the inner reversal is −0.062478 per square meter. On the outer reversal it is +0.152352 per square meter. The largest |d²S| on the climb is 0.213664 per square meter. The arc rises for one stencil, 2.571 m, at 0.0516045 per square meter, and reaches the crest slope at 12.294 m. It holds that slope to 15.883 m. The return is one stencil long, 2.571 m, and eases from 0.094480 per square meter down to the book's own outer bend, 0.00634649 per square meter. The slope at the window end is the book's own end slope. The 10.70 m page is 1.590 m short of the top of the rise. The 18.07 m page is 2.188 m past the start of the return. The fourth-order reach is 1.286 m. The shift at the crest radius is 0.60839. The mix crest is 0.38409. The shift at the window end is 0.09553. The climb spends 0.13166. The arc spends 0.77282. At 2.51 m the shift is 1, the slope is 0, and the steepening is 0. At 5.23 m the shift is 0.9537, the slope is −0.047155 per meter, and the steepening is 0. At 8.44 m and at 9.72 m the shift is 0.8683 and the slope and the steepening are 0. At 9.90 m the slope is −0.009164 per meter and the steepening is −0.0516045 per square meter. At 10.70 m the slope is −0.050448 per meter and the steepening is −0.0516045 per square meter. At 12.97 m the slope is the crest slope and the steepening is 0. At 18.071 m the steepening is +0.019481 per square meter. At the window end it is +0.006346 per square meter, against the book's 0.00634649.

| Speed | Sample | Exact contraction | Type IV | Energy |
| --- | --- | --- | ---: | ---: |
| 0 | dominant 1.604×10⁻⁴ at 23.647 m, clean | −1.356×10⁻⁴, Type I 13,456 | 0 | 2.3822×10²⁷ kg |
| 0.04c | dominant 0.6551 at 4.324 m | −1.510, 6,660 cells | 6,660 | 2.3790×10²⁷ kg |
| 0.06c | dominant 0.9978 at 4.324 m | −2.518, 7,360 cells | 7,360 | 2.3748×10²⁷ kg |

At 0.06c the side flux over peak is −0.008 at 2.51 m against density 0.188, +0.871 at 4.14 m against density 0.335, +1.250 at 4.36 m against density 0.352, +0.841 at 4.50 m against density 0.361, +0.047 at 4.91 m against density 0.385, +0.096 at 5.23 m against density 0.402, −0.946 at 6.93 m against density 0.446, −1.014 at 7.15 m against density 0.448, −0.018 at 8.44 m against density 0.464, +0.324 at 9.72 m against density 0.608, +0.451 at 9.90 m against density 0.629, +0.645 at 10.70 m against density 0.716, +0.657 at 11.13 m against density 0.756, +0.646 at 12 m against density 0.808, +0.065 at 13.30 m against density 0.858, −0.806 at 16.14 m against density 0.495, −0.382 at 17.52 m against density 0.280, −0.197 at 18.07 m against density 0.208, and −0.082 at 18.45 m against density 0.165. On the tapered fall the exact contraction is −1.882 at 10.704 m, the 4.36 m flux is +0.538, the 9.90 m flux is +0.833, the 6.93 m flux is −0.425, and the 18.07 m flux is −0.194. At 0.04c the sample null is 0.749. The exact worst cell is at 4.324 m, place 87.0°, direction 1.5°. The tail is −7.213×10⁻⁴ at 0.04c and −1.100×10⁻³ at 0.06c. At 0.06c the sample null is 1.250, serious fraction 0.130, and the exact worst cell is at 4.324 m, place 87.0°, direction 1.5°. The exact serious fraction is 0.154. The stencil rise is not adopted.

## The reach fall

Dated 2026-11-04. Log `data/dial_reach_fan.txt`. Same one-sixth book, same mass, same hydrostatic lapse. The cabin stays at shift 1 and slope 0 through 4.139 m. From 7.151 m to 9.723 m the shift is held flat at 0.94227. The climb off the cabin still rises for 0.2205 m, holds that slope across 2.571 m, and falls over the last 0.2205 m. The hold is one full fourth-order stencil, 2 × 2√2 h. The reversals are at 4.359 m and 6.931 m. The cabin steepening is 0.0936954 per square meter. It is the one value that spends what the arc leaves. The climb peaks at 0.020678 per meter, under the crest slope 0.132691 per meter. The steepening sampled on the inner reversal is −0.027398 per square meter. On the outer reversal it is +0.066809 per square meter. The largest |d²S| on the climb is 0.0936954 per square meter. The 4.32 m page is 0.185 m past the start of that rise and 0.035 m short of the level-off. At 4.32 m the shift is 0.9985, the slope is −0.017012 per meter, and the steepening is −0.0936954 per square meter. The arc rises for one stencil, 2.571 m, at 0.0516045 per square meter, and reaches the crest slope at 12.294 m. It holds that slope to 16.785 m. The return runs 1.669 m and eases from 0.148983 per square meter down to the book's own outer bend, 0.00634649 per square meter. The slope at the window end is the book's own end slope. The 10.70 m page is 1.590 m short of the top of the rise. The 18.07 m page is 1.286 m past the start of the return, equal to the fourth-order reach. The 17.12 m page is 0.335 m past that start. The shift at the crest radius is 0.68232. The mix crest is 0.38409. The shift at the window end is 0.09553. The climb spends 0.05773. The arc spends 0.84674. At 2.51 m the shift is 1, the slope is 0, and the steepening is 0. At 5.23 m the shift is 0.9797, the slope is −0.020678 per meter, and the steepening is 0. At 8.44 m and at 9.72 m the shift is 0.9423 and the slope and the steepening are 0. At 10.70 m the slope is −0.050448 per meter and the steepening is −0.0516045 per square meter. At 12.97 m the slope is the crest slope and the steepening is 0. At 16.14 m the slope is still the crest slope and the steepening is 0. At 18.071 m the steepening is +0.039093 per square meter. At the window end it is +0.006349 per square meter, against the book's 0.00634649.

| Speed | Sample | Exact contraction | Type IV | Energy |
| --- | --- | --- | ---: | ---: |
| 0 | dominant 1.604×10⁻⁴ at 23.647 m, clean | −1.356×10⁻⁴, Type I 13,456 | 0 | 2.3822×10²⁷ kg |
| 0.04c | dominant 0.5763 at 17.120 m | −1.288, 6,520 cells | 6,520 | 2.3784×10²⁷ kg |
| 0.06c | dominant 0.8662 at 17.120 m | −2.097, 7,084 cells | 7,084 | 2.3736×10²⁷ kg |

At 0.06c the side flux over peak is −0.008 at 2.51 m against density 0.188, +0.374 at 4.14 m against density 0.335, +0.581 at 4.32 m against density 0.349, +0.540 at 4.36 m against density 0.352, +0.360 at 4.50 m against density 0.361, +0.032 at 5.23 m against density 0.403, −0.426 at 6.93 m against density 0.446, −0.456 at 7.15 m against density 0.448, −0.020 at 8.44 m against density 0.464, +0.449 at 9.90 m against density 0.629, +0.643 at 10.70 m against density 0.716, +0.654 at 11.13 m against density 0.756, +0.643 at 12 m against density 0.808, +0.062 at 13.30 m against density 0.857, +0.081 at 16.14 m against density 0.493, −0.871 at 17.52 m against density 0.279, −0.397 at 18.07 m against density 0.208, and −0.117 at 18.45 m against density 0.165. On the stencil rise the exact contraction is −2.518 at 4.324 m, the 4.36 m flux is +1.250, the 16.14 m flux is −0.806, the 17.52 m flux is −0.382, and the 18.07 m flux is −0.197. On the tapered fall the exact contraction is −1.882 at 10.704 m. At 0.04c the sample null is 0.643. The exact worst cell is at 17.120 m, place 95.3°, direction 175.2°. The tail is −7.213×10⁻⁴ at 0.04c and −1.099×10⁻³ at 0.06c. At 0.06c the sample null is 1.047, serious fraction 0.111, and the exact worst cell is at 17.120 m, place 95.3°, direction 175.2°. The exact serious fraction is 0.133. The reach fall is not adopted.

## The packing fall

Dated 2026-11-04. Log `data/dial_pack_fan.txt`. Same one-sixth book, same mass, same hydrostatic lapse. The cabin stays at shift 1 and slope 0 through 4.139 m. From 7.151 m to 9.723 m the shift is held flat at 0.62956. The climb off the cabin still rises for 0.2205 m, holds that slope across 2.571 m, and falls over the last 0.2205 m. The hold is one full fourth-order stencil, 2 × 2√2 h. The reversals are at 4.359 m and 6.931 m. The cabin steepening is 0.601185 per square meter. It is the crest slope spread across that short rise, the most the climb can spend without passing the crest slope 0.132691 per meter. The climb peaks at 0.132680 per meter. The steepening sampled on the inner reversal is −0.175794 per square meter. On the outer reversal it is +0.428672 per square meter. The largest |d²S| on the climb is 0.601185 per square meter. The 4.32 m page is 0.185 m past the start of that rise and 0.035 m short of the level-off. At 4.32 m the shift is 0.9901, the slope is −0.109157 per meter, and the steepening is −0.601185 per square meter. The arc rises for one stencil, 2.571 m, at 0.0516045 per square meter, and reaches the crest slope at 12.294 m. It holds that slope to 12.770 m. The recovery then follows the packing for 5.685 m. The lip steepening is 0.033462 per square meter, and it eases with the density toward the book's own outer bend, 0.00634649 per square meter. At 17.12 m the steepening is +0.013733 per square meter and the slope is −0.016358 per meter. That page is 4.350 m past the lip. The fourth-order reach is 1.286 m. The 10.70 m page is 1.590 m short of the top of the rise. The shift at the crest radius is 0.37026. The mix crest is 0.38409. The shift at the window end is 0.09553. The climb spends 0.37044. The arc spends 0.53403. At 2.51 m the shift is 1, the slope is 0, and the steepening is 0. At 5.23 m the shift is 0.8698, the slope is −0.132680 per meter, and the steepening is 0. At 7.15 m the steepening is +0.601185 per square meter. At 8.44 m and at 9.72 m the shift is 0.6296 and the slope and the steepening are 0. At 18.071 m the steepening is +0.008398 per square meter. At the window end it is +0.006418 per square meter, against the book's 0.00634649.

| Speed | Sample | Exact contraction | Type IV | Energy |
| --- | --- | --- | ---: | ---: |
| 0 | dominant 1.604×10⁻⁴ at 23.647 m, clean | −1.356×10⁻⁴, Type I 13,456 | 0 | 2.3822×10²⁷ kg |
| 0.04c | dominant 1.842 at 4.324 m | −4.979, 6,296 cells | 6,296 | 2.3803×10²⁷ kg |
| 0.06c | dominant 2.788 at 4.324 m | −7.832, 6,756 cells | 6,756 | 2.3779×10²⁷ kg |

At 0.06c the side flux over peak is −0.008 at 2.51 m against density 0.188, +2.477 at 4.14 m against density 0.334, +3.810 at 4.32 m against density 0.347, +3.546 at 4.36 m against density 0.349, +2.395 at 4.50 m against density 0.356, +0.301 at 5.23 m against density 0.395, −2.627 at 6.93 m against density 0.443, −2.818 at 7.15 m against density 0.447, −0.013 at 8.44 m against density 0.464, +0.458 at 9.90 m against density 0.629, +0.653 at 10.70 m against density 0.716, −0.321 at 13.30 m against density 0.859, −0.198 at 16.14 m against density 0.499, −0.135 at 17.12 m against density 0.340, −0.112 at 17.52 m against density 0.280, −0.084 at 18.07 m against density 0.208, and −0.063 at 18.45 m against density 0.165. On the reach fall the exact contraction is −2.097 at 17.120 m, the 17.52 m flux is −0.871, and the 4.32 m flux is +0.581. At 0.04c the sample null is 2.473. The exact worst cell is at 4.324 m, place 87.0°, direction 1.5°. The tail is −7.213×10⁻⁴ at 0.04c and −1.100×10⁻³ at 0.06c. At 0.06c the sample null is 3.891, serious fraction 0.087, and the exact worst cell is at 4.324 m, place 87.0°, direction 1.5°. The exact serious fraction is 0.109. The packing fall is not adopted.

## The ogee

Dated 2026-11-04. Log `data/dial_ogee_fan.txt`. Same one-sixth book, same mass, same hydrostatic lapse. The cabin stays at shift 1 and slope 0 through 4.139 m. From 7.151 m to 9.723 m the shift is held flat at 0.89751. The cabin hump and the outer arc share one packing scale, 7.71396×10⁻²⁵. Steepening equals that scale times the placed density. The scale is the one value that spends the drop from a full shift down to the leftover 0.09553. The cabin peaks at 0.0691219 per meter at 5.742 m, under the crest slope 0.132691 per meter. The cabin bend is 0.0501590 per square meter. The 4.32 m page is 0.185 m past the cabin start and 1.418 m short of the cabin peak. At 4.32 m the shift is 0.9994, the slope is −0.00695404 per meter, and the steepening is −0.0390883 per square meter. At 5.23 m the shift is 0.9759, the slope is −0.0454447 per meter, and the steepening is −0.0450736 per square meter. The steepening changes sign between 5.65 m and 5.75 m, from −0.0469655 to +0.0473386 per square meter. At 7.15 m the slope is −4.41540×10⁻⁵ per meter and the steepening is +0.0501583 per square meter. The arc starts at slope 0 off the shelf, reaches the crest slope at 11.416 m, and holds it. The lip is at 15.392 m. The fall runs 3.063 m. The lip bends at 0.0697312 per square meter and eases with the packing toward the book's own outer bend, 0.00634649 per square meter. The 10.70 m page is 0.71179 m short of the arc top. The 10.970 m cell is 0.446 m short of that top. The fourth-order reach is 1.286 m, so that cell holds the shoulder. The 17.12 m page is 1.728 m past the lip. At 17.12 m the shift is 0.1212, the slope is −0.0397993 per meter, and the steepening is +0.0379446 per square meter. The 18.07 m page is 2.679 m past the lip. The shift at the crest radius is 0.58398. The mix crest is 0.38409. The cabin spends 0.10249. The arc spends 0.80199. At 2.51 m the shift is 1, the slope is 0, and the steepening is 0. At 8.44 m and at 9.72 m the shift is 0.8975 and the slope and the steepening are 0. At 10.70 m the shift is 0.8630, the slope is −0.0726122 per meter, and the steepening is −0.0802818 per square meter. At 11.13 m the slope is −0.108131 per meter and the steepening is −0.0847975 per square meter. At 12.00 m the slope is the crest slope and the steepening is 0. The largest |d²S| through the window is 0.0873226 per square meter, at 11.414 m. At 18.071 m the steepening is +0.0232176 per square meter. At the window end it is +0.00934705 per square meter, against the book's 0.00634649.

| Speed | Sample | Exact contraction | Type IV | Energy |
| --- | --- | --- | ---: | ---: |
| 0 | dominant 1.604×10⁻⁴ at 23.647 m, clean | −1.356×10⁻⁴, Type I 13,456 | 0 | 2.3822×10²⁷ kg |
| 0.04c | dominant 0.5290 at 10.970 m | −0.7245, 6,892 cells | 6,892 | 2.3789×10²⁷ kg |
| 0.06c | dominant 0.8161 at 10.970 m | −1.511, 7,552 cells | 7,552 | 2.3748×10²⁷ kg |

At 0.06c the side flux over peak is −0.008 at 2.51 m against density 0.188, +0.263 at 4.14 m against density 0.335, +0.439 at 4.32 m against density 0.349, +0.455 at 4.36 m against density 0.352, +0.703 at 5.23 m against density 0.402, −0.580 at 6.14 m against density 0.433, −0.504 at 6.93 m against density 0.446, −0.364 at 7.15 m against density 0.448, −0.019 at 8.44 m against density 0.464, +0.632 at 9.90 m against density 0.629, +1.018 at 10.70 m against density 0.715, +1.064 at 11.13 m against density 0.753, +0.971 at 11.19 m against density 0.757, +0.084 at 12.00 m against density 0.807, −0.621 at 15.70 m against density 0.569, −0.548 at 16.14 m against density 0.497, −0.373 at 17.12 m against density 0.339, −0.310 at 17.52 m against density 0.280, −0.224 at 18.07 m against density 0.208, and −0.133 at 18.45 m against density 0.165. On the packing fall the exact contraction is −7.832 at 4.324 m, the 4.32 m flux is +3.810, and the 7.15 m flux is −2.818. On the reach fall the exact contraction is −2.097 at 17.120 m. At 0.04c the sample null is 0.3562. The exact worst cell is at 10.970 m, place 103.2°, direction 10.5°. The tail is −7.214×10⁻⁴ at 0.04c and −1.100×10⁻³ at 0.06c. At 0.06c the sample null is 0.7455, serious fraction 0.146, and the exact worst cell is at 10.970 m, place 103.2°, direction 10.3°. The exact serious fraction is 0.169. The ogee is not adopted.

## The seated rise

Dated 2026-11-04. Log `data/dial_seat_fan.txt`. Same one-sixth book, same mass, same hydrostatic lapse. The cabin stays at shift 1 and slope 0 through 4.139 m. From 7.151 m to 9.723 m the shift is held flat at 0.80326. The rise leaves that shelf with the bend at 0 and arrives on the density peak at 12.968 m with the slope at the crest slope 0.132691 per meter and the bend at 0. Between the shelf density and the peak density the bend follows that packing. The rise scale is 1.55791×10⁻⁴⁶. The cabin hump is held at the crest slope, the most it can spend without passing that slope. It peaks at 0.132690 per meter at 5.742 m. The cabin bend is 0.0962880 per square meter. The 4.32 m page is 0.185 m past the cabin start and 1.418 m short of the cabin peak. At 4.32 m the shift is 0.9988, the slope is −0.0133494 per meter, and the steepening is −0.0750360 per square meter. At 5.23 m the shift is 0.9538, the slope is −0.0872382 per meter, and the steepening is −0.0865258 per square meter. The steepening changes sign between 5.65 m and 5.75 m, from −0.0901575 to +0.0908737 per square meter. At 7.15 m the slope is −8.47605×10⁻⁵ per meter and the steepening is +0.0962865 per square meter. The 5.349 m cell is 0.393 m short of the cabin peak. The fourth-order reach is 1.286 m, so that cell holds the sign change. The hold runs from 12.968 m to 15.439 m, 2.472 m. The fall runs 3.015 m. The fall scale is 7.91584×10⁻²⁵. The lip bends at 0.0706773 per square meter and eases with the packing toward the book's own outer bend, 0.00634649 per square meter. The 10.97 m page is 1.998 m short of the peak, outside that reach. At 10.70 m the shift is 0.7910, the slope is −0.0341258 per meter, and the steepening is −0.0553037 per square meter. At 11.13 m the slope is −0.0583990 per meter and the steepening is −0.0558055 per square meter. At 12.00 m the slope is −0.100126 per meter and the steepening is −0.0387650 per square meter. At 12.97 m the slope is the crest slope and the steepening is 0. The shift at the crest radius is 0.58802. The mix crest is 0.38409. The cabin spends 0.19674. The arc spends 0.70774. At 2.51 m the shift is 1, the slope is 0, and the steepening is 0. At 8.44 m and at 9.72 m the shift is 0.8033 and the slope and the steepening are 0. The largest |d²S| through the window is 0.0962869 per square meter, at 7.150 m. At 18.071 m the steepening is +0.0238252 per square meter. At the window end it is +0.00946718 per square meter, against the book's 0.00634649.

| Speed | Sample | Exact contraction | Type IV | Energy |
| --- | --- | --- | ---: | ---: |
| 0 | dominant 1.604×10⁻⁴ at 23.647 m, clean | −1.356×10⁻⁴, Type I 13,456 | 0 | 2.3822×10²⁷ kg |
| 0.04c | dominant 0.6755 at 5.349 m | −1.502, 6,896 cells | 6,896 | 2.3793×10²⁷ kg |
| 0.06c | dominant 1.028 at 5.349 m | −2.534, 7,704 cells | 7,704 | 2.3755×10²⁷ kg |

At 0.06c the side flux over peak is −0.008 at 2.51 m against density 0.188, +0.518 at 4.14 m against density 0.335, +0.856 at 4.32 m against density 0.349, +0.887 at 4.36 m against density 0.352, +1.367 at 5.23 m against density 0.399, +0.626 at 5.65 m against density 0.414, +0.329 at 5.75 m against density 0.417, −1.095 at 6.14 m against density 0.430, −0.950 at 6.93 m against density 0.446, −0.681 at 7.15 m against density 0.448, −0.017 at 8.44 m against density 0.464, +0.182 at 9.90 m against density 0.629, +0.673 at 10.70 m against density 0.717, +0.694 at 11.13 m against density 0.757, +0.685 at 11.19 m against density 0.761, +0.511 at 12.00 m against density 0.810, +0.103 at 13.30 m against density 0.858, −0.604 at 15.70 m against density 0.568, −0.565 at 16.14 m against density 0.497, −0.383 at 17.12 m against density 0.339, −0.318 at 17.52 m against density 0.280, −0.230 at 18.07 m against density 0.208, and −0.136 at 18.45 m against density 0.165. On the ogee the exact contraction is −1.511 at 10.970 m, the 11.13 m flux is +1.064, and the 4.32 m flux is +0.439. At 0.04c the sample null is 0.7422. The exact worst cell is at 5.349 m, place 102.3°, direction 7.4°. The tail is −7.214×10⁻⁴ at 0.04c and −1.100×10⁻³ at 0.06c. At 0.06c the sample null is 1.254, serious fraction 0.157, and the exact worst cell is at 5.349 m, place 102.3°, direction 7.3°. The exact serious fraction is 0.180. The seated rise is not adopted.

## The balanced crest

Dated 2026-11-04. Log `data/dial_balance_fan.txt`. Same one-sixth book, same mass, same hydrostatic lapse. The cabin stays at shift 1 and slope 0 through 4.139 m. From 7.151 m to 9.723 m the shift is held flat at 0.99694. The rise leaves that shelf with the bend at 0 and arrives on the density peak at 12.968 m with the slope at the crest slope 0.132691 per meter and the bend at 0. Between the shelf density and the peak density the bend follows that packing. The rise scale is 1.55791×10⁻⁴⁶. On the cabin, the split is the radius where the up packing integral matches the down packing integral. The up integral is 1.45307×10⁴³ and the down integral is 1.45329×10⁴³. Both halves use the rise scale. The cabin crest is at 5.166 m. The crest bend is 0. The cabin peaks at 0.00226375 per meter, under the crest slope. The cabin bend is 0.00334310 per square meter. The 4.32 m page is 0.185 m past the cabin start and 0.842 m short of that crest. At 4.32 m the shift is 1.0000, the slope is −0.000220937 per meter, and the steepening is −0.00221656 per square meter. At 5.23 m the shift is 0.9986, the slope is −0.00224888 per meter, and the steepening is +0.000449446 per square meter. At 5.35 m the shift is 0.9984, the slope is −0.00215487 per meter, and the steepening is +0.00109225 per square meter. At 7.15 m the slope is −5.31853×10⁻¹⁰ per meter and the steepening is +1.06570×10⁻⁶ per square meter. The cabin spends 0.00306. The rise spends 0.21531. The arc spends 0.90141. The hold runs from 12.968 m to 17.845 m, 4.877 m, at the crest slope. The fall runs 0.610 m. The fall scale is 7.37379×10⁻²⁴. The lip bends at 0.252196 per square meter and eases with the packing toward the book's own outer bend, 0.00634649 per square meter. The 10.97 m page is 1.99758 m short of the peak, outside the fourth-order reach of 1.28565 m. At 10.70 m the shift is 0.9846, the slope is −0.0341258 per meter, and the steepening is −0.0553037 per square meter. At 11.13 m the slope is −0.0583990 per meter and the steepening is −0.0558055 per square meter. At 12.00 m the shift is 0.8947, the slope is −0.100126 per meter, and the steepening is −0.0387650 per square meter. At 12.97 m the slope is the crest slope and the steepening is 0. The shift at the crest radius is 0.78169. The mix crest is 0.38409. At 2.51 m the shift is 1, the slope is 0, and the steepening is 0. At 8.44 m and at 9.72 m the shift is 0.9969 and the slope and the steepening are 0. The 17.12 m page is 0.725 m short of the lip. At 17.12 m the shift is 0.2306, the slope is the crest slope, and the steepening is 0. The 18.07 m page is 0.22628 m past the lip. At 18.07 m the shift is 0.1108, the slope is −0.0791946 per meter, and the steepening is +0.221938 per square meter. The largest |d²S| through the window is 0.252100 per square meter, at 17.845 m. At the window end it is +0.0486330 per square meter, against the book's 0.00634649. The leftover at the window end is 0.09553.

| Speed | Sample | Exact contraction | Type IV | Energy |
| --- | --- | --- | ---: | ---: |
| 0 | dominant 1.604×10⁻⁴ at 23.647 m, clean | −1.356×10⁻⁴, Type I 13,456 | 0 | 2.3822×10²⁷ kg |
| 0.04c | dominant 1.000 at 18.128 m | −2.619, 6,204 cells | 6,204 | 2.3778×10²⁷ kg |
| 0.06c | dominant 1.502 at 18.128 m | −4.020, 6,796 cells | 6,796 | 2.3723×10²⁷ kg |

At 0.06c the side flux over peak is −0.0080 at 2.51 m against density 0.188, +0.0008 at 4.14 m against density 0.335, +0.0111 at 4.32 m against density 0.349, +0.0123 at 4.36 m against density 0.352, −0.0157 at 5.23 m against density 0.403, −0.0218 at 5.35 m against density 0.407, −0.0371 at 5.65 m against density 0.419, −0.0388 at 5.75 m against density 0.423, −0.0380 at 6.14 m against density 0.434, −0.0238 at 6.93 m against density 0.446, −0.0213 at 7.15 m against density 0.448, −0.0207 at 8.44 m against density 0.463, +0.1764 at 9.90 m against density 0.628, +0.6658 at 10.70 m against density 0.717, +0.6868 at 11.13 m against density 0.756, +0.6777 at 11.19 m against density 0.761, +0.5042 at 12.00 m against density 0.809, +0.0959 at 13.30 m against density 0.857, +0.0578 at 15.70 m against density 0.567, +0.0592 at 16.14 m against density 0.493, +0.0755 at 17.12 m against density 0.333, +0.0350 at 17.52 m against density 0.274, −1.6318 at 18.07 m against density 0.206, and −1.1387 at 18.45 m against density 0.165. On the seated rise the exact contraction is −2.534 at 5.349 m, the 5.23 m flux is +1.3667, and the 18.07 m flux is −0.2300. At 0.04c the sample null is 1.308. The exact worst cell is at 18.128 m, place 82.1°, direction 174.3°. The tail is −7.212×10⁻⁴ at 0.04c and −1.099×10⁻³ at 0.06c. At 0.06c the sample null is 2.008, serious fraction 0.0890, and the exact worst cell is at 18.128 m, place 82.1°, direction 174.3°. The exact serious fraction is 0.1112. The balanced crest is not adopted.

## The matched toe

Dated 2026-11-04. Log `data/dial_toe_fan.txt`. Same one-sixth book, same mass, same hydrostatic lapse. The cabin stays at shift 1 and slope 0 through 4.139 m. From 7.151 m to 9.723 m the shift is held flat at 0.89120. The rise leaves that shelf with the bend at 0 and arrives on the density peak at 12.968 m with the slope at the crest slope 0.132691 per meter and the bend at 0. Between the shelf density and the peak density the bend follows that packing. The rise scale is 1.55791×10⁻⁴⁶. The toe turns at one constant bend, equal to that rise's own peak bend, 0.0569011 per square meter. The crest slope holds from 12.968 m to 16.176 m, 3.209 m. The ease runs 2.278 m and lands on the book's own end slope, 0.00306264 per meter. On the cabin, the split stays the radius where the up packing integral matches the down packing integral. The up integral is 1.45307×10⁴³ and the down integral is 1.45329×10⁴³. The cabin scale is 35.54553 times the rise scale, the one value that lands the leftover. The cabin crest is at 5.166 m. The crest bend is 0. The cabin peaks at 0.0804661 per meter, under the crest slope. The cabin bend is 0.118832 per square meter. The 4.32 m page is 0.185 m past the cabin start and 0.842 m short of that crest. At 4.32 m the shift is 0.9995, the slope is −0.00785333 per meter, and the steepening is −0.0787886 per square meter. At 4.50 m the shift is 0.9966, the slope is −0.0258239 per meter, and the steepening is −0.114469 per square meter. At 5.23 m the shift is 0.9516, the slope is −0.0799377 per meter, and the steepening is +0.0159758 per square meter. At 5.35 m the shift is 0.9423, the slope is −0.0765959 per meter, and the steepening is +0.0388246 per square meter. At 7.15 m the slope is −1.89054×10⁻⁸ per meter and the steepening is +3.78785×10⁻⁵ per square meter. The cabin spends 0.10880. The rise spends 0.21531. The arc spends 0.79567. The 10.97 m page is 1.99758 m short of the peak, outside the fourth-order reach of 1.28565 m. At 10.70 m the shift is 0.8789, the slope is −0.0341258 per meter, and the steepening is −0.0553037 per square meter. At 11.13 m the slope is −0.0583990 per meter and the steepening is −0.0558055 per square meter. At 12.00 m the shift is 0.7889, the slope is −0.100126 per meter, and the steepening is −0.0387650 per square meter. At 12.97 m the slope is the crest slope and the steepening is 0. The shift at the crest radius is 0.67596. The mix crest is 0.38409. At 2.51 m the shift is 1, the slope is 0, and the steepening is 0. At 8.44 m and at 9.72 m the shift is 0.8912 and the slope and the steepening are 0. The 17.12 m page is 0.944 m past the lip. At 17.12 m the shift is 0.1503, the slope is −0.0789794 per meter, and the steepening is +0.0569011 per square meter. The 18.07 m page is 1.89469 m past the lip. At 18.07 m the shift is 0.1009, the slope is −0.0249234 per meter, and the steepening is +0.0569011 per square meter. At 18.13 m the shift is 0.0996, the slope is −0.0216231 per meter, and the steepening is +0.0569011 per square meter. The largest |d²S| through the window is 0.118832 per square meter, at 4.594 m. At the window end it is +0.0189823 per square meter, against the book's 0.00634649. The leftover at the window end is 0.09553.

| Speed | Sample | Exact contraction | Type IV | Energy |
| --- | --- | --- | ---: | ---: |
| 0 | dominant 1.604×10⁻⁴ at 23.647 m, clean | −1.356×10⁻⁴, Type I 13,456 | 0 | 2.3822×10²⁷ kg |
| 0.04c | dominant 0.7086 at 4.602 m | −1.625, 6,832 cells | 6,832 | 2.3787×10²⁷ kg |
| 0.06c | dominant 1.079 at 4.602 m | −2.702, 7,504 cells | 7,504 | 2.3743×10²⁷ kg |

At 0.06c the side flux over peak is −0.0080 at 2.51 m against density 0.188, +0.5295 at 4.14 m against density 0.335, +0.9149 at 4.32 m against density 0.349, +0.9636 at 4.36 m against density 0.352, +1.0859 at 4.47 m against density 0.359, +1.1193 at 4.50 m against density 0.361, +1.0262 at 4.91 m against density 0.384, +0.0496 at 5.23 m against density 0.400, −0.1602 at 5.35 m against density 0.405, −0.6837 at 5.65 m against density 0.418, −0.7390 at 5.75 m against density 0.421, −0.6904 at 6.14 m against density 0.433, −0.1617 at 6.93 m against density 0.446, −0.0679 at 7.15 m against density 0.448, −0.0185 at 8.44 m against density 0.464, +0.1794 at 9.90 m against density 0.629, +0.6695 at 10.70 m against density 0.717, +0.6907 at 11.13 m against density 0.756, +0.6815 at 11.19 m against density 0.761, +0.5081 at 12.00 m against density 0.810, +0.0998 at 13.30 m against density 0.857, +0.0719 at 15.70 m against density 0.567, −0.1808 at 16.14 m against density 0.493, −0.5480 at 17.12 m against density 0.337, −0.5566 at 17.52 m against density 0.279, −0.5302 at 18.07 m against density 0.208, −0.5032 at 18.13 m against density 0.201, and −0.3401 at 18.45 m against density 0.165. On the balanced crest the exact contraction is −4.020 at 18.128 m, the 18.07 m flux is −1.6318, and the 4.32 m flux is +0.0111. At 0.04c the sample null is 0.8111. The exact worst cell is at 4.602 m, place 69.8°, direction 15.5°. The tail is −7.213×10⁻⁴ at 0.04c and −1.099×10⁻³ at 0.06c. At 0.06c the sample null is 1.348, serious fraction 0.1415, and the exact worst cell is at 4.602 m, place 110.2°, direction 15.3°. The exact serious fraction is 0.1638. The matched toe is not adopted.

## The one-radius cabin

Dated 2026-11-04. Log `data/dial_radius_fan.txt`. Same one-sixth book, same mass, same hydrostatic lapse. The cabin stays at shift 1 and slope 0 through 4.139 m. From 7.151 m to 9.723 m the shift is held flat at 0.89120. The rise leaves that shelf with the bend at 0 and arrives on the density peak at 12.968 m with the slope at the crest slope 0.132691 per meter and the bend at 0. Between the shelf density and the peak density the bend follows that packing. The rise scale is 1.55791×10⁻⁴⁶. The toe turns at one constant bend, equal to that rise's own peak bend, 0.0569011 per square meter. The crest slope holds from 12.968 m to 16.176 m, 3.209 m. The ease runs 2.278 m and lands on the book's own end slope, 0.00306264 per meter. The cabin turns at that same bend. The length of the turn is the one value that lands the leftover. The turn runs 2.766 m and the cabin crest is at 5.522 m. The cabin peaks at 0.0786771 per meter, under the crest slope. The cabin bend is 0.0569011 per square meter. After the turn the shift is flat for 0.247 m before the shelf. The 4.32 m page is 0.185 m past the cabin start and 1.198 m short of that crest. At 4.32 m the shift is 0.9991, the slope is −0.0103188 per meter, and the steepening is −0.0569011 per square meter. At 4.60 m the shift is 0.9939, the slope is −0.0262511 per meter, and the steepening is −0.0569011 per square meter. At 5.23 m the shift is 0.9661, the slope is −0.0620988 per meter, and the steepening is −0.0569011 per square meter. At 5.35 m the shift is 0.9583, the slope is −0.0688700 per meter, and the steepening is −0.0569011 per square meter. At 5.52 m the shift is 0.9457, the slope is −0.0786001 per meter, and the steepening is −0.0569011 per square meter. The steepening changes sign between 5.52 m and 5.65 m, from −0.0569011 to +0.0569011 per square meter. At 6.14 m the shift is 0.9078, the slope is −0.0434836 per meter, and the steepening is +0.0569011 per square meter. At 6.93 m and at 7.15 m the shift is 0.8912, the slope is 0, and the steepening is 0. The cabin spends 0.10880. The rise spends 0.21531. The arc spends 0.79567. The 5.031 m cell is 0.491 m short of the cabin crest, still on the rising half. The fourth-order reach is 1.28565 m. The 10.97 m page is 1.99758 m short of the density peak, outside that reach. At 10.70 m the shift is 0.8789, the slope is −0.0341258 per meter, and the steepening is −0.0553037 per square meter. At 11.13 m the slope is −0.0583990 per meter and the steepening is −0.0558055 per square meter. At 12.00 m the shift is 0.7889, the slope is −0.100126 per meter, and the steepening is −0.0387650 per square meter. At 12.97 m the slope is the crest slope and the steepening is 0. The shift at the crest radius is 0.67596. The mix crest is 0.38409. At 2.51 m the shift is 1, the slope is 0, and the steepening is 0. At 8.44 m and at 9.72 m the shift is 0.8912 and the slope and the steepening are 0. The 17.12 m page is 0.944 m past the lip. At 17.12 m the shift is 0.1503, the slope is −0.0789794 per meter, and the steepening is +0.0569011 per square meter. The 18.07 m page is 1.89469 m past the lip. At 18.07 m the shift is 0.1009, the slope is −0.0249234 per meter, and the steepening is +0.0569011 per square meter. At 18.13 m the shift is 0.0996, the slope is −0.0216231 per meter, and the steepening is +0.0569011 per square meter. The largest |d²S| through the window is 0.0569011 per square meter, at 4.177 m, the start of that constant cabin bend. At the window end it is +0.0189823 per square meter, against the book's 0.00634649. The leftover at the window end is 0.09553.

| Speed | Sample | Exact contraction | Type IV | Energy |
| --- | --- | --- | ---: | ---: |
| 0 | dominant 1.604×10⁻⁴ at 23.647 m, clean | −1.356×10⁻⁴, Type I 13,456 | 0 | 2.3822×10²⁷ kg |
| 0.04c | dominant 0.4081 at 5.031 m | −0.7483, 6,852 cells | 6,852 | 2.3787×10²⁷ kg |
| 0.06c | dominant 0.6300 at 5.031 m | −1.373, 7,544 cells | 7,544 | 2.3743×10²⁷ kg |

At 0.06c the side flux over peak is −0.0080 at 2.51 m against density 0.188, +0.3882 at 4.14 m against density 0.335, +0.6425 at 4.32 m against density 0.349, +0.6621 at 4.36 m against density 0.352, +0.7043 at 4.47 m against density 0.359, +0.7158 at 4.50 m against density 0.361, +0.7541 at 4.60 m against density 0.367, +0.8275 at 4.91 m against density 0.385, +0.8399 at 5.23 m against density 0.401, +0.5321 at 5.35 m against density 0.406, +0.0813 at 5.52 m against density 0.412, −0.2614 at 5.65 m against density 0.418, −0.4020 at 5.75 m against density 0.421, −0.6762 at 6.14 m against density 0.433, −0.2991 at 6.93 m against density 0.446, −0.1213 at 7.15 m against density 0.448, −0.0185 at 8.44 m against density 0.464, +0.1794 at 9.90 m against density 0.629, +0.6695 at 10.70 m against density 0.717, +0.6907 at 11.13 m against density 0.756, +0.6815 at 11.19 m against density 0.761, +0.5081 at 12.00 m against density 0.810, +0.0998 at 13.30 m against density 0.857, +0.0719 at 15.70 m against density 0.567, −0.1808 at 16.14 m against density 0.493, −0.5480 at 17.12 m against density 0.337, −0.5566 at 17.52 m against density 0.279, −0.5302 at 18.07 m against density 0.208, −0.5032 at 18.13 m against density 0.201, and −0.3401 at 18.45 m against density 0.165. On the matched toe the exact contraction is −2.702 at 4.602 m, the 4.50 m flux is +1.1193, and the 18.07 m flux is −0.5302. At 0.04c the sample null is 0.3724. The exact worst cell is at 5.031 m, place 108.4°, direction 13.7°. The tail is −7.213×10⁻⁴ at 0.04c and −1.099×10⁻³ at 0.06c. At 0.06c the sample null is 0.6835, serious fraction 0.1443, and the exact worst cell is at 5.031 m, place 108.4°, direction 13.6°. The exact serious fraction is 0.1668. The one-radius cabin is not adopted.

## The straight climb

Dated 2026-11-04. Log `data/dial_straight_fan.txt`. Same one-sixth book, same mass, same hydrostatic lapse. The cabin stays at shift 1 and slope 0 through 4.139 m. From 7.151 m to 9.723 m the shift is held flat at 0.89120. The rise leaves that shelf with the bend at 0 and arrives on the density peak at 12.968 m with the slope at the crest slope 0.132691 per meter and the bend at 0. Between the shelf density and the peak density the bend follows that packing. The rise scale is 1.55791×10⁻⁴⁶. The toe turns at one constant bend, equal to that rise's own peak bend, 0.0569011 per square meter. The crest slope holds from 12.968 m to 16.176 m, 3.209 m. The ease runs 2.278 m and lands on the book's own end slope, 0.00306264 per meter. The cabin rises at one bend until the 5.031 m cell, holds that slope straight, and recovers over the same length at the same bend. The bend is the one value that lands the leftover. The rise runs 0.893 m. The straight hold runs 1.227 m. The recovery runs 0.893 m. The hold slope is 0.0513267 per meter. The cabin bend is 0.0575082 per square meter. The 4.32 m page is 0.185 m past the cabin start and 0.707 m short of the straight run. At 4.32 m the shift is 0.9991, the slope is −0.0104289 per meter, and the steepening is −0.0575082 per square meter. At 4.60 m the shift is 0.9939, the slope is −0.0265312 per meter, and the steepening is −0.0575082 per square meter. At 5.03 m the shift is 0.9771, the slope is −0.0513154 per meter, and the steepening is −0.0391330 per square meter. At 5.23 m the shift is 0.9669, the slope is −0.0513267 per meter, and the steepening is 0. At 5.52 m the shift is 0.9520, the slope is −0.0513267 per meter, and the steepening is 0. At 6.14 m the shift is 0.9202, the slope is −0.0513267 per meter, and the steepening is 0. At 6.26 m the shift is 0.9140, the slope is −0.0512329 per meter, and the steepening is +0.0575082 per square meter. At 6.93 m the shift is 0.8926, the slope is −0.0127024 per meter, and the steepening is +0.0575082 per square meter. At 7.15 m the shift is 0.8912, the slope is −5.06238×10⁻⁵ per meter, and the steepening is +0.0575082 per square meter. The cabin spends 0.10880. The rise spends 0.21531. The arc spends 0.79567. The 4.602 m cell is 0.429 m short of the straight run, still on the rising bend. The fourth-order reach is 1.28565 m. The 10.97 m page is 1.99758 m short of the density peak, outside that reach. At 10.70 m the shift is 0.8789, the slope is −0.0341258 per meter, and the steepening is −0.0553037 per square meter. At 11.13 m the slope is −0.0583990 per meter and the steepening is −0.0558055 per square meter. At 12.00 m the shift is 0.7889, the slope is −0.100126 per meter, and the steepening is −0.0387650 per square meter. At 12.97 m the slope is the crest slope and the steepening is 0. The shift at the crest radius is 0.67596. The mix crest is 0.38409. At 2.51 m the shift is 1, the slope is 0, and the steepening is 0. At 8.44 m and at 9.72 m the shift is 0.8912 and the slope and the steepening are 0. The 17.12 m page is 0.944 m past the lip. At 17.12 m the shift is 0.1503, the slope is −0.0789794 per meter, and the steepening is +0.0569011 per square meter. The 18.07 m page is 1.89469 m past the lip. At 18.07 m the shift is 0.1009, the slope is −0.0249234 per meter, and the steepening is +0.0569011 per square meter. At 18.13 m the shift is 0.0996, the slope is −0.0216231 per meter, and the steepening is +0.0569011 per square meter. The largest |d²S| through the window is 0.0575082 per square meter, at 4.630 m, on that rising bend. At the window end it is +0.0189823 per square meter, against the book's 0.00634649. The leftover at the window end is 0.09553.

| Speed | Sample | Exact contraction | Type IV | Energy |
| --- | --- | --- | ---: | ---: |
| 0 | dominant 1.604×10⁻⁴ at 23.647 m, clean | −1.356×10⁻⁴, Type I 13,456 | 0 | 2.3822×10²⁷ kg |
| 0.04c | dominant 0.3861 at 4.602 m | −0.7099, 6,748 cells | 6,748 | 2.3787×10²⁷ kg |
| 0.06c | dominant 0.5987 at 4.602 m | −1.301, 7,424 cells | 7,424 | 2.3743×10²⁷ kg |

At 0.06c the side flux over peak is −0.0080 at 2.51 m against density 0.188, +0.3961 at 4.14 m against density 0.335, +0.6554 at 4.32 m against density 0.349, +0.6717 at 4.36 m against density 0.352, +0.7031 at 4.47 m against density 0.359, +0.7117 at 4.50 m against density 0.361, +0.7403 at 4.60 m against density 0.367, +0.6147 at 4.91 m against density 0.385, +0.4529 at 5.03 m against density 0.392, +0.1866 at 5.23 m against density 0.402, +0.1628 at 5.35 m against density 0.406, +0.1322 at 5.52 m against density 0.413, +0.1089 at 5.65 m against density 0.418, +0.0757 at 5.75 m against density 0.422, −0.0878 at 6.14 m against density 0.433, −0.2533 at 6.26 m against density 0.435, −0.5844 at 6.93 m against density 0.446, −0.4174 at 7.15 m against density 0.448, −0.0185 at 8.44 m against density 0.464, +0.1794 at 9.90 m against density 0.629, +0.6695 at 10.70 m against density 0.717, +0.6907 at 11.13 m against density 0.756, +0.6815 at 11.19 m against density 0.761, +0.5081 at 12.00 m against density 0.810, +0.0998 at 13.30 m against density 0.857, +0.0719 at 15.70 m against density 0.567, −0.1808 at 16.14 m against density 0.493, −0.5480 at 17.12 m against density 0.337, −0.5566 at 17.52 m against density 0.279, −0.5302 at 18.07 m against density 0.208, −0.5032 at 18.13 m against density 0.201, and −0.3401 at 18.45 m against density 0.165. On the one-radius cabin the exact contraction is −1.373 at 5.031 m, the 5.23 m flux is +0.8399, and the 18.07 m flux is −0.5302. At 0.04c the sample null is 0.3543. The exact worst cell is at 4.602 m, place 110.2°, direction 16.8°. The tail is −7.213×10⁻⁴ at 0.04c and −1.099×10⁻³ at 0.06c. At 0.06c the sample null is 0.6492, serious fraction 0.1353, and the exact worst cell is at 4.602 m, place 110.2°, direction 16.5°. The exact serious fraction is 0.1576. The straight climb is not adopted.
