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

Dated 2026-11-09. The table is a straight accel and a stop across 384,400 km. The wells are left out. Thrust is 2P/c. Hover against one g on 10 tonnes is 14.7 TW. The 15 TW row is 1.02 g. Every weaker row stays on the pad. From a 200 km orbit the spiral to a circular orbit at the Moon's distance is the difference of the circular speeds, 6.770 km/s. A perfect reflector spends ½mcΔv on that leg, 1.015×10¹⁶ J for 10 tonnes, at any power. At 1 GW the spiral takes 117 days. At 10 GW, 11.7 days. At 100 GW, 28.2 hours. At 1 TW, 2.82 hours. At 15 TW, 11.3 minutes. The straight 1 GW profile budgets 1.01 km/s and 1.52×10¹⁵ J, short of this spiral. A soft landing that removes the Moon's escape speed, 2.376 km/s, adds 3.56×10¹⁵ J. At 100 W per kilogram of station, 100 GW is 1.0×10⁶ tonnes on the ground. This is kinematics. It is not a Warp Factory grid.

Dated 2026-11-09. The same reflector and the same 10 tonnes, from the same 200 km orbit. Another planet is three differences of circular speed. The circular speed at infinity is zero, so leaving that orbit costs the whole 7.788 km/s. The solar leg is the difference of the circular speeds on the two semimajor axes. Capture is a circular orbit 200 km above the destination. Mars uses the volumetric mean radius, 3,389.5 km. Jupiter and Neptune use the equatorial 1-bar radius, 71,492 km and 24,764 km, so the orbit clears the limb. The semimajor axes are 227.956, 778.479, and 4,514.953 million km, against Earth's 149.598 million km. The solar gravitational parameter is 1.32712440018×10²⁰ m³/s². Rotation is left out of the capture speed. The spiral times are the beam time for that speed change. Power changes the time. Energy stays ½mcΔv.

| Leg | Mars | Jupiter | Neptune |
| --- | ---: | ---: | ---: |
| Solar spiral | 5.656 km/s | 16.728 km/s | 24.363 km/s |
| Capture, 200 km | 3.454 km/s | 42.037 km/s | 16.547 km/s |
| Stack with the 7.788 km/s departure | 16.898 km/s | 66.553 km/s | 48.698 km/s |
| Energy, 10 tonnes | 2.533×10¹⁶ J | 9.976×10¹⁶ J | 7.300×10¹⁶ J |
| 1 GW | 293 days | 1155 days | 845 days |
| 10 GW | 29.3 days | 115.5 days | 84.5 days |
| 100 GW | 70.4 hours | 11.5 days | 8.45 days |
| 1 TW | 7.04 hours | 27.7 hours | 20.3 hours |
| 15 TW | 28.1 minutes | 1.85 hours | 1.35 hours |

Jupiter's capture is the large term. Neptune is farther, and the stack is smaller. A return to the 200 km Earth orbit spends the stack again. Setting down on Mars removes the escape speed, 5.027 km/s, in place of the 3.454 km/s capture. That stack is 18.471 km/s and 2.769×10¹⁶ J. The Jupiter and Neptune stops are the capture orbits. The straight Earth–Moon 1 GW budget, 1.52×10¹⁵ J, is short of all three. From the same 200 km orbit the 0.25 g film takes 1.91 hours to the Mars orbit, 7.54 hours to the Jupiter orbit, and 5.52 hours to the Neptune orbit.

A straight accel and a stop across the circular-orbit separation leaves the wells out and finishes at rest in the frame of Earth's orbit. The separations are 0.524 AU, 4.20 AU, and 29.2 AU. On that chord the time scales as 1/√power and the peak speed scales as √power. At 100 GW the peaks are 72.3 km/s, 205 km/s, and 540 km/s, and the trips are 25.1 days, 71.1 days, and 187 days. Thrust on 10 tonnes equals the Sun's gravity at Earth's orbit at 8.89 GW. The 1 GW row is under that pull. The 10 GW row is 1.12 times that pull. Solar escape from Earth's orbit is 42.1 km/s. The 100 GW Mars peak, the 10 GW Jupiter peak, and the 1 GW Neptune peak are already above it.

Already on the clean coast, the hold across that separation is the separation divided by the coast speed. At 0.04c the holds are 1.82 hours, 14.6 hours, and 4.21 days. At 0.10c they are 43.6 minutes, 5.83 hours, and 1.69 days. The light clean shell remains the one-sixth window at 0.04c. The 0.10c shell remains compactness 1/2. This is kinematics. It is not a Warp Factory grid.

Dated 2026-11-09. The same reflector and the same 10 tonnes. A short burn in the 200 km orbit, on the Hohmann excess, replaces the slow crawl. The departure burn is the speed that raises the low-orbit circle onto the transfer hyperbola. The arrival burn circularizes 200 km above the destination. The coasts are the half-periods of those ellipses. The beam times are the time spent on the two burns. Energy stays ½mcΔv.

| Leg | Mars | Jupiter | Neptune |
| --- | ---: | ---: | ---: |
| Departure burn | 3.613 km/s | 6.306 km/s | 8.249 km/s |
| Arrival burn, 200 km | 2.103 km/s | 17.679 km/s | 7.202 km/s |
| Stack | 5.716 km/s | 23.985 km/s | 15.451 km/s |
| Energy, 10 tonnes | 8.57×10¹⁵ J | 3.595×10¹⁶ J | 2.316×10¹⁶ J |
| Coast | 259 days | 998 days | 11,242 days |
| 1 GW | 99.2 days | 416 days | 268 days |
| 10 GW | 9.92 days | 41.6 days | 26.8 days |
| 100 GW | 23.8 hours | 4.16 days | 2.68 days |
| 1 TW | 2.38 hours | 9.99 hours | 6.43 hours |
| 15 TW | 9.52 minutes | 39.9 minutes | 25.7 minutes |

A 200 km orbit lasts 88 minutes. At 15 TW the departure burns run 6.0 minutes, 10.5 minutes, and 13.7 minutes. A return spends the stack again. Setting down on Mars removes 5.682 km/s at the surface in place of the 2.103 km/s capture. That stack is 9.295 km/s and 1.393×10¹⁶ J. The 0.25 g film spends 38.9 minutes, 2.72 hours, and 1.75 hours on these burns.

Callisto orbits at 1,882,700 km. A spiral capture there is 8.203 km/s. With the 7.788 km/s departure and the 16.728 km/s solar leg the stack is 32.719 km/s and 4.905×10¹⁶ J. The short burn at that distance is 4.698 km/s on top of the 6.306 km/s Earth departure, 11.004 km/s and 1.649×10¹⁶ J. Triton orbits at 354,760 km. The spiral capture is 4.389 km/s and the stack is 36.540 km/s, 5.477×10¹⁶ J. The short burn is 3.022 km/s on top of the 8.249 km/s departure, 11.271 km/s and 1.689×10¹⁶ J. Those coasts stay 998 days and 11,242 days.

