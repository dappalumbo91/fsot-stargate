# Method

The derivations of the scalar call and the 20 m shape are this page. The parent shell construction is [PARENT_METHOD.md](PARENT_METHOD.md).

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

## The switch, 2026-11-10

The switch page calls `gr_weak_field_metric_factor`, `acoustic_metric_factor`, and `sm_coupling_bridge` in `fsot_dynamics.py`, and `seed_weak_field_2phi`, `acoustic_null_cone`, `seed_schwarzschild_sun`, and `seed_planck_length` in `fsot_gr_sm.py`. The pin files are not edited.

`gr_weak_field_metric_factor(phi_N)` returns 2 |phi_N| times (1 + K |S_cosmology| POOF). The limit suite uses phi_N = 10⁻⁶. |S_cosmology| is 0.5023773181761478, the dressing is 1.0323928994008864, and the dressing minus the returned ratio is 0. The same call at 0 returns 0. `seed_weak_field_2phi(10⁻⁶)` returns 2×10⁻⁶.

`acoustic_metric_factor` is the square root of `sound_speed_sq(1)`. It returns 0.7693639124918291, and `acoustic_null_cone` returns the same value. `seed_schwarzschild_sun` returns 2953.3393820668784 m. `seed_planck_length` returns 1.61625502392855×10⁻³⁵ m. `sm_coupling_bridge` returns the four pure numbers in the table.

The arguments are phi_N or nothing. The redshift and the shape remain the ones written on the shape page. The reading is in [RESULTS.md](RESULTS.md). The traversal is the next section.

## The traversal, 2026-11-10

The traversal page calls `domain_scalar` in `fsot_compute.py` and `kappa_domains` in `fsot_scale_interconnects.py`. γ = |CHAOS| + PSI_CON · POOF = 0.4280434460598068, from `fsot_dynamics.py`. The pin files are not edited.

The two devices are Quantum_Computing and Quantum_Optics. `domain_scalar` returns −0.6526335205358984 and 0.9536594523121079. `kappa_domains` on that pair returns 0.10001300937604073. The difference rate is 2κ + γ = 0.6280694648118883.

Both mouths start on their own domain scalars. The two-mouth law is

dS_i/dt = κ (S_j − S_i) − γ (S_i − E_i).

The sum stays 0.3010259317762095. The difference is

Δ(t) = Δ_∞ + (Δ_0 − Δ_∞) exp(−(2κ + γ) t),

with Δ_0 = −1.6062929728480064 and Δ_∞ = [γ / (2κ + γ)] Δ_0 = −1.0947247366745378. The flux is κ |Δ|.

The crossing page fixes the through-distance 2L. An on-axis coast at proper-distance speed v has laboratory time T = 2L/v. The map page reads one pin-time unit as R₂/c. The pin time on that laboratory interval is t = T c / R₂. A forward Euler of 200000 steps over the one-sixth null pin time differs from this closed form by 3.4091445660910935×10⁻⁷ and −3.409144698762745×10⁻⁷.

The 19 m and 21 m times use 400000 steps of the square-root substitution on the same metric. The reading is in [RESULTS.md](RESULTS.md). The passage is the next section.

## The passage, 2026-11-10

The passage page puts three widths on the traversal metric. The person is 0.50 m across, the crate is 1.00 m across, and the ship is 10.00 m across. The lengths along the crossing are 1.80 m, 1.00 m, and 10.00 m. The pin is called for the seated steady flux and is not edited.

κ(r) = Rs / (2 r³) + (r₀ − Rs) r₀ / r⁴. The side-to-side load is κ v² times the width. At the throat this κ is 0.002291666666666667 m⁻² on the one-sixth mouth and 0.001875 m⁻² on the half-compact mouth. The radial gap acceleration on an on-axis coast is 0.

A parallel fiber at offset ρ is the aim of impact parameter ρ. It exits the far mouth when ρ is under 20 m, returns when ρ is over 20 m, and does not finish at 20 m. The fiber times use 400000 steps of the square-root substitution. The 19 m and 21 m fibers reproduce the traversal page.

The coast that holds the side-to-side load at 9.80665 m/s² is v(r) = √(9.80665 / (κ(r) W)). Its crossing time is the integral of dl / v(r) on both sides, with the same substitution. The reading is in [RESULTS.md](RESULTS.md). The throw is the next section.

## The throw, 2026-11-10

The throw page puts one person on a constant coast. Feet-first, the width is 0.50 m and the length along the crossing is 1.80 m. Sideways, the width is 1.80 m. The flat diagonal is √(1.80² + 0.50²) = 1.8681541692269406 m. The side-to-side load is κ v² times that width. The speed at which the load equals 9.80665 m/s² is √(9.80665 / (κ W)).

The shoulders are two parallel fibers. Feet-first they sit 0.25 m to either side of the centerline aim. Sideways they sit 0.90 m to either side. The lag is the difference of those two fiber times. The fiber integral uses 400000 steps of the square-root substitution. The 19 m fiber reproduces the traversal page, and the on-axis 0.25 m lag reproduces the passage page. A shoulder on the 20 m circle does not finish, so the cut aim is 20 m minus the half-width: 19.75 m feet-first and 19.1 m sideways. The reading is in [RESULTS.md](RESULTS.md). The walk is the next section.

