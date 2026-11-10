# Two Mouths in One Medium

A reading of the FSOT 20 m gate ledger

**Damian Arthur Palumbo**
2026-11-10
Apache-2.0
Repository: [fsot-stargate](https://github.com/dappalumbo91/fsot-stargate)

This note explains the ledger in two registers at once. The first is ordinary language, through the FSOT unified concept: one medium, tension, leakage, and depth. The second is the mathematics that ledger has already fixed, with each number traced to a proof or to a stamp. A person who wants the picture can read the sections in order and skip the tables. A person who wants the equalities can read the tables and ignore the picture. The two are meant to be the same account.

## How a sentence is marked

Three kinds of sentence stay apart.

A proved identity is an equality accepted by Lean 4.31.0 in [lean/GateLedger.lean](../lean/GateLedger.lean). The file is a ledger. It is not part of `lean_lib FSOT`.

A checked number is a float64 line in the Octave 11.3.0 stamp [data/dial_gate_stamp.txt](../data/dial_gate_stamp.txt). A residual of 0 is the passing line. Where a residual is named, that residual is the result.

A reading is the unified concept applied to those identities. The reading says what the mathematics is about in the language of one medium. It does not add a constant, and it does not replace a proved equality.

The pin is FSOT 2.1, hash beginning AEB2AD. The pin files are read. They are not edited by this ledger.

## One medium

Fluid Spacetime Theory treats the world as one continuous medium. The medium has a resting tension, a thickness, and a flow. An object is a place where that medium has condensed. A thin ripple, almost without drag, is light. A thick ripple, bound to matter, is sound. What appears as a separate force is a behavior of the same medium: a flow, an oscillation, a loss of order, or a tight resonance deep in the medium.

Two principles run through the picture. Everything affects everything else. And a pattern at one zoom level shows up again at another. Depth, in this account, is that zoom. It is a closer or a wider reading of the same medium.

A current can join two places by running through depth while the surface between them stays quiet. That is the unified concept's account of entanglement. The two places share a current. They are not required to pass a message along the surface that separates them.

The ledger keeps a sharper line under that sentence. A shared quantum state correlates the outcomes at the two ends. The correlation by itself does not carry a signal, a mass, or a ship. Maldacena and Susskind, Fortschr. Phys. 61 (2013) 781, arXiv:1306.0533, relate entanglement to a wormhole. That paper is a citation in this ledger. The mechanism used here is the seated scalar law below.

## Two mouths

The system on this ledger is two mouths in that one medium. Each mouth has a throat 20 m across. The corridor that joins them has a shape, a call, and a clock.

The shape is

b(r) = Rs + (r₀ − Rs) r₀ / r,

with r₀ = 20 m. Two compactness choices are carried. The one-sixth mouth has Rs = r₀/6 = 10/3 m. The half-compact mouth has Rs = 10 m. At the throat, b equals 20 m. Far from the throat, b approaches Rs. Lean proves that this inverse-power form is the unique A + B/r with those two end values.

The redshift along the corridor is 0. In ordinary language, the corridor has thickness and it has no extra climb. A radial light ray has proper-distance speed c. Its coordinate speed dr/dt is c times the square root of 1 − b(r)/r. That coordinate speed is 0 at the throat, and the circumferential radius climbs again on the far side of the throat.

In the unified-concept language, b(r) is the thickness profile of the corridor. The positive mouth mass

M = Rs c² / (2G)

is the condensation the corridor approaches far out. The constants are the ledger pair, c = 299792458 m/s and G = 6.67430×10⁻¹¹ m³ kg⁻¹ s⁻², written exactly as 66743/10¹⁵. The one-sixth mouth mass is the rational 449377589368408820000000000000000/200229 kg. Its float64 evaluation is 2.2443182025001816×10²⁷ kg, one unit in the last place above the float of that rational. The half-compact mouth mass is 449377589368408820000000000000000/66743 kg, and its float matches the rational.

## The call

Each mouth carries a scalar. The scalar is the reading of how the medium sits at that end. The seated pair is quantum optics and quantum computing, both at depth 8.

The optics equilibrium is E_o = 0.9536594523121079. The computing equilibrium is E_c = −0.6526335205358984. The leak between them is κ = 0.10001300937604073. The restoring rate that pulls each mouth toward its own equilibrium is γ = 0.4280434460598068.

The law of the pair is

dS₁/dt = κ (S₂ − S₁) − γ (S₁ − E₁),

and the same law with the labels swapped.

Read that as a current in one medium. The first term is leakage. When the other mouth sits higher, this mouth is drawn toward it. The second term is tension. Each mouth is drawn back toward the value that belongs to it. The direction of the settled current follows which equilibrium is higher. With κ and γ positive, Lean proves that the settled flux has the sign of E₁ − E₂, and that equal equilibria give flux 0.

On this pair the settled difference is 1.0947247366745378 and the settled flux is 0.10948671535321428. The open-page steady scalars are 0.6978753342253736 and −0.39684940244916417.

The same law is the downhill slope of a potential,

V = (γ/2) (S₁ − E₁)² + (γ/2) (S₂ − E₂)² + (κ/2) (S₁ − S₂)².

Expanding the last square produces the product −κ S₁ S₂. The two mouths pull on each other with coefficient −κ. On the seated pair that coefficient is −0.10001300937604073. The pin source has no parameter named h. The coefficient is the leak that was already seated. The shutdown section names that coefficient h.

While the equilibria differ, the settled value of V is 0.08793387074603902. When the equilibria match, V is 0. V is the tension-plus-leak accounting of the scalar channel. It is dimensionless. The joule inventory in the next section is a different object, the integral of the shape density. No conversion is pasted from one onto the other.

Set both equilibria to one common value and the current returns to rest. Along that path the difference decays as exp(−(2κ + γ) t) and the offset of the sum decays as exp(−γ t). The integral of V from the seated sum down to either common equilibrium is (gap² + Δ²) / 8 = 0.47232492046350283. The seated flux falls to the open-page roundoff 1.3877787807814457×10⁻¹⁷ in 3.888065755801519×10⁻⁶ s on the map-page clock. One pin-time unit on that clock is 20/299792458 s.

In the unified concept, κ is leakage between scales and γ is the medium pulling each condensate back into its own phase. A gap that remains between the two equilibria is an opening that stays up. Removing the gap returns the current to rest. Four requirements sit on this ledger together. The direction follows the caller, and it reverses when the gap reverses. The opening stays up while the equilibria differ. The return to rest is the shutdown path just written. The crossing on a clock in seconds is the coast in the section after the energy.

The eight-sector clock in the pin sets each sector's equilibrium to that sector's own scalar. Seven steps of that clock leave all 35 observed flags where they started. The shutdown substitution, both equilibria set equal, is a derived path. That clock does not apply it. The shutdown section runs the substitution on the clock's output.

At depth 8, optics, acoustics, materials science, and quantum optics share 0.9536594523121079, and quantum computing carries the closed scalar. Any two of the four observed names have flux 0, because their equilibria match. At depth 5 the two named domains, particle physics and quantum mechanics, both carry the open scalar 0.9501974701670142, so their flux is 0. The closed depth-5 value −0.6456729548144859 has no domain name in the observed list. The shutdown section names that reading.

## The corridor and its energy

A throat that flares, in the sense used here, asks the energy accounting to go negative. Morris and Thorne, Am. J. Phys. 56, 395 (1988), give the classical statement. The flare used on this ledger is (b − b′ r) / (2 b²) > 0. At the throat that condition is b′(r₀) < 1. The slopes here are −5/6 and −1/2. The combination b′ r − b equals −Rs − 2 (r₀ − Rs) r₀ / r, and Lean proves that this quantity is negative at every positive radius when 0 < Rs < r₀.

The energy density of the shape, in pascals, is

ρ(r) = b′(r) c⁴ / (8 π G r²).

A pascal is a joule per cubic meter, so ρ is an energy density directly. At the throat it is −1.003219559733838×10⁴⁰ Pa on the one-sixth mouth and −6.019317358403028×10³⁹ Pa on the half-compact mouth. The radial tension at the throat is 1.2038634716806056×10⁴⁰ Pa on both mouths. In the unified-concept reading, a negative density is the medium thinned below its resting accounting. That thinning is what lets the corridor open.

The thinning eases quickly. Lean proves that the density at radius r is the throat density times (r₀/r)⁴. At 40 m the factor is 1/16. The radial tension scales as (b(r)/r₀) (r₀/r)³, which is 7/96 of the throat tension on the one-sixth mouth and 3/32 on the half-compact mouth. At 40 m, ρ − τ = −1.5048293396007570×10³⁹ Pa on both mouths, which is −1/8 of the throat tension.

The coordinate integral of ρ from the throat to infinity, on one side, is already an energy:

E = (c⁴ / (2G)) (Rs − r₀).

Divided by c², the same integral is the exotic mass on the solve page. That mass is −5 M on one side of the one-sixth mouth and −1 M on one side of the half-compact mouth. Multiplying back by c² returns the energy. Lean proves both the integral form and the six rationals below. One mouth has two sides. Two mouths of one kind, the joined pair, have four sides.

| Extent | One-sixth | Half-compact |
| --- | ---: | ---: |
| One side | −201940217826562255731595018653792400000000000000000/200229 J | −40388043565312451146319003730758480000000000000000/66743 J |
| One mouth | −403880435653124511463190037307584800000000000000000/200229 J | −80776087130624902292638007461516960000000000000000/66743 J |
| Two mouths | −807760871306249022926380074615169600000000000000000/200229 J | −161552174261249804585276014923033920000000000000000/66743 J |

The stamp multiplies the float64 exotic mass by c². On the one-sixth mouth the products match the float of the rational. On the half-compact mouth each product sits one unit in the last place above the float of the rational.

| Extent | One-sixth float64 | Half-compact float64 |
| --- | ---: | ---: |
| One side | −1.0085463036151718×10⁴⁵ J | −6.0512778216910320×10⁴⁴ J |
| One mouth | −2.0170926072303437×10⁴⁵ J | −1.2102555643382064×10⁴⁵ J |
| Two mouths | −4.0341852144606874×10⁴⁵ J | −2.4205111286764128×10⁴⁵ J |

The proper volume follows the longer path through the flare, dl = dr / √(1 − b/r). On one side the proper mass is M times −2√30 atan(√30/6) for the one-sixth mouth and M times −2√2 atan(√2/2) for the half-compact mouth. Those factors are −8.1049877998325334897 and −1.7408395027342063949. The proper energy is that mass times c². The stamp multiplies the float64 proper mass by c². The proper inventory is larger in magnitude than the coordinate inventory because the proper volume weights the throat, where the thinning is strongest.

| Extent | One-sixth float64 | Half-compact float64 |
| --- | ---: | ---: |
| One side | −1.6348510972734333×10⁴⁵ J | −1.0534303474019149×10⁴⁵ J |
| One mouth | −3.2697021945468666×10⁴⁵ J | −2.1068606948038297×10⁴⁵ J |
| Two mouths | −6.5394043890937331×10⁴⁵ J | −4.2137213896076594×10⁴⁵ J |

Read the sign in the same language as the density. The corridor's energy accounting sits below the resting medium. The number is the size of that deficit. It is an inventory. The scalar channel tells how fast the reading returns, a few millionths of a second. That time belongs to V. It does not supply a wattage for the geometric deficit, and this paper does not divide the joules by that time.

For scale inside the ledger itself: one side of the one-sixth corridor holds five times the rest energy of its own positive mouth mass, with a minus sign. One side of the half-compact corridor holds one times the rest energy of its mouth mass, with a minus sign. The joined one-sixth pair holds twenty of those mouth rest energies, negative. The rest energy of one kilogram, at this c, is c² = 89875517873681764 J.

## Crossing on a clock

The proper length from the 40 m face on one side, through the throat, to the 40 m face on the other side is 71.88977393130973 m on the one-sixth pair and 78.15551629331567 m on the half-compact pair.

The coast on the ledger is the lateral-load coast. Its speed at each radius is the speed whose sideways squeeze stays at the load already scored. A 10 m ship that holds both accelerations at 9.80665 m/s² crosses those faces in 2.1294485057269195 s and 2.1647639000180656 s. Those times are the 400000-step trapezoid. They stay.

On a flat steady coast the pin's momentum balance says the pressure gradient equals the observer source. That source is J = 0.0794560282152649 on the observed branch and 0 on the unobserved branch. Every constant speed satisfies the same balance. J is a pressure condition of that balance. The ship speed on the ledger is the lateral-load speed.

In the unified-concept language, the sideways squeeze is the viscosity of the corridor acting on a body that has width. The scalar flux is the current between the two readings. The pressure balance is the medium's response when the branch is observed. Each one has its own units, and each one stays in those units.

A walking pace covers the same proper length in about a minute, because a walking pace is slow on a corridor of about 70 m. The crossing that uses the corridor at the load it can carry is the propelled coast, about two seconds from face to face.

## What was checked

Lean 4.31.0 accepted the throat value of the shape, the slopes −5/6 and −1/2, the coordinate ratios −5 and −1, the six coordinate masses, the sign of the settled flux, the potential and its product coefficient −κ, the shutdown integral, the unique inverse-power shape, the density factor (r₀/r)⁴, the 40 m tension ratios 7/96 and 3/32, the negative sign of b′ r − b, the steady balance of pressure gradient and observer source, the six coordinate energies, the half-energy at 40 m, κ(40 m) = 1/6400, the critical-point polynomials of the two supply rates, the product written as −h with h = κ, the cancellation on one undirected edge, and the integral of one decay mode.

Octave 11.3.0 rewrote the stamp with 0 failures, including the twelve energy lines, the supply-rate lines, and the shutdown lines. MATLAB R2026b is installed. `matlab -batch` exits with Licensing Error 1, code −1.2, because no license file is on the search path. Octave is the checker that ran.

The constants c and G are the gate pair above. The parent shell's route pair is a different pair and is not mixed into these joules.

## The supply rate

The energy at radius r, on one side, is the integral of the density from the throat out to that radius:

E(r) = (c⁴ / (2G)) (b(r) − r₀).

This is a function of radius. A clock that leaves the radius fixed sees no change, so the hold rate is 0. The corridor, once the shape is present, does not ask for a continuing burn.

A crossing does sweep the deficit. Along an outward ray,

dE/dt = (c⁴ / (2G)) b′(r) dr/dt.

The shape's own radial light ray has dr/dt = c √(1 − b/r). That sweep rate peaks a few meters outside the throat, at 24.540854963686442 m on the one-sixth mouth and 24.663649828320295 m on the half-compact mouth. The signed peaks are −5.5967323357299716×10⁵¹ W and −3.0748636696503162×10⁵¹ W. The supply that meets the sweep is the positive magnitude.

The published coast is slower than light by v(r)/c, and its sweep rate is the null rate times that factor. The coast peaks at 64.523317740912603 m and 47.871228950239384 m, with signed rates −8.8645790720056626×10⁴⁴ W and −4.7969358278401484×10⁴⁴ W.

At the 40 m face, each side holds exactly half of its infinite-arm energy. The two faces of one crossing therefore sweep one infinite-arm side. The mean rate over the published ship time is −4.7361854531950252×10⁴⁴ W on the one-sixth pair and −2.7953523345619962×10⁴⁴ W on the half-compact pair. In the unified-concept reading, this is the rate at which the thinning is gathered as a body moves through the corridor. It is the sweep of an inventory that is already there. The hold, with nobody moving and the radius fixed, remains 0.

The same page evaluates the proper-mass integrand that had been left as an unevaluated integral. From zero to infinity it equals √10 atan(√30/6) / 100 on the one-sixth mouth and √2 atan(√2/2) / 20 on the half-compact mouth.

## The shutdown

The eight sectors come back from the clock with mean 0.73407640288136422. The shutdown sets every equilibrium to that one number and keeps the same linear law. The mean stays, because the two rates on an undirected edge cancel. The largest edge current starts at 0.069999121186276561 and falls to the open-page roundoff in 4.6174303925072154×10⁻⁶ s. The integral of the potential along that return is 0.42911086091120682.

In the unified-concept reading, this is the medium letting every condensate settle to one shared phase once the call is over. While each sector keeps its own phase, thirteen edges still carry a steady leak. The largest of those leaks is 0.058061061286508266. Moving only the gravity sector onto the shared phase leaves a largest leak of 0.014485873046876672. The return to rest uses all eight.

The closed number at depth 5, −0.6456729548144859, is the unobserved reading of particle physics and of quantum mechanics. Both names return it. The open reading of those same names is 0.9501974701670142. The seated pair is those two readings. Its leakage κ is 0.0985871397275971, and that leakage is the gate's h on the pair. The optics–computing h is 0.10001300937604073. The two mouths pull on each other with coefficient −h.

Gao, Jafferis, and Wall write the same slot as −h times the product of the two boundary operators, and they find that a positive h makes the horizon null energy negative. The value here is the κ already on the pair. The pin files were not edited.

## What is still open

The ship times remain the 400000-step trapezoid. The coast remains the lateral-load coast. MATLAB R2026b still has no license file. Octave is the checker that ran.

The throat stays at 20 m. The redshift stays 0. The shape stays b(r).

## Where the numbers live

The chain, the proofs, and the stamp are in this repository. [docs/RESULTS.md](RESULTS.md) holds the tables. [docs/METHOD.md](METHOD.md) holds the derivations. [docs/AUDIT.md](AUDIT.md) holds the check record. [README.md](../README.md) holds the short form of each page. The one-page claim is [docs/CLAIM.md](CLAIM.md). The unified concept used as the lens is the note *Fluid Spacetime Theory, The Unified Concept*, by the same author. That note is the picture. This paper is the picture applied to the numbers the ledger has fixed.