At 1 TW the spiral beam moves the ship 214,000 km, 3.32 million km, and 1.78 million km. The powered crossing of the same gaps takes 7.93 days, 22.5 days, and 59.2 days, with peaks 229 km/s, 648 km/s, and 1,710 km/s. This is kinematics. It is not a Warp Factory grid.

Dated 2026-11-09. The same reflector and the same 10 tonnes. The short-burn coast is the long clock. The quicker trip keeps the beam on across the gap. Thrust is along the sun-planet line. The ship leaves a 200 km orbit onto Earth's path with a 3.226 km/s burn, crosses, and arrives with Earth's tangential speed. The arrival burn then matches the planet at 200 km. Gravity in that low orbit is 9.23 m/s². Matching it takes 13.8 TW. The 15 TW departure runs 5.4 minutes. Trip time scales as 1/√power.

| Leg | Mars | Jupiter | Neptune |
| --- | ---: | ---: | ---: |
| Arrival burn | 4.019 km/s | 19.721 km/s | 17.234 km/s |
| 100 GW trip | 26.3 days | 75.1 days | 191 days |
| 100 GW energy | 2.276×10¹⁷ J | 6.485×10¹⁷ J | 1.649×10¹⁸ J |
| 1 TW trip | 8.06 days | 22.9 days | 59.6 days |
| 1 TW energy | 6.963×10¹⁷ J | 1.976×10¹⁸ J | 5.147×10¹⁸ J |
| 15 TW trip | 2.06 days | 5.83 days | 15.3 days |
| 15 TW energy | 2.666×10¹⁸ J | 7.555×10¹⁸ J | 1.985×10¹⁹ J |
| 1 TW peak | 229 km/s | 648 km/s | 1,710 km/s |
| 15 TW peak | 886 km/s | 2,509 km/s | 6,609 km/s |

The beam stays on for the crossing. At Jupiter, the same arrival at Callisto's distance is 12.154 km/s. A one-day Mars crossing on 10 tonnes is 4.28 g and 63 TW. The 0.25 g film, from Earth's orbit, crosses in 4.14 days, 11.7 days, and 30.9 days, with peaks 438 km/s, 1,242 km/s, and 3,271 km/s.

A parabola with its perihelion on Earth's orbit is the quicker coast. The flight from Earth's radius to the planet's radius is 69.9 days, 405 days, and 4,764 days. The departure from the 200 km orbit is 8.750 km/s. The arrivals are 17.437 km/s, 19.884 km/s, and 8.366 km/s. The stacks are 26.188 km/s, 28.635 km/s, and 17.116 km/s. The energies are 3.925×10¹⁶ J, 4.292×10¹⁶ J, and 2.566×10¹⁶ J. This is kinematics. It is not a Warp Factory grid.

Dated 2026-11-09. The same reflector and the same 10 tonnes. The outward push is the home beam. The stop is that power turned around at the destination. With the beam behind the ship the proper acceleration is (2P/(mc))(1−β)/(1+β). With the return beam ahead of the ship it is (2P/(mc))(1+β)/(1−β). Through 15 TW the printed trips stay in place. The 15 TW Neptune peak is 6,607 km/s.

The 63 TW plant is the one-day Mars crossing. On that plant the total trips are 1.00 day, 2.84 days, and 7.47 days. The peaks are 1,814 km/s, 5,137 km/s, and 13,514 km/s. The energies are 5.449×10¹⁸ J, 1.544×10¹⁹ J, and 4.064×10¹⁹ J.

| Leg | Mars | Jupiter | Neptune |
| --- | ---: | ---: | ---: |
| One-day power | 63 TW | 507 TW | 3,745 TW |
| One-day acceleration | 4.28 g | 34.5 g | 255 g |
| One-day peak | 1,814 km/s | 14,549 km/s | 95,218 km/s |
| One-day energy | 5.449×10¹⁸ J | 4.377×10¹⁹ J | 3.236×10²⁰ J |

On the Neptune day the ship reaches 0.318c. The outward push covers 0.71 of that gap, and the ship clock reads 0.981 day. At 100 W per kilogram of station, 63 TW is 6.3×10⁸ tonnes, 507 TW is 5.07×10⁹ tonnes, and 3,745 TW is 3.75×10¹⁰ tonnes. This is kinematics. It is not a Warp Factory grid.

Reaching 0.04c on a sail is 1.80×10¹⁹ J. A 15 TW beam takes 14 days and 48 AU. At 1 µm a 100 m sail needs a 3.8 m aperture at the Moon and a 73 km aperture at 49 AU.

Heat: both faces radiate, absorbed intensity equals 2 ε σ T⁴, and the spot is kept the size of the sail. Film 10 g/m², absorption 0.001, emissivity 0.5, 600 K, intensity 7.35×10⁶ W/m². A 10 tonne sheet is 1.13 km across. Plus 10 tonnes of ship: 0.25 g on 7.35 TW, peak 30.7 km/s, 7.0 hours, lunar aperture 0.34 m. That film stays on the pad. From a 200 km orbit its spiral takes 46 minutes and 2.030×10¹⁶ J. Both beams deliver 1.84×10¹⁷ J. Station hardware at 100 W/kg is 7.3×10⁷ tonnes; at 10 W/kg it is 7.3×10⁸ tonnes, on the ground. The same film at 1200 K is 4 g, 1.18×10¹⁴ W, peak 123 km/s, 1.7 hours. One g at 600 K on this loading, with the same 2E/c, would need absorption 2.50×10⁻⁴. That is a material target, not a measured sail. This section is not an energy-condition score. The Eulerian light shell remains the one-sixth bend window at 0.04c.

Dated 2026-11-09. The same 1 µm line. Spot diameter is wavelength times range over aperture diameter, the same line as the 3.8 m lunar aperture and the 73 km aperture at 49 AU. The aperture that puts the spot on the sail at the far end of the gap is 784 m, 6.29 km, and 43.7 km for the 100 m sail, and 69.4 m, 557 m, and 3.87 km for the 1.13 km sheet. The light time across those gaps is 4.36 minutes, 35.0 minutes, and 4.04 hours. Holding the spot on the sheet takes 3.0 milliarcseconds, 0.37 milliarcseconds, and 0.053 milliarcseconds. On the 100 m sail those angles are 0.26, 0.033, and 0.0047 milliarcseconds. A larger aperture makes a smaller spot. At half the range that tight spot is half the sail, the intensity is four times the even value, and the temperature is 1.41 times the even value.

The published sheet, absorption 0.001 and emissivity 0.5, with both faces radiating, runs at 364 K on 1 TW, 717 K on 15 TW, 1,026 K on the 63 TW plant, 1,729 K on 507 TW, and 2,851 K on 3,745 TW. The absorption that holds that same sheet at 600 K is 7.35×10⁻³, 4.90×10⁻⁴, 1.17×10⁻⁴, 1.45×10⁻⁵, and 1.96×10⁻⁶. The 2.50×10⁻⁴ figure remains the 1 g target on the 20 tonne loading. The 63 TW sheet is 10 tonnes of film at 4.28 g, and the absorption that holds it at 600 K is 1.17×10⁻⁴. A 100 m sail of the same film is 79 kg. At absorption 0.001 it runs at 1,224 K on 1 TW, 2,409 K on 15 TW, 3,448 K on 63 TW, 5,808 K on 507 TW, and 9,576 K on 3,745 TW.