## The walk, 2026-11-10

The walk page puts the person upright on the same metric. The height is 1.80 m and the shoulder width is 0.50 m, both across the crossing. The head and the feet are the fiber at impact parameter 0.90 m. The shoulders are the fiber at 0.25 m. The gaits supplied with the person are 1.0 m/s, 1.4 m/s, and 1.8 m/s.

The side-to-side load is κ v² times the width. At the throat κ is 0.002291666666666667 m⁻² on the one-sixth mouth and 0.001875 m⁻² on the half-compact mouth. Proper acceleration at rest is 0 because the redshift derivative is 0. A deck at rest has tidal load 0 because that load is proportional to v². On axis the crossing time is the recorded through-distance divided by the gait.

An offset fiber uses 400000 steps of the square-root substitution. The 19 m fiber at 10 m/s reproduces the traversal page. The one-sided proper length is the closed form on the shape page. The radius at a stated proper length is an 80-step bisection of that form. A horizontal miss at aim A puts the spine at impact parameter A and the head or a foot at the hypotenuse of A and 0.90 m. A fiber on the 20 m circle does not finish, so the upright cut aim is 19.1 m. The reading is in [RESULTS.md](RESULTS.md). The haul is the next section.

## The haul, 2026-11-10

The haul page places the two mouths on the published aerodrome reference points. John F. Kennedy International is 40°38'23.741"N, 73°46'43.292"W. Hong Kong International is 22°18'32"N, 113°54'53"E. Decimal degrees are degrees plus minutes over 60 plus seconds over 3600, with west negative.

The outside distance is Vincenty's inverse formula on WGS84, a = 6378137 m and f = 1/298.257223563. The light time is that distance over c = 2.99792458×10⁸ m/s. The outside speeds 250 m/s and 1.4 m/s, the dwell of 60 s, and the mass of 10000 kg are supplied for the comparison.

An on-axis conduit time is the recorded through-distance divided by the supplied speed. The scheduled ship times are the passage-page integrals. The throat speed and the 40 m face speed are √(9.80665 / (κ W)) at those radii for W = 10 m, and both reproduce the passage values. A load computed on this page for a newly scored coast is κ γ² v² W. The 10 m/s and 100 m/s loads stay the passage-page values.

`momentum_rhs` is called with density 1, velocity 0, both velocity derivatives 0, pressure gradient 0, effective depth 1, and the observed flag false and then true. The steady flux is the traversal value and is not passed into that call. Specific energy is v²/2. The reading is in [RESULTS.md](RESULTS.md). The pace is the next section.

## The pace, 2026-11-10

The pace page keeps the passage coast v(r) = √(a / (κ(r) W)). The crossing time is the integral of dl / v(r) on both sides, 400000 steps of the square-root substitution. For W = 10 m, a = 9.80665 m/s², and the 40 m face, the integral differs from the passage ship time by 0.

The stations are the walk-page marks at 21 m, 22 m, 25 m, 30 m, and 40 m. The half-tide radii are the passage values, and the proper lengths inside them reproduce 27.25019714723869 m and 31.24363785379133 m. A beam change and a cap change each scale v(r) by the same factor at every radius, so the time scales as √(W / a). The factor 1.1 on the schedule multiplies the load by 1.21. The 2 m beam at the 22 m station uses the same integral. The far-fiber cut is 20 m minus half the beam. The reading is in [RESULTS.md](RESULTS.md). The dash is the next section.

## The dash, 2026-11-10

The dash page keeps the pace coast and adds the acceleration along the path. On v(r) = √(a / (κ(r) W)) that acceleration is v dv/dl, with dl the proper distance. The value is evaluated from dκ/dr and from dr/dl = √(1 − b(r)/r).

The coast that holds both accelerations at 9.80665 m/s² passes the throat at the throat speed. At proper distance σ from the throat its speed is the minimum of the pace speed and √(v_throat² + 2 × 9.80665 × σ). The crossing time is twice the integral of dσ/v. A start and a stop use the minimum of that pace speed, √(2 × 9.80665 × λ) from the start, and √(2 × 9.80665 × λ) to the end.

The one-meter stations are the walk-page radii. The light-matching length is a bisection of the pace integral against the haul's outside light time, 0.04333083088431372 s, confirmed at 400000 steps. The outside lane is v/a and v²/(2a) at the face speed. The reading is in [RESULTS.md](RESULTS.md). The buffer is the next section.

## The buffer, 2026-11-10

The buffer page keeps the pace coast and reads v dv/dl at 21 m, 22 m, 25 m, and 30 m. At the throat dr/dl = 0, so that acceleration is 0. The constant throat-speed time is the through-distance divided by √(9.80665 / (κ(r₀) W)).

The start-and-stop with the side-to-side load removed is 2 √(D / 9.80665), where D is the through-distance. The crossing at the dash entry speed with that load removed is D divided by the entry speed.

The width at a stated throat speed is 9.80665 / (κ(r₀) v²), and the constant-speed time is D / v. The factor γ² on a constant coast is 1 / (1 − v²/c²). The 2 m masses are the compactness formula at that radius. The reading is in [RESULTS.md](RESULTS.md). The stamp is the next section.

## The stamp, 2026-11-10

The stamp page checks the shape in two checkers. `lean/GateLedger.lean` is Lean 4.31.0 and Mathlib v4.31.0. Run it from the FSOT-2.1-Lean checkout, so Mathlib resolves: `lake env lean` on that file. The file is not part of `lean_lib FSOT`. `octave/dial_gate_stamp.m` is the float reprint. Octave 11.3.0 wrote `data/dial_gate_stamp.txt`. The 400000-step schedule uses the square-root substitution. At the throat the integrand is 2 r₀ / √(2 r₀ − Rs), divided by the throat speed. The reading is in [RESULTS.md](RESULTS.md). The fill is the next section.

## The fill, 2026-11-10

The fill extends the same two checkers. `GateLedger.lean` adds the printed ell, the cavity 20 (1 − ell), the comparison of that cavity with 10/3 and 10, the sign of a positive multiple of b′, and γ² − 1 = v² / (c² − v²) at v² = 400, 6400, and 100000000. Run it the same way: `lake env lean` from the FSOT-2.1-Lean checkout. The file stays outside `lean_lib FSOT`.

`octave/dial_gate_stamp.m` adds the cavity bounds, those three gamma bounds, the published throat density, and a Simpson rule. The guarded integrand is the one the schedule already uses. The smooth integrand is 2 r / √(r + r₀ − Rs) on the same s-grid. The published ship times remain the 400000-step trapezoid. The reading is in [RESULTS.md](RESULTS.md). The open is the next section.

## The open, 2026-11-10

The open page calls the pin and does not edit it. `kappa_domains` is in `fsot_scale_interconnects.py`. `coupling_kappa`, `SECTOR_NODES`, `SECTOR_EDGES`, and `coupled_equilibrium` are in `fsot_complex_interaction.py`. `scalar_at_D`, `scalar_transport_rhs`, `momentum_rhs`, `gr_weak_field_metric_factor`, and `acoustic_metric_factor` are in `fsot_dynamics.py`. `matter_unobserved_S` is in `fsot_matter_antimatter.py`. `domain_scalar` and the domain table are in `fsot_compute.py`. `linear_potential` and `area_law_sigma` are in `fsot_uniqueness_confinement.py`.

γ = |CHAOS| + PSI_CON · POOF = 0.4280434460598068. For equilibria E₁ and E₂ the steady difference is [γ / (2κ + γ)] (E₁ − E₂), and the flux is κ times that difference. The steady scalars are E₁ − (κ/γ) Δ∞ and E₂ + (κ/γ) Δ∞. The seated order is quantum optics then quantum computing. The transport call uses the steady optics scalar, velocity 0, both derivatives 0, the optics depth, and the optics domain scalar as the equilibrium. The momentum call uses density 1, velocity 0, both velocity derivatives 0, pressure gradient 0, that same depth, and the observed flag both ways. The map-page second is 20 / 299792458. The reading is in [RESULTS.md](RESULTS.md). The solve is the next section.

## The solve, 2026-11-10

The solve page uses the two-mouth law and the shape already on the ledger. The pin is called and is not edited. `domain_scalar` is in `fsot_compute.py`. `scalar_at_D` is in `fsot_dynamics.py`. `kappa_domains` is in `fsot_scale_interconnects.py`. `coupled_equilibrium` is in `fsot_complex_interaction.py`, and its equilibrium for each sector is that sector's own scalar.

The two-mouth law is dSᵢ/dt = κ (Sⱼ − Sᵢ) − γ (Sᵢ − Eᵢ). The difference Δ = S₁ − S₂ obeys dΔ/dt = −(2κ + γ) Δ + γ (E₁ − E₂). The sum Σ = S₁ + S₂ obeys dΣ/dt = −γ (Σ − (E₁ + E₂)). The settled difference is [γ / (2κ + γ)] (E₁ − E₂), and the flux is κ times that difference. `GateLedger.lean` proves that 2κ + γ is positive when κ and γ are positive, that the flux is 0 when the two equilibria are equal, and that the flux is positive when the first equilibrium is the larger one. γ = 0.4280434460598068. The published seated κ is 0.10001300937604073.

From a state (Δ₀, Σ₀), with both equilibria then set to the same value E,

Δ(t) = Δ₀ exp(−(2κ + γ) t), Σ(t) = 2E + (Σ₀ − 2E) exp(−γ t).

The seated rate 2κ + γ is 0.6280694648118883. One difference e-fold on the map-page clock, one pin-time unit = 20/299792458, is 1.0621885440587598×10⁻⁷ s. The one-efold numbers in [RESULTS.md](RESULTS.md) use the open-page steady scalars and E equal to the computing scalar. E equal to the optics scalar has the same target flux, 0, and target sum 1.9073189046242158.

Depth 8 is the generation that contains quantum computing and quantum optics. The same generation contains optics, acoustics, and materials science. Depth 5 contains particle physics and quantum mechanics. `kappa_domains` multiplies the absolute values of the two scalars, so the coupling itself carries a positive value.

The shape density at radius r is ρ = b′ c⁴ / (8 π G r²), with b′ = −(r₀ − Rs) r₀ / r². The coordinate integral on one side is