The stop is a mirror at the destination. A mirror matched to the sail at half the gap is 392 m, 3.14 km, and 21.8 km for the 100 m sail, and 34.7 m, 279 m, and 1.93 km for the sheet. The feed that lights a matched mirror is twice the sail, 200 m or 2.26 km. The home optic is the larger of that feed and the far-end aperture: 784 m, 6.29 km, and 43.7 km for the 100 m sail, and 2.26 km, 2.26 km, and 3.87 km for the sheet. On the Neptune day the brake covers 0.29 of the gap, and the matched sheet mirror is 1.12 km. The half-gap mirror is the case that matches the trips from 1 TW through the 63 TW plant.

A destination mirror the size of the sail, lit by a home aperture of that same size, puts a spot on the destination equal to those matched-mirror diameters. The 100 m sail catches 6.5%, 0.10%, and 0.002% of the return. On the sheet the Mars spot is inside the sheet. The power concentrates 1,060 times and the temperature rises by a factor 5.7, about 5,850 K against the 63 TW even temperature of 1,026 K. At Jupiter the concentration is 16.4 and the temperature rises by a factor 2.01, about 2,070 K. At Neptune the sheet catches 34% of the return.

Dust at 1 AU follows Grün et al., Icarus 62, 244–272 (1985). The cumulative flux on one side of a randomly tumbling plate, inverted with the model's 20 km/s mean speed through Φ = ρ v / 4, gives 9.62×10⁻¹⁷ g/m³. That sits on the paper's figure of about 10⁻¹⁶ g/m³. The mass peaks at a grain of 6.7×10⁻⁶ g. Grains from 10⁻⁶ g to 10⁻⁴ g hold 45% of the mass. The model domain is the cloud around 1 AU, which is the Mars gap and the start of the longer trips.

At that density the sheet sweeps 7.54 g across the Mars gap. 5.10×10⁵ grains at the peak mass make up the 45%. The 100 m sail sweeps 0.059 g. One peak-mass grain at the booked peaks carries the kinetic energy below. The Jupiter and Neptune entries are that grain at the booked speed. The 7.54 g column is the Mars gap.

| Peak | Mars | Jupiter | Neptune |
| --- | ---: | ---: | ---: |
| 1 TW | 176 J | 1,410 J | 9,790 J |
| 15 TW | 2,630 J | 2.11×10⁴ J | 1.46×10⁵ J |
| 63 TW plant | 1.10×10⁴ J | 8.84×10⁴ J | 6.12×10⁵ J |

At the one-day Jupiter peak the same grain carries 7.10×10⁵ J. At the Neptune-day peak it carries 3.29×10⁷ J. If the whole 7.54 g met the sheet at the 63 TW Mars peak, the kinetic energy is 1.24×10¹⁰ J. The ship is at that speed at mid-gap.

Outside about 3 AU, Ulysses and Galileo counted interstellar grains from 10⁻¹⁴ g to 10⁻¹² g at a flux of 1.5×10⁻⁴ m⁻² s⁻¹ (Grün, Landgraf, and co-workers). A 10⁻¹² g grain at the 63 TW Neptune speed carries 0.09 J. At 0.318c it carries 4.9 J. The heavy grains are the 1 AU cloud.

This is kinematics and a dust column. It is not a Warp Factory grid. The Eulerian light shell remains the one-sixth bend window at 0.04c.

Dated 2026-11-09. The same three coasts, and the same 10 tonne reflector. Hohmann and the parabola are the coasts already printed. The powered rows are the total trips, the crossing plus the two burns.

| Shell | Mass | Clean | Breaks |
| --- | ---: | ---: | ---: |
| Condensate body, 9.81 km | 3.303×10³⁰ kg | 0.10c | 0.11c, outer wall near 7.7 km |
| Half-compact wall, 20 m | 6.73×10²⁷ kg, 3.55 Jupiter | 0.10c | 0.11c at 15.7 m |
| One-sixth window, 20 m | 2.244×10²⁷ kg, 1.182 Jupiter | 0.04c | 0.06c at 16.14 m |

The late tent stays the failed drawing of that light window. It breaks at 5.46 m.

| Path | Mars | Jupiter | Neptune | Mars energy | Jupiter energy | Neptune energy |
| --- | ---: | ---: | ---: | ---: | ---: | ---: |
| Hohmann coast | 259 days | 998 days | 11,242 days | 8.57×10¹⁵ J | 3.595×10¹⁶ J | 2.316×10¹⁶ J |
| Parabola | 69.9 days | 405 days | 4,764 days | 3.925×10¹⁶ J | 4.292×10¹⁶ J | 2.566×10¹⁶ J |
| 1 TW | 8.06 days | 22.9 days | 59.6 days | 6.963×10¹⁷ J | 1.976×10¹⁸ J | 5.147×10¹⁸ J |
| 15 TW | 2.06 days | 5.83 days | 15.3 days | 2.666×10¹⁸ J | 7.555×10¹⁸ J | 1.985×10¹⁹ J |
| 63 TW plant | 1.00 day | 2.84 days | 7.47 days | 5.449×10¹⁸ J | 1.544×10¹⁹ J | 4.064×10¹⁹ J |
| One-day plant | 1.00 day, 63 TW | 1.00 day, 507 TW | 1.00 day, 3,745 TW | 5.449×10¹⁸ J | 4.377×10¹⁹ J | 3.236×10²⁰ J |

The sheet's matched return mirror has to be on station before the fast ship leaves. On the parabola that delivery is 69.9 days for the 34.7 m Mars mirror, 405 days for the 279 m Jupiter mirror, and 4,764 days for the 1.93 km Neptune mirror. The Hohmann coasts are the slower delivery, 259 days, 998 days, and 11,242 days. The sheet subtends 3.0, 0.37, and 0.053 milliarcseconds. Earth's rotation moves the sky at 15 arcseconds a second. Dividing that rate by those angles, one untracked second on the ground walks the beam by 5,000 sheet-widths at Mars, 4.05×10⁴ at Jupiter, and 2.83×10⁵ at Neptune. The optic takes that motion out and leaves the residual inside the milliarcsecond. The 5.10×10⁵ peak-mass grains on the sheet are 0.51 grains on each square metre across the Mars gap. The same column is 0.51 per square metre on the 100 m sail. At the 63 TW Mars peak each of those grains carries 1.10×10⁴ J. This is kinematics. It is not a Warp Factory grid. The Eulerian light shell remains the one-sixth bend window at 0.04c.

## Gate to gate, 2026-11-09