∫ ρ 4π r² dr = (c⁴ / (2G)) (Rs − r₀),

from the throat to infinity, because b(∞) = Rs and b(r₀) = r₀. Divided by c² this is the mouth mass M = Rs c² / (2G) times (Rs − r₀) / Rs. The mouth mass is `compactMass` at 20 m. The ratios −5 and −1, and the one-side, one-mouth, and two-mouth products, are the Lean equalities.

The proper-volume integral uses dl = dr / √(1 − b/r). The same prefactor c⁴ / (2G) multiplies ∫ b′ / √(1 − b/r) dr. The substitution r = r₀ + s² converts that integral to

∫₀^∞ 40 (Rs − 20) / ((20 + s²) √(s² + 40 − Rs)) ds.

For the one-sixth mouth, J = ∫ ds / ((s² + 20) √(s² + 110/3)). The substitution s = √(110/3) sinh u and w = 2u gives J = ∫ dw / (2 (5/3 + 55/3 cosh w)) from 0 to ∞. The integral of 1 / (5/3 + 55/3 cosh w) over that range equals √30 atan(√30/6) / 50. The proper integral is (−2000/3) J, and dividing by Rs = r₀/6 produces −2√30 atan(√30/6). For the half-compact mouth the prefactor 40 (Rs − 20) is −400, the denominator constants are 5 and 15, the integral of 1 / (5 + 15 cosh w) equals √2 atan(√2/2) / 10, and dividing that proper integral by Rs = 10 produces −2√2 atan(√2/2). With t = e^{−w}, each of those cosh integrals equals ∫ 2 / (B t² + 2 A t + B) dt on [0, 1], which is the Octave check.

SymPy leaves ∫ ds / ((s² + 20) √(3s² + 110)) unevaluated. The published ship times remain the 400000-step trapezoid in `octave/dial_gate_stamp.m`. Run the Lean file with `lake env lean` from the FSOT-2.1-Lean checkout. The file stays outside `lean_lib FSOT`. The reading is in [RESULTS.md](RESULTS.md). The derive is the next section.

## The derive, 2026-11-10

The derive page builds the potential of the two-mouth law and the radial reading of the shape. The pin is not edited.

Set

V(S₁, S₂) = γ/2 (S₁ − E₁)² + γ/2 (S₂ − E₂)² + κ/2 (S₁ − S₂)².

Then −∂V/∂S₁ = κ (S₂ − S₁) − γ (S₁ − E₁), and the same with the labels swapped. Expanding (S₁ − S₂)² produces the product term −κ S₁ S₂. γ = 0.4280434460598068 and the seated κ is 0.10001300937604073, so the seated product coefficient is −0.10001300937604073.

The settled difference is Δ = γ (E₁ − E₂) / (2κ + γ), with S₁ = E₁ − (κ/γ) Δ and S₂ = E₂ + (κ/γ) Δ. Substituting those scalars gives V = κ γ (E₁ − E₂)² / (2 (2κ + γ)). The right-hand side is 0 when E₁ = E₂.

On the way from a prepared state (Δ₀, Σ₀) to a common equilibrium E, Δ(t) = Δ₀ exp(−(2κ + γ) t) and Σ(t) − 2E = (Σ₀ − 2E) exp(−γ t). The potential along that path is (γ/4) (Σ − 2E)² + (2κ + γ) Δ² / 4. Its integral from 0 to ∞ is [(Σ₀ − 2E)² + Δ₀²] / 8, which equals [(S₁ − E)² + (S₂ − E)²] / 4. When S₁ + S₂ = E_optics + E_computing, the two choices of the common equilibrium give one integral, (gap² + Δ²) / 8.

The flux on that path is the starting flux times exp(−(2κ + γ) t). The open-page roundoff 1.3877787807814457×10⁻¹⁷ fixes one time, ln(flux / roundoff) / (2κ + γ). One pin-time unit is 20/299792458 s.

Any A + B/r with A + B/r₀ = r₀ and A = Rs is the shape page's b(r). The slope at r is the throat slope times (r₀/r)². The Einstein density used at the throat, ρ = b′ c⁴ / (8 π G r²), therefore scales by another (r₀/r)², and the ratio of densities is (r₀/r)⁴. The radial tension that returns c⁴ / (8 π G r₀²) at the throat is τ(r) = b(r) c⁴ / (8 π G r³), so τ(r)/τ(r₀) = (b(r)/r₀) (r₀/r)³. Their difference has the sign of b′ r − b = −Rs − 2 (r₀ − Rs) r₀ / r. At r = 2 r₀ that numerator is −r₀, and ρ − τ = −τ(r₀)/8.

The pin momentum balance at vanishing velocity derivatives is ∂t v = −(1/ρ) ∂x P + J/ρ. A steady coast then has ∂x P = J. J is `observer_source`. The speed remains the lateral-load coast already on the ledger. The reading is in [RESULTS.md](RESULTS.md). The energy is the next section.

## The energy, 2026-11-10

The energy page reads the solve-page coordinate integral as joules. The density ρ = b′ c⁴ / (8 π G r²) is in pascals. From the throat to infinity, on one side,

∫ ρ 4π r² dr = (c⁴ / (2G)) (Rs − r₀),