Parent repository [fsot-warp-shell](https://github.com/dappalumbo91/fsot-warp-shell) at `5a3f912`. Two mouths. A mouth has to exist at each end before a crossing. On the parent parabola the sheet's matched mirror arrives in 69.9 days, 405 days, and 4,764 days. A parked curvature shell used as a mouth carries the parent mass, 1.182 Jupiter or 3.55 Jupiter, and two mouths are two of those masses.

The candidate coupling is a shared quantum state. A shared entangled state correlates the outcomes at the two ends. It does not by itself carry a signal, a mass, or a ship. Maldacena and Susskind, Fortschr. Phys. 61 (2013) 781, arXiv:1306.0533, is the citation that relates entanglement to a wormhole. It is not adopted. No wormhole solver is started. No entanglement factor is pasted onto the shell or the sail. The open question is what the two mouths have to share, besides the name of a state, for a scored transit to exist. The one-way call is the next section. This opening is not a Warp Factory grid. The light clean shell remains the one-sixth window at 0.04c.

## One-way funnel, 2026-11-09

The vessel stays out of this score. A parked curvature shell used as a mouth remains the parent mass, 1.182 Jupiter or 3.55 Jupiter. This page leaves that mass where the opening put it. The two mouths are the two ends of one conduit, and the direction is supposed to follow which side opens the call. The pin is FSOT 2.1 AEB2AD, read from `vendor/fsot_dynamics.py` and `vendor/fsot_complex_interaction.py`. The chain is in [METHOD.md](METHOD.md).

| Reading | Value |
| --- | ---: |
| Particle Physics D, Quantum Mechanics D | 5, 5 |
| Fluid Dynamics D | 12 |
| Cosmology D | 25 |
| Scale distance at the fluid, \|D − 25\|/25 | 0.52 |
| Viscosity at D = 12 | 0.33282440671611235 |
| Scale piece of that viscosity | 0.17213257495745055 |
| Bleed piece of that viscosity | 0.16069183175866183 |
| Bleed rate, POOF + SUCTION | 0.30051620032255366 |
| Yin-yang fraction | 0.510728588773961 |
| Transport κ | 0.3146325373020798 |
| Relaxation γ | 0.4280434460598068 |
| Relaxation length | 0.8573494832025231 |
| Fluid–cosmology suppressor | 0.6578947368421053 |
| Same suppressor, depths swapped | 0.6578947368421053 |
| Quantum–cosmology suppressor | 0.5555555555555556 |
| Adjacency asymmetry | 0 |
| GR–EW coupling, both orders | 0.0426152645973651 |
| Observer source on the dark fluid | 0 |
| Sound speed squared at ρ = 1 | 0.5919208298447349 |
| Acoustic factor at ρ = 1 | 0.7693639124918291 |
| de Broglie factor at p = 1, ħ = 1 | 1.1458384123083372 |

The viscosity is the shell's viscosity, reprinted. The relaxation length is the shell's wall thickness, reprinted. Neither number is a throat radius. The scale distance is a magnitude. Swapping the two depths leaves the suppressor on the same value. The adjacency matrix is symmetric, and the GR–EW entry is the same in both orders. The yin-yang valve is one fraction. With a unit gradient and zero curvature, the scalar transport right-hand side equals minus the velocity, and the bleed coefficients stay put when that velocity changes sign. The velocity is a fluid state. Fluid Dynamics is a dark medium, so the observer source on that fold is 0. The acoustic factor is the square root of the sound speed squared at unit density.

Gao, Jafferis, and Wall, JHEP 12 (2017) 151, arXiv:1608.05687, couple the two boundaries of an eternal BTZ black hole by

δS = ∫ dt d^{d−1}x h(t, x) O_R(t, x) O_L(−t, x).

Both boundaries are already in the shared state. h has support only after a turn-on time t₀. An appropriate sign of that coupling opens the bridge. A deformation of only one boundary Hamiltonian leaves it closed. The paper states that the window cannot be used to violate causality, and it identifies the passage with a teleportation protocol. Bahiru, JHEP 11 (2026) 051, published 5 November 2026, computes the effect registered on one boundary by a unitary on the other, inside that protocol. h is absent from the pin. No value of it is pasted on. Neither paper is adopted.

The pin contains no tunneling amplitude. `qm_de_broglie_scale` returns a length, (1/p) times (1 + |S_QM| · POOF), and at unit momentum that factor is 1.1458384123083372. Quantum Mechanics is generation 1 of the nest and its depth rounds to 5. Chakrabarti and Singha, arXiv:2411.09236, version 4 of 4 March 2025, obtain a two-way or a one-way throat according to free parameter ranges. Those ranges are left alone. Morris and Thorne, Am. J. Phys. 56, 395 (1988), require an energy-condition violation for flare-out at a throat. Friedman, Schleich, and Witt, Phys. Rev. Lett. 71, 1486 (1993), show that a globally hyperbolic, asymptotically flat spacetime satisfying the null energy condition hides its topology from a causal curve that runs from past null infinity to future null infinity. No shape function is introduced. No throat radius is introduced. No wormhole metric is scored. This page is not a Warp Factory grid, not a built gate, and not a faster-than-light channel. The light clean shell remains the one-sixth window at 0.04c. The two-mouth call is the next section.

## The call, 2026-11-09

Two mouths. The vessel stays out. The coupling is `kappa_domains` and the relaxation rate is the funnel page's γ, 0.4280434460598068. The step the vendor uses when it integrates a coupled system is POOF · SUCTION = 0.022567101748263627, and the vendor step count is round(1/POOF) = 7, a pin time of 0.1579697122378454. Pin time is the time in that scalar law. The chain is in [METHOD.md](METHOD.md).

| Reading | Value |
| --- | ---: |
| Quantum scalar, and the particle scalar | 0.9501974701670142 |
| Fluid scalar | −0.6179071388700196 |
| Cosmology scalar | −0.5023773181761478 |
| κ, two quantum mouths | 0.1450846749297095 |
| Far-mouth fraction, two quantum mouths | 0.09414684910198232 |
| Pin time of that peak | 1.7835832717000715 |
| Euler peak on the pin step | 0.09473377563036962 |
| Relative gap of that Euler peak | 0.006234160080615503 |
| Far-mouth fraction at the vendor's seven steps | 0.020936964617341736 |
| κ, two fluid mouths | 0.06135362491527767 |
| Far-mouth fraction, two fluid mouths | 0.04624101801466985 |
| Pin time of the fluid peak | 2.0541373850879614 |
| κ, two cosmology mouths | 0.04055588172472274 |
| Far-mouth fraction, two cosmology mouths | 0.03187873648553654 |
| Pin time of the cosmology peak | 2.139371566429859 |
| κ, quantum–cosmology, both orders | 0.0426152645973651 |
| Standing quantum–cosmology flux | 0.05162288816705389 |
| Steady quantum scalar | 0.8295954877228278 |
| Steady cosmology scalar | −0.3817753357319615 |
| κ, fluid–cosmology, both orders | 0.03281734550983512 |
| Standing fluid–cosmology flux | −0.0032873163967901955 |
| κ, quantum–fluid, both orders | 0.07370906705774855 |
| Standing quantum–fluid flux | 0.085974065417346 |
| Observer source, observed mouth | 0.0794560282152649 |
| Observer source, dark mouth | 0 |
| Velocity growth over the vendor time | 0.01255164591272752 |
| Third-term factor at D = 5, 12, 25 | 1.2648193460883854, 1.1721325749574505, 1 |
| Compact remainder at D = 5, 12, 25 | 0.4970679476476895, 0.7084766195299412, 1 |

On two mouths of one domain the far mouth receives half the sum mode minus half the difference mode. The sum mode decays at γ. The difference mode decays at 2κ + γ. The fraction at the peak does not depend on the size of the kick, because the law is linear, so no kick amplitude was chosen. Kicking the other mouth returns the same fraction. For two quantum mouths the closed-form peak is 0.09414684910198232 at pin time 1.7835832717000715. Forward Euler on the pin step peaks at 0.09473377563036962, higher by a relative gap 0.006234160080615503. The vendor's own seven steps, at pin time 0.1579697122378454, have carried 0.020936964617341736 of the kick. After the peak both offsets die.

Particle physics returns the same scalar as quantum mechanics, 0.9501974701670142, at the same depth 5. The quantum–cosmology coupling is therefore the GR–EW entry already printed, 0.0426152645973651, in both orders. The standing flux 0.05162288816705389 runs from the quantum mouth toward cosmology while both mouths sit at their equilibria. The residual of that steady pair is roundoff, 10⁻¹⁷. The fluid–cosmology flux is −0.0032873163967901955, so along that pair the bleed runs toward the fluid mouth. Nobody has to call. Swapping the two names swaps the sign of the flux and leaves κ on the same value.

At uniform rest, with the gradients off, `momentum_rhs` returns the observer source. That source is 0.0794560282152649 on an observed mouth and 0 on a dark mouth, and it does not depend on depth. Quantum mechanics is observed. Fluid dynamics and cosmology are dark. Over the vendor interval the observed velocity grows by 0.01255164591272752. The momentum law supplies no decay for that uniform piece, so the growth continues. `scalar_transport_rhs` does not take the observer source.

The scalar's third term carries (D − 25)/25 with its sign. CHAOS is negative, so at depth 12 the factor equals 1 plus the viscosity scale piece, 1.1721325749574505. The compact remainder divides that signed distance by ln(D/25) and is 0.4970679476476895 at depth 5, 0.7084766195299412 at depth 12, and 1 at the ceiling. Each of these is a property of the depth. No shape function is introduced. No throat radius is introduced. No wormhole metric is scored. This page is not a Warp Factory grid, not a built gate, and not a faster-than-light channel. The light clean shell remains the one-sixth window at 0.04c. The hold is the next section.

## The hold, 2026-11-09

The call page left the observer source growing on a uniform flow. This page asks what in the pin can hold that push while the call is on and bring it back to rest when the call ends. The chain is in [METHOD.md](METHOD.md). Pin time remains the time in these laws.

| Reading | Value |
| --- | ---: |
| Viscosity at D = 5 | 0.4255111778470473 |
| Viscosity at D = 12 | 0.33282440671611235 |
| Viscosity at D = 25 | 0.16069183175866183 |
| Source over viscosity, those depths | 0.18673076608066422, 0.2387325767338876, 0.49446214748860096 |
| Stokes e-fold at k = 1 | 2.350114525920765, 3.0045873434184927, 6.223091672150888 |
| Stokes fraction left after the vendor time | 0.9349914647745501, 0.9487820441147276, 0.9749350335878659 |
| Stokes identity error | 0 |
| Crest rate, call on, unit sine, D = 5 | −0.3460551496317824 |
| Node rate, call on | 0.0794560282152649 |
| Uniform rate after the call | 0 |
| Rate when the pressure gradient equals the source | 0 |
| Rate of that same gradient after the call | −0.0794560282152649 |
| Quantum scalar, observed branch on | 0.9501974701670142 |
| Same inputs, observed branch off | −0.6456729548144859 |
| Held offset | 1.5958704249815001 |
| Transport rate parked on the open branch | 0 |
| Transport rate of that offset toward the closed branch | −0.6831018761740097 |
| Scalar e-fold | 2.3362114505084106 |
| Scalar restore over the leftover coast | 34.102574995823105 |

A sine of wavenumber 1, with the observer off, decays at the viscosity. `viscous_mode_rhs_error_pct` returns 0, so that rate is the function's own identity. At the fluid the e-fold is 3.0045873434184927, and after the vendor interval 0.9487820441147276 of the curve remains. With the call on, the crest of a unit sine at depth 5 falls at −0.3460551496317824, and the node of that sine rises at 0.0794560282152649. The source is one number at every point. No sine cancels it on the whole line. The source is smaller than the viscosity at all three depths, so a unit crest still falls, and the node still runs at the full source.

On a uniform flow the call grows the velocity at 0.0794560282152649. With the call off and the gradients off, `momentum_rhs` on the leftover 0.01255164591272752 returns 0. The leftover stays. Fed to the scalar law as an advection speed against a unit gradient, it contributes that same 0.01255164591272752, and γ is 34.102574995823105 times that contribution. The scalar restore is the larger rate on a unit gradient. The coast does not turn off.

Set the pressure gradient equal to the source, with the flow at rest, and `momentum_rhs` returns 0 while the call is on. Leave that gradient and turn the call off, and the rate is −0.0794560282152649. The gradient is an argument of the law.

`scalar_at_D(5, True)` returns 0.9501974701670142, the same value as the quantum fold. `scalar_at_D(5, False)` returns −0.6456729548144859. The difference is 1.5958704249815001. Parked on the open value, `scalar_transport_rhs` returns 0. Pointed at the closed value, it returns −0.6831018761740097, and the e-fold is 2.3362114505084106. Quantum mechanics is observed in the fold, with look 1 and no hits. Fluid dynamics and cosmology match `scalar_at_D` on their own dark settings. No vendor function closes the observed branch after a pin time.

The scalar parks on the branch the fold leaves open. Curved velocity returns at the viscosity. Uniform velocity freezes at the value the call grew. No shape function is introduced. No throat radius is introduced. No wormhole metric is scored. This page is not a Warp Factory grid, not a built gate, and not a faster-than-light channel. The light clean shell remains the one-sixth window at 0.04c. The carry is the next section.

## The carry, 2026-11-10

The hold left a uniform velocity of 0.01255164591272752 with the call off and the rate at 0. This page turns that coast into a distance in the scalar transport law. The chain is in [METHOD.md](METHOD.md). Pin time remains the time in that law. The coordinate x is the one in which κ multiplies the second derivative and the velocity multiplies the first.

| Reading | Value |
| --- | ---: |
| Leftover coast | 0.01255164591272752 |
| Scalar e-fold, 1/γ | 2.3362114505084106 |
| Carry in one e-fold, coast / γ | 0.029323298904041128 |
| Smoothing length, sqrt(κ/γ) | 0.8573494832025231 |
| Carry over that smoothing length | 0.034202270460941514 |
| Smoothing length over the carry | 29.237825048544227 |
| Distance while the source is on, vendor interval | 0.0009913899464724474 |
| Distance while the source is on, one scalar e-fold | 0.21683089022520075 |
| Velocity if the source stays on for one e-fold | 0.18562608292842123 |

The leftover equals the source times the vendor interval, 0.0794560282152649 × 0.1579697122378454. Dividing by γ = 0.4280434460598068 gives the carry 0.029323298904041128. The smoothing length reprints the shell's relaxation length, 0.8573494832025231, from κ = 0.3146325373020798. On the transport law that length is 29.237825048544227 carry-lengths. An offset riding the coast is down by one e-fold when the coast has moved 0.034202270460941514 of a smoothing length. The velocity remains. The coast is empty.

While the source stays on and the flow starts from rest, the distance is J t²/2. Over the vendor interval that is 0.0009913899464724474. Over one scalar e-fold it is 0.21683089022520075, and the velocity has become 0.18562608292842123. The fold does not end the call at that e-fold. The two-mouth coupling still has no separation. No shape function is introduced. No throat radius is introduced. No wormhole metric is scored. This page is not a Warp Factory grid, not a built gate, and not a faster-than-light channel. The light clean shell remains the one-sixth window at 0.04c. The split is the next section.

## The split, 2026-11-10

The carry is the motion of a bump that has a slope. This page splits that bump from a flat offset on the same coast, 0.01255164591272752. The chain is in [METHOD.md](METHOD.md). The wavenumber is one over the smoothing length, 1.166385493421683. At that wavenumber κ k² equals γ, up to roundoff.

| Reading | Value |
| --- | ---: |
| Flat transport rate on a unit offset | −0.4280434460598068 |
| Flat distance | 0 |
| Flat e-fold | 2.3362114505084106 |
| Wavenumber, 1 / smoothing length | 1.166385493421683 |
| κ k² − γ | roundoff |
| Crest rate on a unit bump | −0.8560868921196136 |
| Shaped e-fold, 1/(2γ) | 1.1681057252542053 |
| Node rate on a unit bump | 0.014640057711170941 |
| Distance the peak moves in that e-fold | 0.014661649452020564 |
| That distance over the smoothing length | 0.017101135230470757 |
| Shaped distance against the recorded carry | 1/2 |

`scalar_transport_rhs` on a unit flat offset, with the leftover coast and zero slope, returns −γ. The coast does not enter. The offset dies in place. A two-mouth kick is one number on each mouth, so it is this flat kind. The coupling still has no x, and this coast does not take the kick to the other mouth.

On a unit cosine of wavenumber 1/ell the crest has zero slope and curvature −k². The same function returns −0.8560868921196136, which is −2γ. The node has zero value and slope −k, and the function returns 0.014640057711170941, which is the coast times k. The peak moves at the coast. In one e-fold of the combined decay, pin time 1.1681057252542053, it moves 0.014661649452020564. Twice that distance is the recorded carry, 0.029323298904041128. The move is 0.017101135230470757 of a smoothing length. The velocity remains after the bump is gone. No shape function is introduced. No throat radius is introduced. No wormhole metric is scored. This page is not a Warp Factory grid, not a built gate, and not a faster-than-light channel. The light clean shell remains the one-sixth window at 0.04c. The flux is the next section.

## The flux, 2026-11-10

The coast does not carry a flat kick. The difference the pin can hold is the observed branch at one depth. The chain is in [METHOD.md](METHOD.md). Depth 5 is the quantum depth. The open and closed evaluations are `scalar_at_D(5, True)` and `scalar_at_D(5, False)`.

| Reading | Value |
| --- | ---: |
| Open evaluation | 0.9501974701670142 |
| Closed evaluation | −0.6456729548144859 |
| Gap | 1.5958704249815001 |
| Scale suppressor | 1 |
| Coupling | 0.0985871397275971 |
| Steady difference | 1.0925823889771018 |
| Flux, open toward closed | 0.10771457264599738 |
| Flux with the evaluations swapped | −0.10771457264599738 |
| Steady open-side scalar | 0.698553452164815 |
| Steady closed-side scalar | −0.3940289368122868 |
| Steady residual | roundoff |

The coupling is A_BLEED · POOF · |open| · |closed|. The depths are equal, so the factor 1 + |D_i − D_j|/25 is 1. The steady difference is (γ/2) / (κ + γ/2) times the gap, with γ = 0.4280434460598068. The flux is κ times that difference, 0.10771457264599738. The quantum–cosmology standing flux already on the ledger is 0.05162288816705389. Substituting the steady scalars back into the two-mouth law leaves roundoff, 10⁻¹⁷. Swapping the evaluations swaps the sign of the gap and leaves κ on the same value, so the flux changes sign.

Particle physics and quantum mechanics are the two folds at depth 5. Both are observed. Both return 0.9501974701670142. The closed evaluation is the same inputs with the branch off. It is not one of those folds. The vendor does not seat the open and closed evaluations as the two mouths, and it does not swap the bit after a pin time. No shape function is introduced. No throat radius is introduced. No wormhole metric is scored. This page is not a Warp Factory grid, not a built gate, and not a faster-than-light channel. The light clean shell remains the one-sixth window at 0.04c. The seats are the next section.

## The seats, 2026-11-10

The recorded flux has a settle rate. The chain is in [METHOD.md](METHOD.md). The coupling is the depth-5 branch value 0.0985871397275971, and γ is 0.4280434460598068. The difference approaches the steady difference at 2κ + γ.

| Reading | Value |
| --- | ---: |
| Difference rate | 0.625217725515001 |
| e-fold | 1.5994428167824022 |
| Held fraction of the gap | 0.6846310150711437 |
| Fraction of the steady flux at the vendor interval | 0.09404483795972873 |
| Flux present at the vendor interval | 0.010129999530394252 |

Both mouths start at the open value 0.9501974701670142, so the difference starts at 0. One equilibrium is the closed evaluation −0.6456729548144859. The difference is then the steady difference times (1 − exp(−(2κ + γ) t)). The vendor interval is 0.1579697122378454. The flux present then is 0.010129999530394252. The fold leaves these two evaluations unseated.

Twelve generations contain more than one name, and the pairs inside them number 19. The depth is shared, so the scale suppressor is 1. The steady flux is the same balance as the recorded branch.

| Pair | Depth | Coupling | Steady flux | e-fold |
| --- | ---: | ---: | ---: | ---: |
| Quantum optics toward quantum computing | 8 | 0.10001300937604073 | 0.10948671535321428 | 1.5921805724140845 |
| Thermodynamics toward fluid dynamics | 12 | 0.09297638393677046 | 0.10074608467195591 | 1.6286745378996017 |
| Psychology toward meteorology | 13 | 0.09099118881794928 | 0.09828326880164323 | 1.6392748653519669 |
| Sociology toward seismology | 15 | 0.08709522923555177 | 0.09345612326348175 | 1.6604843939812985 |
| Astrophysics toward particle astrophysics | 23 | 0.07372763887153236 | 0.07699384685878549 | 1.7376233145958029 |
| High-energy physics toward atomic physics | 6 | 0.10818906763961993 | 0.009239275123069976 | 1.5517791907621952 |

Eight pairs differ by the observed bit alone. Look is 1 and hits are 0 on both names, so the scalars are `scalar_at_D(D, True)` and `scalar_at_D(D, False)`. Quantum optics is 0.9536594523121079 and quantum computing is −0.6526335205358984. The steady scalars of that pair are 0.6978753342253736 and −0.39684940244916417. The residual is roundoff. Swapping the names negates the flux. The two orders of the coupling agree to roundoff.

At depth 12 the specimen names are thermodynamics and nuclear physics, both 0.9363875640629747. The medium names are fluid dynamics and ecology, both −0.6179071388700196. Each of the four specimen–medium pairs carries the flux 0.10074608467195591 from the specimen toward the medium. Fluid dynamics with ecology reprints the two-fluid coupling 0.06135362491527767, and the flux is 0. Thermodynamics with nuclear physics is the open scalar twice, and the flux is 0.

High-energy physics and atomic physics are both observed. The looks are 0.9511450936457113 and 0.8652559794322651, and the hits are 1 and 0. The flux 0.009239275123069976 runs from high-energy physics toward atomic physics. That pair is the look-and-hits split.

Ten pairs share one scalar, so the gap is 0 and the flux is 0: physical chemistry with chemistry, electromagnetism with molecular chemistry, the three pairs among optics, acoustics, and materials science, neuroscience with condensed matter, thermodynamics with nuclear physics, fluid dynamics with ecology, atmospheric physics with oceanography, and astronomy with economics.

Particle physics and quantum mechanics are generations 0 and 1. Both are observed and both return 0.9501974701670142. `kappa_domains` returns 0.1450846749297095, the two-quantum-mouth coupling already on the ledger, and the flux is 0.

The seated pairs are two names already. The vendor does not swap the observed bit after a pin time. No shape function is introduced. No throat radius is introduced. No wormhole metric is scored. This page is not a Warp Factory grid, not a built gate, and not a faster-than-light channel. The light clean shell remains the one-sixth window at 0.04c. The clock is the next section.

## The clock, 2026-11-10

The unseated closed branch is not a missing formula. The pin already steps a network. The chain is in [METHOD.md](METHOD.md). `coupled_equilibrium` takes eight sectors and fifteen edges, with dt = 0.022567101748263627 and seven steps, pin time 0.1579697122378454. Each sector starts on the domain scalar of its own fold. The interface value matches that scalar, difference 0.

| Sector | Start | After seven steps | Move | Fixed point |
| --- | ---: | ---: | ---: | ---: |
| Cosmology | −0.5023773181761478 | −0.4820922399905892 | 0.020285078185558636 | −0.2606345553608392 |
| Particle physics | 0.9501974701670142 | 0.9395048551977233 | −0.010692614969290859 | 0.8700275395267406 |
| Nuclear physics | 0.9363875640629747 | 0.9356705559490751 | −0.0007170081138996309 | 0.9046811370997833 |
| Electromagnetism | 0.9557285700955828 | 0.952113921996416 | −0.003614648099166784 | 0.9121175780724999 |
| High-energy physics | 0.8873295223725087 | 0.8911164249970055 | 0.0037869026244967685 | 0.884590585428397 |
| Quantum mechanics | 0.9501974701670142 | 0.9456040592928548 | −0.0045934108741593205 | 0.9011604775814535 |
| Thermodynamics | 0.9363875640629747 | 0.9254346925260264 | −0.01095287153694835 | 0.8511837388156613 |
| Atomic physics | 0.7587603802989923 | 0.7652589530824018 | 0.006498572783409484 | 0.8094847218872173 |

Cosmology is the dark sector. The other seven are observed. At the start the relaxation term is 0, and the rate is the sum of the edge couplings. Cosmology's rate is 0.13345450567211478. Thermodynamics' rate is −0.07374981045099419. The gravity–electroweak edge reprints the quantum–cosmology coupling, 0.0426152645973651. The electroweak–lepton edge reprints the two-quantum coupling, 0.1450846749297095, and those two scalars match, so that edge contributes 0 at the start.

The fixed point is the same linear law with the rate set to 0. Substituting it back leaves roundoff. High-energy physics finishes the seven steps above its start and has its fixed point below its start. The vendor stops at seven steps.

`matter_unobserved_S` on particle physics and on quantum mechanics returns −0.6456729548144859, the closed evaluation at depth 5. No sector equilibrium is that number. Cosmology's unobserved dual is its own start, because the fold already has that sector closed. The loop's state is the eight scalars. Reading the domains after the run returns the same observed flags the fold started with. No shape function is introduced. No throat radius is introduced. No wormhole metric is scored. This page is not a Warp Factory grid, not a built gate, and not a faster-than-light channel. The light clean shell remains the one-sixth window at 0.04c. The map is the next section.

## The map, 2026-11-10

The mouth already has an outer radius, and the shell formula already has an inner edge. The chain is in [METHOD.md](METHOD.md). Both published mouths use R₂ = 20 m. ell = 0.8573494832025231, so the cavity is R₂ (1 − ell) = 2.8530103359495373 m. Compactness C puts the horizon at C R₂.

| Reading | Value |
| --- | ---: |
| Cavity | 2.8530103359495373 m |
| Half-compact horizon | 10 m |
| One-sixth horizon | 3.3333333333333335 m |
| Cavity inside the half-compact horizon | 7.146989664050462 m |
| Cavity inside the one-sixth horizon | 0.48032299738379614 m |
| Formula mass, compactness 1/2 | 6.732954607500545×10²⁷ kg |
| Formula mass, compactness 1/6 | 2.2443182025001816×10²⁷ kg |

The formula masses round to the printed mouths, 6.73×10²⁷ kg and 2.244×10²⁷ kg. Horizons from those printed kilograms are 9.995611722233722 m and 3.332860728780457 m. The cavity lies inside both. A throat placed on the cavity is inside the horizon of either mouth. The placement is not adopted.

The parent's c is 2.99792458×10⁸ m/s. One pin-time unit is read as the light time of the 20 m mouth, R₂/c = 6.671281903963041×10⁻⁸ s.

| Pin interval | Pin time | Seconds |
| --- | ---: | ---: |
| One vendor step | 0.022567101748263627 | 1.5055149751808385×10⁻⁹ |
| Seven steps | 0.1579697122378454 | 1.0538604826265869×10⁻⁸ |
| Shaped e-fold | 1.1681057252542053 | 7.792762586804004×10⁻⁸ |
| Depth-5 difference e-fold | 1.5994428167824022 | 1.0670333920024113×10⁻⁷ |
| Two-quantum peak | 1.7835832717000715 | 1.1898786804703883×10⁻⁷ |
| Scalar e-fold | 2.3362114505084106 | 1.5585525173608007×10⁻⁷ |

| Length | Light time |
| --- | ---: |
| 20 m mouth | 6.671281903963041×10⁻⁸ s |
| Wall, 17.146989664050462 m | 5.7196200926610577×10⁻⁸ s |
| Cavity | 9.516618113019832×10⁻⁹ s |
| Half-compact horizon | 3.3356409519815205×10⁻⁸ s |
| One-sixth horizon | 1.1118803173271735×10⁻⁸ s |

No shape function is introduced. The cavity is not adopted as a throat. No wormhole metric is scored. This page is not a Warp Factory grid, not a built gate, and not a faster-than-light channel. The light clean shell remains the one-sixth window at 0.04c.

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

## The late tent

Dated 2026-11-04. Log `data/dial_late_fan.txt`. Same one-sixth book, same mass, same hydrostatic lapse. The cabin stays at shift 1 and slope 0 through 4.139 m, and that flat hold continues through the 4.602 m cell. From 7.151 m to 9.723 m the shift is held flat at 0.89120. The rise leaves that shelf with the bend at 0 and arrives on the density peak at 12.968 m with the slope at the crest slope 0.132691 per meter and the bend at 0. Between the shelf density and the peak density the bend follows that packing. The rise scale is 1.55791×10⁻⁴⁶. The toe turns at one constant bend, equal to that rise's own peak bend, 0.0569011 per square meter. The crest slope holds from 12.968 m to 16.176 m, 3.209 m. The ease runs 2.278 m and lands on the book's own end slope, 0.00306264 per meter. Past the 4.602 m cell the cabin is one tent. The bend is the one value that lands the leftover. The rise runs 1.274 m. The crest is at 5.877 m. The tent slope is 0.0853658 per meter. The tent bend is 0.0669803 per square meter. The 4.32 m page is 0.278 m short of the tent start. At 4.32 m the shift is 1, the slope is 0, and the steepening is 0. At 4.60 m the shift is 1, the slope is 0, and the steepening is 0. At 4.91 m the shift is 0.9968, the slope is −0.0206368 per meter, and the steepening is −0.0669803 per square meter. At 5.03 m the shift is 0.9938, the slope is −0.0287414 per meter, and the steepening is −0.0669803 per square meter. At 5.23 m the shift is 0.9868, the slope is −0.0420705 per meter, and the steepening is −0.0669803 per square meter. At 5.52 m the shift is 0.9718, the slope is −0.0614948 per meter, and the steepening is −0.0669803 per square meter. At 5.75 m the shift is 0.9559, the slope is −0.0769003 per meter, and the steepening is −0.0669803 per square meter. At 6.14 m the shift is 0.9254, the slope is −0.0677091 per meter, and the steepening is +0.0669803 per square meter. At 6.26 m the shift is 0.9178, the slope is −0.0596714 per meter, and the steepening is +0.0669803 per square meter. At 6.93 m the shift is 0.8928, the slope is −0.0147946 per meter, and the steepening is +0.0669803 per square meter. At 7.15 m the shift is 0.8912, the slope is −5.89620×10⁻⁵ per meter, and the steepening is +0.0669803 per square meter. The cabin spends 0.10880. The rise spends 0.21531. The arc spends 0.79567. The 5.464 m cell is 0.862 m past the tent start and 0.413 m short of the crest at 5.877 m, still on the rising half. The fourth-order reach is 1.28565 m. The 10.97 m page is 1.99758 m short of the density peak, outside that reach. At 10.70 m the shift is 0.8789, the slope is −0.0341258 per meter, and the steepening is −0.0553037 per square meter. At 11.13 m the slope is −0.0583990 per meter and the steepening is −0.0558055 per square meter. At 12.00 m the shift is 0.7889, the slope is −0.100126 per meter, and the steepening is −0.0387650 per square meter. At 12.97 m the slope is the crest slope and the steepening is 0. The shift at the crest radius is 0.67596. The mix crest is 0.38409. At 2.51 m the shift is 1, the slope is 0, and the steepening is 0. At 8.44 m and at 9.72 m the shift is 0.8912 and the slope and the steepening are 0. The 17.12 m page is 0.944 m past the lip. At 17.12 m the shift is 0.1503, the slope is −0.0789794 per meter, and the steepening is +0.0569011 per square meter. The 18.07 m page is 1.89469 m past the lip. At 18.07 m the shift is 0.1009, the slope is −0.0249234 per meter, and the steepening is +0.0569011 per square meter. At 18.13 m the shift is 0.0996, the slope is −0.0216231 per meter, and the steepening is +0.0569011 per square meter. The largest |d²S| through the window is 0.0669803 per square meter, at 5.069 m, on that rising bend. At the window end it is +0.0189823 per square meter, against the book's 0.00634649. The leftover at the window end is 0.09553. The leftover residual is −5.41511×10⁻¹⁴.

| Speed | Sample | Exact contraction | Type IV | Energy |
| --- | --- | --- | ---: | ---: |
| 0 | dominant 1.604×10⁻⁴ at 23.647 m, clean | −1.356×10⁻⁴, Type I 13,456 | 0 | 2.3822×10²⁷ kg |
| 0.04c | dominant 0.4851 at 5.464 m | −0.9453, 6,872 cells | 6,872 | 2.3787×10²⁷ kg |
| 0.06c | dominant 0.7451 at 5.464 m | −1.685, 7,560 cells | 7,560 | 2.3743×10²⁷ kg |

At 0.06c the side flux over peak is −0.0080 at 2.51 m against density 0.188, −0.0064 at 4.14 m against density 0.335, +0.0019 at 4.32 m against density 0.349, +0.0609 at 4.36 m against density 0.352, +0.2413 at 4.47 m against density 0.359, +0.2905 at 4.50 m against density 0.361, +0.4544 at 4.60 m against density 0.368, +0.8120 at 4.91 m against density 0.386, +0.8721 at 5.03 m against density 0.392, +0.9708 at 5.23 m against density 0.402, +0.9238 at 5.35 m against density 0.406, +0.8533 at 5.52 m against density 0.413, +0.7998 at 5.65 m against density 0.417, +0.5806 at 5.75 m against density 0.421, −0.6705 at 6.14 m against density 0.432, −0.7128 at 6.26 m against density 0.434, −0.6745 at 6.93 m against density 0.446, −0.4814 at 7.15 m against density 0.448, −0.0185 at 8.44 m against density 0.464, +0.1794 at 9.90 m against density 0.629, +0.6695 at 10.70 m against density 0.717, +0.6907 at 11.13 m against density 0.756, +0.6815 at 11.19 m against density 0.761, +0.5081 at 12.00 m against density 0.810, +0.0998 at 13.30 m against density 0.857, +0.0719 at 15.70 m against density 0.567, −0.1808 at 16.14 m against density 0.493, −0.5480 at 17.12 m against density 0.337, −0.5566 at 17.52 m against density 0.279, −0.5302 at 18.07 m against density 0.208, −0.5032 at 18.13 m against density 0.201, and −0.3401 at 18.45 m against density 0.165. On the straight climb the exact contraction is −1.301 at 4.602 m, the 4.60 m flux is +0.7403, and the 18.07 m flux is −0.5302. At 0.04c the sample null is 0.4688. The exact worst cell is at 5.464 m, place 73.1°, direction 11.9°. The tail is −7.213×10⁻⁴ at 0.04c and −1.099×10⁻³ at 0.06c. At 0.06c the sample null is 0.8361, serious fraction 0.1457, and the exact worst cell is at 5.464 m, place 73.1°, direction 11.7°. The exact serious fraction is 0.1680 at 0.06c and 0.1026 at 0.04c. The flat page eases, the peak rises, and more cells sit over the bar. The late tent is not adopted.