because b(∞) = Rs and b(r₀) = r₀. The right-hand side equals the solve-page exotic mass times c². With c = 299792458 and G = 66743/10¹⁵ the product is an exact rational. One side is −5 M c² on the one-sixth mouth and −1 M c² on the half-compact mouth, where M = Rs c² / (2G) is `compactMass` at 20 m. One mouth doubles the one-side value. Two mouths of one kind quadruple it. `GateLedger.lean` proves the integral form, the product with c², and the six rationals.

The proper energy is the solve-page proper mass times the same c². The factor on one side remains −2√30 atan(√30/6) on the one-sixth mouth and −2√2 atan(√2/2) on the half-compact mouth. The stamp multiplies the float64 proper mass by c².

The two-mouth potential V stays dimensionless. No conversion is applied to it. The pin is not edited. The reading is in [RESULTS.md](RESULTS.md). The supply is the next section.

## The supply, 2026-11-10

The supply page differentiates the one-side energy. With ρ 4π r² = b′ c⁴ / (2G),

E(r) = (c⁴ / (2G)) (b(r) − r₀)

on the interval from the throat to r. b is a function of r only, so the hold rate at fixed r is 0.

Along an outward radial curve, dE/dt = (c⁴ / (2G)) b′ dr/dt. A radial null ray has dr/dt = c √(1 − b/r), so

P_null = (c⁵ / (2G)) b′ √(1 − b/r).

Write A = (r₀ − Rs) r₀ and N(r) = r² − Rs r − A. Then b′ = −A / r² and 1 − b/r = N/r², so the squared null sweep is proportional to N / r⁶. The numerator of the derivative of that quotient is r⁵ (−4 r² + 5 Rs r + 6 A). The positive root is

r = [5 Rs + √(25 Rs² + 96 A)] / 8.

The lateral-load coast has v = √(a / (κ W)) with a = 9.80665 m/s² and W = 10 m, and dr/dt = v √(1 − b/r). Therefore P_coast = P_null · v / c. Substituting κ = (Rs r + 2 A) / (2 r⁴) makes the squared coast sweep proportional to N / (r² (Rs r + 2 A)). The numerator of that derivative is −r (Rs r³ − 2 Rs² r² − 5 A Rs r − 4 A²).

At r = 2 r₀ the identity b − r₀ = (Rs − r₀)/2 says the face holds half the infinite-arm side. Two faces, one on each side of the throat, sweep one infinite-arm side. The mean rate of the published crossing is that energy divided by the published ship time.

κ(2 r₀) = 1/(16 r₀²). At 20 m that is 1/6400 for every Rs, so the face speed √(a / (κ W)) is the same on both mouths.

The substitution already on the solve page evaluates the integrand SymPy left unevaluated. √(3 s² + 110) = √3 √(s² + 110/3), and the sinh reduction of the remaining integral produces

∫_0^∞ ds / ((s² + 20) √(3 s² + 110)) = √10 atan(√30/6) / 100.

The same reduction with Rs = 10 produces

∫_0^∞ ds / ((s² + 20) √(s² + 30)) = √2 atan(√2/2) / 20.

The ship-time integrand stays the 400000-step trapezoid. Its reduced form is

√(W / (2 a)) ∫ √(Rs r + 2 A) / (r √(r² − Rs r − A)) dr,

and the published values of that definite integral stay 2.1294485057269195 s and 2.1647639000180656 s. The pin is not edited. The reading is in [RESULTS.md](RESULTS.md). The shutdown is the next section.

## The shutdown, 2026-11-10

The shutdown page runs the both-equal substitution on the output of `coupled_equilibrium`. The pin is not edited.

The clock integrates

dS_i/dt = Σ_j κ_ij (S_j − S_i) − γ (S_i − E_i)

for seven steps of dt = POOF · SUCTION, with E_i equal to sector i's own scalar. On one undirected edge the two coupling terms are κ (S_j − S_i) and κ (S_i − S_j), and their sum is 0. The mean of the eight scalars therefore moves only through the relaxation. After those seven steps the mean is 0.73407640288136422, and the mean of the eight bare scalars is the same number. Setting every equilibrium to that mean leaves the mean fixed.

The potential of that law is

V = Σ_i (γ/2) (S_i − E)² + Σ_edges (κ_ij/2) (S_i − S_j)².

At the clock's state, with E the common mean, V = 0.46402250394927314. The deviation decomposes into eigenmodes of the coupling matrix plus γ. A mode of amplitude c and rate λ contributes (λ/2) c² exp(−2 λ t) to V. The integral of that term is c²/4. Summing the modes gives |S − E|² / 4 = 0.42911086091120682. For two mouths whose sum already equals 2E, the same identity is Δ²/8.

The largest edge current at the start is 0.069999121186276561. The slowest difference rate is 0.52223176413167338. The modal decay brings every edge current down to the open-page roundoff 1.3877787807814457×10⁻¹⁷ at 69.213540350682152 pin-time units. One pin-time unit is 20/299792458 s, so that shutdown is 4.6174303925072154×10⁻⁶ s.

While each equilibrium stays on its own scalar, 13 of the 15 edges have a nonzero steady flux. The largest is 0.058061061286508266. Replacing only the gravity equilibrium with the common mean leaves a largest steady flux of 0.014485873046876672.

Particle physics and quantum mechanics both have depth 5, look 1, and hits 0, and both are observed. `scalar_at_D(5, False)` uses look 1 and hits 0. `matter_unobserved_S` uses the domain's own look and hits with the observer off. On these two names the calls are the same evaluation, and both return −0.6456729548144859. The closed mouth's name is that unobserved reading. The seated pair uses the observed scalar 0.9501974701670142 against it. The coupling is A_BLEED · POOF · |open| · |closed| = 0.0985871397275971. The steady scalars are 0.69855345216481501 and −0.39402893681228679. Their mean is 0.15226225767626411, the difference is already the steady difference, and the shutdown integral is Δ²/8 = 0.14921703458786387. The time to the same roundoff is ln(κ |Δ| / roundoff) / (2κ + γ) = 58.520368540428223 pin-time units, 3.9040587565700679×10⁻⁶ s.

The observed particle–quantum-mechanics coupling stays 0.1450846749297095. The two observed scalars match, so that flux is 0.

Gao, Jafferis, and Wall, JHEP 12 (2017) 151, equation (2.7), set

δH(t) = −∫ dφ h(t, φ) O_R(t, φ) O_L(−t, φ),

with h equal to 0 for t < t₀. The same paper finds the horizon null energy negative for positive h. The product term already proved for the two-mouth potential is −κ S₁ S₂. The gate's h is κ, and the product is −h S₁ S₂. On the optics–computing pair h = 0.10001300937604073. On the depth-5 pair h = 0.0985871397275971. Their statement that a deformation of only one boundary Hamiltonian leaves the bridge closed is the reading of the gravity-only substitution above. The pin files were not edited. The reading is in [RESULTS.md](RESULTS.md). The schedule is the next section.

## The schedule, 2026-11-16

The ship time is both sides of

t = √(W / (2 a)) ∫_{r₀}^{2 r₀} √(Rs r + 2 A) / (r √(r² − Rs r − A)) dr,

with A = r₀ (r₀ − Rs), W = 10, and a = 9.80665. The substitution r = r₀ + u gives

I = ∫₀^{r₀} √(Rs u + r₀ B) / ((u + r₀) √(u (u + B))) du,

where B = 2 r₀ − Rs and the full crossing is t = 2 √(W / (2 a)) I.

The identity Rs u + r₀ B = Rs (u + r₀) + 2 r₀ (r₀ − Rs) splits the integrand into

Rs / √(u (u + B) (Rs u + r₀ B)) + 2 r₀ (r₀ − Rs) / ((u + r₀) √(u (u + B) (Rs u + r₀ B))).

The first integral is a Carlson R_F. The second is a Carlson R_J. At the upper limit u = r₀ their combination is

I = 2 R_F(1, (3 r₀ − Rs) / B, 2 r₀ / B) − [4 (r₀ − Rs) / (3 B)] R_J(1, (3 r₀ − Rs) / B, 2 r₀ / B, 2).

For Rs = r₀/6 the arguments are 17/11 and 12/11 and the coefficient is 20/33. For Rs = r₀/2 the arguments are 5/3 and 4/3 and the coefficient is 4/9. Lean proves those six rationals and the numerator split. Octave evaluates the definite integral. The values are 2.1294485056590506 s and 2.1647638999709788 s. The 400000-step trapezoid sits 6.7996719366192337×10⁻¹¹ s and 4.7098325239858241×10⁻¹¹ s above them. The pin is not edited. The reading is in [RESULTS.md](RESULTS.md). The audit is the next section.

## The audit, 2026-11-16

The two-mouth law is dSᵢ/dt = κ (Sⱼ − Sᵢ) − γ (Sᵢ − Eᵢ). Its unknowns are the two scalars. The crossing time is the integral of 1/v(r) along b(r), with v(r) = √(a / (κ(r) W)) and κ(r) = (b/r − b')/(2 r²). The integrand has no scalar, no flux, and no h. Setting the two equilibria equal changes the scalar trajectory and leaves the integral where it is. The hold rate at fixed radius is the time derivative of an energy that depends on r and not on t, so that rate is 0. The watt figures divide that energy by a ship time. They do not enter the momentum call. The pin files were not edited. The reading is in [RESULTS.md](RESULTS.md). The join is the next section.

## The join, 2026-11-16

The potential on the seated pair is

V = κ γ (E₁ − E₂)² / (2 (2κ + γ)).

V is dimensionless. The settled flux κ γ (E₁ − E₂) / (2κ + γ) is a rate. A rate times the shape tension would need a time the ledger does not have. V times the tension does not. That product is the join. The factor (1 − b/r) is not inserted by hand.

Ford and Roman, gr-qc/9510071, give the radial pressure of the Morris–Thorne metric, in units G = c = 1, as

p_r = −(1/(8π)) [ b/r³ − 2 (Φ'/r) (1 − b/r) ].

The ledger's tension is the negative of that pressure, with c⁴/G restored. At Φ' = 0 it is τ(r) = b(r) c⁴ / (8π G r³). An added tension δτ = V τ then fixes

Φ'(r) = −V b(r) / (2 r (r − b(r))).

The same paper gives a^r = Φ' (1 − b/r) for the proper acceleration of a static observer, R_{tθtθ} = (Φ'/r) (1 − b/r), and R_{rθrθ} = (b' r − b) / (2 r³). The last of those is −κ(r). For a radial traveler, omitting the Lorentz factor the way the coast already does, the lateral acceleration per meter is

κ(r) v² − c² (Φ'/r) (1 − b/r).

Substituting Φ' turns the second term into c² V b(r) / (2 r³). The two terms have the same sign. At the throat the 1 g condition is κ v² = g/W − c² V / (2 r₀²). While the seated call is on, the right-hand side is negative, so that speed is not real. At V = 0 the right-hand side is g/W and the closed coast returns.

The gap identity r² − Rs r − (r₀ − Rs) r₀ = (r − r₀)(r + r₀ − Rs) writes r − b(r) = (r − r₀)(r + r₀ − Rs) / r. Therefore

(r − r₀) b / (2 r (r − b)) = b / (2 (r + r₀ − Rs)),

which is −(r − r₀) Φ' / V wherever the original quotient is defined. At the throat the right-hand side is r₀ / (2 (2 r₀ − Rs)). For Rs = r₀/6 that is 3/11. For Rs = r₀/2 that is 1/3. Cancelling the gap before the limit leaves b / (2 r), and at the throat that residue is 1/2, so (r − b) Φ' approaches −V/2. Lean proves the identity, the two weights, and the residue. It does not prove the logarithm.

Integrating Φ' gives

Φ(r) = V / (2 (Rs − 2 r₀)) [ r₀ ln(r − r₀) + (Rs − 2 r₀) ln r − (Rs − r₀) ln(r + r₀ − Rs) ],

up to a constant. The coefficient of ln(r − r₀) is negative for both seated mouths, and the logarithm goes to −∞, so Φ goes to +∞ at the throat. Octave integrates Φ' from 25 m to 40 m and matches this expression. The values are in [RESULTS.md](RESULTS.md). The pin is not edited. The entry is the next section.

## The entry, 2026-11-16

The seated pair is quantum optics and quantum computing, already at the on-state of the join. Shutting the call off sets both equilibria to the mean of those two domain scalars. The steady scalars sum to that same total, so Σ − 2E starts at 0 and the sum mode is absent. The difference is the derive page's steady difference,

Δ∞ = γ (E₁ − E₂) / (2κ + γ) = 1.0947247366745378.

The two-mouth potential at that instant, with the common equilibrium equal to the mean, is

V_switch = (2κ + γ) Δ∞² / 4 = γ² (E₁ − E₂)² / (4 (2κ + γ)) = 0.18817310515070426.

The seated potential is V_on = κ γ (E₁ − E₂)² / (2 (2κ + γ)). Lean proves V_switch / V_on = γ / (2κ). Octave prints that ratio as 2.1399388376086073. The throat tide scales with V, so the switch tide is that many times the seated tide: 2.1140194094147898×10¹³ m/s² per meter. The radicand g/W − c² V_switch / (2 r₀²) is −2.1140194094146918×10¹³.

With the sum mode absent, Δ(t) = Δ∞ exp(−(2κ + γ) t) and

V(t) = V_switch exp(−2 (2κ + γ) t).

The throat radicand is zero when c² V / (2 r₀²) = g/W, so

V_gate = 2 r₀² (g/W) / c².

Lean proves this rational equals 196133 / (250 c²) and that the load it produces is g/10, with g = 980665/100000, W = 10, r₀ = 20, and c = 299792458. Octave prints 8.7290957377585730×10⁻¹⁵. The time is

t = ln(V_switch / V_gate) / (2 (2κ + γ)) = 24.441342370391848

pin-time units. One pin-time unit is 20/299792458 s, so the gate is 1.6305508506416028×10⁻⁶ s. The 1 g throat speed at that instant is 0, because the radicand is 0. A positive 1 g speed exists only later.

The static piece is c² V b(r) / (2 r³). At 40 m, b/r³ over the throat value 1/r₀² is the tension ratio already proved, 7/96 on the one-sixth mouth and 3/32 on the half-compact mouth. The face gate is V_gate times 96/7 and 32/3. Those times are 1.4914871060426914×10⁻⁶ s and 1.5048342713765240×10⁻⁶ s. Both are earlier than the throat.

The seated flux κ Δ(t) reaches the open-page roundoff 1.3877787807814457×10⁻¹⁷ at the shutdown time already stamped, 3.8880657558015190×10⁻⁶ s. Because V scales as Δ², the potential there is V_switch (roundoff / flux)² = 3.0232578084704490×10⁻³³. Dividing by the gate gives 3.4634261088385663×10⁻¹⁹. The closed ship times are the coast at V = 0, which is the coast after that floor. The pin is not edited. The reading is in [RESULTS.md](RESULTS.md). The inventory is the next section.

## The inventory, 2026-11-16

The shape density ρ = b′ c⁴ / (8π G r²) depends on the slope of b. The coordinate energy on one side, from the throat out to r, is the integral of ρ 4π r², which is (c⁴ / (2G)) (b(r) − r₀). Substitute b(r) = Rs + (r₀ − Rs) r₀ / r:

b(r) − r₀ = (Rs − r₀) (1 − r₀/r).

Lean proves that identity. V is absent from it. At r = 2 r₀ the factor is 1/2, so the face and the arm beyond the face are equal. Two faces equal one side. Four sides minus that side leave three sides, and the crossing is 1/4 of the four-side inventory. Lean proves the half, the crossing, the remainder, and the share.

Octave evaluates (c⁴ / (2G)) (Rs − r₀) as −1.0085463036151720×10⁴⁵ J and −6.0512778216910312×10⁴⁴ J. The energy-page products −5 M c² and −1 M c² differ by −1.585×10²⁹ J and 7.923×10²⁸ J. The four-side comparison differs by −6.338×10²⁹ J and 3.169×10²⁹ J. Each gap is inside 1×10⁻¹⁵ of the larger magnitude. The page keeps both evaluations.

The added tension on the join page is V times the shape tension. The tension factor is therefore 1 + V. Octave prints 1.1881731051507043 at the switch and 1.0000000000000087 at the gate. At the floor, 1 + 3.0232578084704490×10⁻³³ is 1 in float64. No factor converts that 1 + V into joules.

Because E(r) depends on r and on Rs, a clock that holds r fixed changes E by 0. The closed mean rate times the entry time equals the one-side energy times the entry time over the closed ship time: −7.7225912197496652×10³⁸ J and −4.5579641270621957×10³⁸ J, fractions 7.6571508834723282×10⁻⁷ and 7.5322341187575335×10⁻⁷. The hold rate is 0, so those products are not a change in the inventory. The pin is not edited. The reading is in [RESULTS.md](RESULTS.md). The departure is the next section.

## The departure, 2026-11-16

The entry writes V(t) = V_switch exp(−2 (2κ + γ) t) with t in pin-time. One pin-time unit is r₀/c seconds, so the decay in seconds is

λ = 2 (2κ + γ) c / r₀.

Octave prints 1.8829048865070052×10⁷ s⁻¹. The floor recomputed from V_floor = V_switch (roundoff / flux)² is the shutdown time already stamped, 3.8880657558015190×10⁻⁶ s. The seated flux used there is the literal 0.10948671535321428. The graph current is a different object.

At a fixed radius the squared 1 g speed is (g/W − S) / κ(r), where S = c² V b(r) / (2 r³). Lean proves

load / κ − (load − S) / κ = S / κ.

The closed squared speed is the load over κ. A nonnegative static piece removes that much from it. At 40 m, κ = 1/6400 on both mouths, and the closed speed is 79.222824993810960 m/s.

The face radicand reaches 0 when V equals V_gate times the tension ratio already proved, 96/7 on the one-sixth mouth and 32/3 on the half-compact mouth. Lean proves 96/7 > 32/3 > 1. On this decaying V the one-sixth face clears first, then the half-compact face, then the throat. At the throat instant the remaining fraction of the closed squared speed is 1 − 7/96 = 89/96 and 1 − 3/32 = 29/32. Lean proves both.

While the ship is still at the face,

v(t) = v_face √(1 − exp(−λ (t − t₀))),

with t₀ the instant that face's radicand reaches 0. The proper distance from t₀ to the floor is v_face times the integral of the square root. Octave prints 1.8728157745384816×10⁻⁴ m, 1.8622417731044248×10⁻⁴ m, and 1.7626455336844780×10⁻⁴ m. The third distance belongs to a start at the throat instant, and it is the same on both mouths because v_face, that instant, and the floor do not depend on Rs. Dividing by v_face is the face-model gain: 2.3639850948066918×10⁻⁶ s, 2.3506379294728594×10⁻⁶ s, and 2.2249213327373510×10⁻⁶ s.

The infinite-window integral ∫₀^∞ (1 − √(1 − e^{−u})) du, divided by λ, is 3.2593554942009756×10⁻⁸ s. That is the startup spent below the closed face speed. The finite-window gain is the proper distance over v_face.

The coordinate step inward is the proper distance times √(1 − b/40). The schedule credit is the closed-coast time of the shell between that radius and 40 m. The schedule's full crossing is 2 √(W / (2 a)) times one side. This shell is a piece of one side, so the factor is √(W / (2 a)), with the same geom integrand, from s = √(r_fin − r₀) to s = √(r₀). Octave prints 2.3639956658730360×10⁻⁶ s and 2.3506472301665728×10⁻⁶ s for the face-clears, and 2.2249306967009249×10⁻⁶ s and 2.2249296652070691×10⁻⁶ s for a start at the throat instant. Credit minus gain is inside 1×10⁻¹⁰ on each of the four shells. Each credit is positive and shorter than the window from its start to the floor.

The floor plan arrives at the floor time plus the closed ship time. The face-clear plan arrives earlier by its credit. The throat-start plan arrives earlier than the floor plan by the smaller credit, so the face-clear plan arrives first. The closed coasts 2.1294485056590506 s and 2.1647638999709788 s remain the rest of the flight. The coordinate energy depends on r and on Rs. The departure holds the inventory where the inventory page left it. The pin is not edited. The reading is in [RESULTS.md](RESULTS.md).
