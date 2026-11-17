/-
Copyright 2026 Damian Arthur Palumbo
SPDX-License-Identifier: Apache-2.0
-/

import Mathlib.Tactic.FieldSimp
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.NormNum
import Mathlib.Tactic.Ring

/-
Gate ledger. Not part of `lean_lib FSOT`.

The shape, the lateral coefficient, the proper-length radicand, the load
identity, the mouth masses, the cavity against both horizons, the
size of γ² − 1, the coordinate ratios (Rs − r₀)/Rs, the sign of the
settled two-mouth flux, the potential whose gradient is that law, the
radial density factor (r₀/r)⁴, the coordinate energy of the exotic
mass, the half-energy at r = 2 r₀, the critical-point polynomials
of the null and coast supply rates, the opening coefficient h = κ
in the two-mouth potential, the cancellation on one undirected edge,
and the integral of one decay mode, and the join of the
dimensionless potential to the shape: the pole weights 3/11 and 1/3
and the residue 1/2. The entry writes the seated shutdown into that join.
The switch potential is γ/(2κ) times the seated potential, and the throat
gate is the load g/10. The inventory writes the one-side energy as the
infinite-arm side times (1 − r₀/r). The face and the outer arm are equal,
and the crossing is one side of four. The departure scores the face
leaving while V falls. At the throat gate the face keeps 89/96 and
29/32 of its closed squared speed, the face potentials stand in the
order 96/7 > 32/3 > 1, and a positive press removes S/κ from the
squared speed. The release integrates the added tension out to the
40 m face. The integrand splits as Rs/r + (r₀ − Rs) r₀/r². The
rational piece at that face is (r₀ − Rs)/2, equal to 25/3 on the
one-sixth mouth and 5 on the half-compact mouth. The level coast
holds the face speed. The throat load over the 40 m load is 44/3
on the one-sixth mouth and 12 on the half-compact mouth, and the
1 g beam at that speed is 15/22 m and 5/6 m. On that beam the
lateral load at fixed speed scales as κ(r)/κ(r₀). The face ratios
are 3/44 and 1/12, the 25 m ratios are 576/1375 and 832/1875, and
the 30 m ratios are 184/891 and 56/243. The 400000-step
crossings stay with the Octave log.
The Einstein tensor of a shell stays with the Warp Factory logs.
The pin is not an input.
-/

set_option maxHeartbeats 8000000

namespace GateLedger

def r0 : ℚ := 20
def rsSixth : ℚ := r0 / 6
def rsHalf : ℚ := r0 / 2
def gStd : ℚ := 980665 / 100000
def cLight : ℚ := 299792458
def GNewt : ℚ := 66743 / 10 ^ 15

def shape (Rs r : ℚ) : ℚ := Rs + (r0 - Rs) * r0 / r

def shapeSlope (Rs r : ℚ) : ℚ := -((r0 - Rs) * r0) / r ^ 2

def kappa (Rs r : ℚ) : ℚ := Rs / (2 * r ^ 3) + (r0 - Rs) * r0 / r ^ 4

def aCoeff (Rs : ℚ) : ℚ := Rs / (2 * r0)

def dCoeff (Rs : ℚ) : ℚ := 1 - aCoeff Rs

/-- `M = C R c² / (2G)`, the Warp Factory pair. -/
def compactMass (C R : ℚ) : ℚ := C * R * cLight ^ 2 / (2 * GNewt)

theorem shape_at_throat (Rs : ℚ) : shape Rs r0 = r0 := by
  unfold shape r0
  field_simp
  ring

theorem coordinate_factor_zero (Rs : ℚ) : 1 - shape Rs r0 / r0 = 0 := by
  have h : shape Rs r0 = r0 := shape_at_throat Rs
  rw [h]
  field_simp [r0]
  ring

theorem slope_sixth : shapeSlope rsSixth r0 = -5 / 6 := by
  unfold shapeSlope rsSixth r0
  norm_num

theorem slope_half : shapeSlope rsHalf r0 = -1 / 2 := by
  unfold shapeSlope rsHalf r0
  norm_num

theorem flare_sixth : (1 - shapeSlope rsSixth r0) / (2 * r0) = 11 / 240 := by
  unfold shapeSlope rsSixth r0
  norm_num

theorem flare_half : (1 - shapeSlope rsHalf r0) / (2 * r0) = 3 / 80 := by
  unfold shapeSlope rsHalf r0
  norm_num

theorem slopes_negative :
    shapeSlope rsSixth r0 < 0 ∧ shapeSlope rsHalf r0 < 0 := by
  unfold shapeSlope rsSixth rsHalf r0
  norm_num

theorem flare_positive :
    0 < (1 - shapeSlope rsSixth r0) / (2 * r0) ∧
      0 < (1 - shapeSlope rsHalf r0) / (2 * r0) := by
  unfold shapeSlope rsSixth rsHalf r0
  norm_num

theorem kappa_sixth : kappa rsSixth r0 = 11 / 4800 := by
  unfold kappa rsSixth r0
  norm_num

theorem kappa_half : kappa rsHalf r0 = 3 / 1600 := by
  unfold kappa rsHalf r0
  norm_num

/-- Morris–Thorne lateral coefficient, redshift zero, gamma omitted. -/
theorem kappa_is_lateral (Rs r : ℚ) (hr : r ≠ 0) :
    (shape Rs r / r - shapeSlope Rs r) / (2 * r ^ 2) = kappa Rs r := by
  unfold shape shapeSlope kappa r0
  field_simp
  ring

theorem radicand (Rs r : ℚ) (hr : r ≠ 0) :
    (1 - shape Rs r / r) * (r / r0) ^ 2 =
      (r / r0 - aCoeff Rs) ^ 2 - dCoeff Rs ^ 2 := by
  simp only [shape, dCoeff, aCoeff, r0]
  field_simp
  ring

theorem gap_split (Rs r : ℚ) :
    r ^ 2 - Rs * r - (r0 - Rs) * r0 = (r - r0) * (r + r0 - Rs) := by
  unfold r0
  ring

theorem shape_below {Rs r : ℚ} (hr : r0 < r) (hRs : Rs < r + r0) (h0 : 0 < r) :
    shape Rs r < r := by
  unfold shape
  have hsplit : r ^ 2 - Rs * r - (r0 - Rs) * r0 = (r - r0) * (r + r0 - Rs) := gap_split Rs r
  have hdiff : r - (Rs + (r0 - Rs) * r0 / r) =
      (r ^ 2 - Rs * r - (r0 - Rs) * r0) / r := by
    field_simp
    ring
  have h1 : 0 < r - r0 := sub_pos.mpr hr
  have h2 : 0 < r + r0 - Rs := by linarith
  have hpos : 0 < r - (Rs + (r0 - Rs) * r0 / r) := by
    rw [hdiff, hsplit]
    exact div_pos (mul_pos h1 h2) h0
  linarith

theorem exotic_sixth : (1 - shapeSlope rsSixth r0) / (-shapeSlope rsSixth r0) = 11 / 5 := by
  unfold shapeSlope rsSixth r0
  norm_num

theorem exotic_half : (1 - shapeSlope rsHalf r0) / (-shapeSlope rsHalf r0) = 3 := by
  unfold shapeSlope rsHalf r0
  norm_num

theorem load_is_g (κ W : ℚ) (hκ : κ ≠ 0) (hW : W ≠ 0) :
    κ * (gStd / (κ * W)) * W = gStd := by
  field_simp

theorem width_is_load (κ v : ℚ) (hκ : κ ≠ 0) (hv : v ≠ 0) :
    κ * (gStd / (κ * v ^ 2)) * v ^ 2 = gStd := by
  field_simp

theorem pace_scale (κ W1 W2 : ℚ) (hκ : κ ≠ 0) (h1 : W1 ≠ 0) (h2 : W2 ≠ 0)
    (hg : gStd ≠ 0) : (gStd / (κ * W1)) / (gStd / (κ * W2)) = W2 / W1 := by
  field_simp

theorem rest_square (D : ℚ) (hg : gStd ≠ 0) :
    gStd * (4 * (D / gStd)) = 4 * D := by
  field_simp

theorem sixth_mass_exact :
    compactMass (1 / 6) 20 = 449377589368408820000000000000000 / 200229 := by
  unfold compactMass cLight GNewt
  norm_num

theorem half_mass_exact :
    compactMass (1 / 2) 20 = 449377589368408820000000000000000 / 66743 := by
  unfold compactMass cLight GNewt
  norm_num

theorem two_meter_is_tenth (C : ℚ) :
    compactMass C 2 = compactMass C 20 / 10 := by
  unfold compactMass
  field_simp
  ring

theorem sixth_two_meter :
    compactMass (1 / 6) 2 = 44937758936840882000000000000000 / 200229 := by
  unfold compactMass cLight GNewt
  norm_num

theorem half_two_meter :
    compactMass (1 / 2) 2 = 44937758936840882000000000000000 / 66743 := by
  unfold compactMass cLight GNewt
  norm_num

/-- Printed map-page ell. The cavity built from it is a candidate, not a throat. -/
def ellPrinted : ℚ := 8573494832025231 / 10 ^ 16

def cavity : ℚ := r0 * (1 - ellPrinted)

/-- γ² − 1 = v² / (c² − v²). -/
def gammaSqMinus (vSq : ℚ) : ℚ := vSq / (cLight ^ 2 - vSq)

theorem horizons_are_compactness :
    rsSixth = (10 : ℚ) / 3 ∧ rsHalf = 10 := by
  unfold rsSixth rsHalf r0
  norm_num

theorem cavity_exact :
    cavity = 1426505167974769 / 500000000000000 := by
  unfold cavity ellPrinted r0
  norm_num

theorem cavity_inside_horizons :
    cavity < (10 : ℚ) / 3 ∧ cavity < (10 : ℚ) := by
  unfold cavity ellPrinted r0
  norm_num

/-- A positive prefactor, c⁴ / (8 π G r₀²) included, keeps the sign of b'. -/
theorem density_sign_follows_slope {pref Rs : ℚ} (hp : 0 < pref) :
    pref * shapeSlope Rs r0 < 0 ↔ shapeSlope Rs r0 < 0 := by
  constructor
  · intro h
    by_contra hn
    have : 0 ≤ pref * shapeSlope Rs r0 := mul_nonneg (le_of_lt hp) (le_of_not_gt hn)
    linarith
  · intro h
    exact mul_neg_of_pos_of_neg hp h

theorem sixth_density_negative {pref : ℚ} (hp : 0 < pref) :
    pref * shapeSlope rsSixth r0 < 0 := by
  rw [density_sign_follows_slope hp, slope_sixth]
  norm_num

theorem gamma_walk : gammaSqMinus 400 < 1 / 10 ^ 14 := by
  unfold gammaSqMinus cLight
  norm_num

theorem gamma_face : gammaSqMinus 6400 < 1 / 10 ^ 12 := by
  unfold gammaSqMinus cLight
  norm_num

theorem gamma_width : gammaSqMinus 100000000 < 2 / 10 ^ 9 := by
  unfold gammaSqMinus cLight
  norm_num

/-- One side, coordinate volume. (Rs − r₀) / Rs. -/
theorem sixth_coordinate_ratio : (rsSixth - r0) / rsSixth = -5 := by
  unfold rsSixth r0
  norm_num

theorem half_coordinate_ratio : (rsHalf - r0) / rsHalf = -1 := by
  unfold rsHalf r0
  norm_num

theorem sixth_coordinate_one_side :
    compactMass (1 / 6) 20 * ((rsSixth - r0) / rsSixth) =
      -2246887946842044100000000000000000 / 200229 := by
  unfold compactMass rsSixth r0 cLight GNewt
  norm_num

theorem half_coordinate_one_side :
    compactMass (1 / 2) 20 * ((rsHalf - r0) / rsHalf) =
      -449377589368408820000000000000000 / 66743 := by
  unfold compactMass rsHalf r0 cLight GNewt
  norm_num

theorem sixth_coordinate_mouth :
    2 * (compactMass (1 / 6) 20 * ((rsSixth - r0) / rsSixth)) =
      -4493775893684088200000000000000000 / 200229 := by
  unfold compactMass rsSixth r0 cLight GNewt
  norm_num

theorem half_coordinate_mouth :
    2 * (compactMass (1 / 2) 20 * ((rsHalf - r0) / rsHalf)) =
      -898755178736817640000000000000000 / 66743 := by
  unfold compactMass rsHalf r0 cLight GNewt
  norm_num

theorem sixth_coordinate_pair :
    4 * (compactMass (1 / 6) 20 * ((rsSixth - r0) / rsSixth)) =
      -8987551787368176400000000000000000 / 200229 := by
  unfold compactMass rsSixth r0 cLight GNewt
  norm_num

theorem half_coordinate_pair :
    4 * (compactMass (1 / 2) 20 * ((rsHalf - r0) / rsHalf)) =
      -1797510357473635280000000000000000 / 66743 := by
  unfold compactMass rsHalf r0 cLight GNewt
  norm_num

/-- Settled flux κ [γ / (2κ + γ)] (E₁ − E₂). -/
def steadyFlux (κ γ E1 E2 : ℚ) : ℚ :=
  κ * γ * (E1 - E2) / (2 * κ + γ)

theorem rate_positive {κ γ : ℚ} (hk : 0 < κ) (hg : 0 < γ) : 0 < 2 * κ + γ := by
  linarith

theorem equal_equilibria (κ γ E : ℚ) (h : 2 * κ + γ ≠ 0) : steadyFlux κ γ E E = 0 := by
  unfold steadyFlux
  rw [div_eq_iff h]
  ring

theorem flux_follows_gap {κ γ E1 E2 : ℚ} (hk : 0 < κ) (hg : 0 < γ) (hE : E2 < E1) :
    0 < steadyFlux κ γ E1 E2 := by
  unfold steadyFlux
  have hden : 0 < 2 * κ + γ := by linarith
  have hgap : 0 < E1 - E2 := by linarith
  have hnum : 0 < κ * γ * (E1 - E2) := mul_pos (mul_pos hk hg) hgap
  exact div_pos hnum hden

/-- V = γ/2 (S₁−E₁)² + γ/2 (S₂−E₂)² + κ/2 (S₁−S₂)². -/
def mouthPotential (κ γ E1 E2 S1 S2 : ℚ) : ℚ :=
  γ / 2 * (S1 - E1) ^ 2 + γ / 2 * (S2 - E2) ^ 2 + κ / 2 * (S1 - S2) ^ 2

theorem product_coefficient (κ γ E1 E2 S1 S2 : ℚ) :
    mouthPotential κ γ E1 E2 S1 S2 =
      γ / 2 * (S1 - E1) ^ 2 + γ / 2 * (S2 - E2) ^ 2 +
        κ / 2 * S1 ^ 2 + κ / 2 * S2 ^ 2 - κ * S1 * S2 := by
  unfold mouthPotential
  ring

theorem gradient_is_two_mouth (κ γ E1 E2 S1 S2 : ℚ) :
    -(γ * (S1 - E1) + κ * (S1 - S2)) = κ * (S2 - S1) - γ * (S1 - E1) ∧
      -(γ * (S2 - E2) + κ * (S2 - S1)) = κ * (S1 - S2) - γ * (S2 - E2) := by
  constructor <;> ring

theorem steady_potential (κ γ E1 E2 : ℚ) (hr : 2 * κ + γ ≠ 0) :
    mouthPotential κ γ E1 E2
        (E1 - κ * (E1 - E2) / (2 * κ + γ))
        (E2 + κ * (E1 - E2) / (2 * κ + γ)) =
      κ * γ * (E1 - E2) ^ 2 / (2 * (2 * κ + γ)) := by
  unfold mouthPotential
  field_simp
  ring

theorem shutdown_action (S1 S2 E : ℚ) :
    ((S1 + S2 - 2 * E) ^ 2 + (S1 - S2) ^ 2) / 8 =
      ((S1 - E) ^ 2 + (S2 - E) ^ 2) / 4 := by
  ring

theorem inverse_power_unique (Rs A B r : ℚ) (hr : r ≠ 0)
    (hThroat : A + B / r0 = r0) (hFar : A = Rs) :
    A + B / r = shape Rs r := by
  have hB : B = (r0 - Rs) * r0 := by
    rw [hFar] at hThroat
    have hr0 : (r0 : ℚ) ≠ 0 := by unfold r0; norm_num
    field_simp at hThroat
    linarith
  rw [hFar, hB]
  unfold shape
  field_simp [hr]

theorem slope_scales (Rs r : ℚ) (hr : r ≠ 0) :
    shapeSlope Rs r = shapeSlope Rs r0 * (r0 ^ 2 / r ^ 2) := by
  unfold shapeSlope
  have hr0 : (r0 : ℚ) ≠ 0 := by unfold r0; norm_num
  field_simp [hr, hr0]

theorem density_scales (Rs r : ℚ) (hr : r ≠ 0) (hs : shapeSlope Rs r0 ≠ 0) :
    (shapeSlope Rs r / r ^ 2) / (shapeSlope Rs r0 / r0 ^ 2) = (r0 / r) ^ 4 := by
  rw [slope_scales Rs r hr]
  have hr0 : (r0 : ℚ) ≠ 0 := by unfold r0; norm_num
  field_simp [hs, hr, hr0]

theorem density_at_forty (Rs : ℚ) (hs : shapeSlope Rs r0 ≠ 0) :
    (shapeSlope Rs 40 / 40 ^ 2) / (shapeSlope Rs r0 / r0 ^ 2) = 1 / 16 := by
  have hr : (40 : ℚ) ≠ 0 := by norm_num
  rw [density_scales Rs 40 hr hs]
  unfold r0
  norm_num

theorem tension_ratio_forty_sixth :
    (shape rsSixth 40 / r0) * (r0 / 40) ^ 3 = 7 / 96 := by
  unfold shape rsSixth r0
  norm_num

theorem tension_ratio_forty_half :
    (shape rsHalf 40 / r0) * (r0 / 40) ^ 3 = 3 / 32 := by
  unfold shape rsHalf r0
  norm_num

theorem nec_numerator (Rs r : ℚ) (hr : r ≠ 0) :
    shapeSlope Rs r * r - shape Rs r = -Rs - 2 * (r0 - Rs) * r0 / r := by
  unfold shapeSlope shape
  field_simp
  ring

theorem nec_negative {Rs r : ℚ} (hr : 0 < r) (hRs : 0 < Rs) (hcmp : Rs < r0) :
    shapeSlope Rs r * r - shape Rs r < 0 := by
  have hr0 : (0 : ℚ) < r0 := by unfold r0; norm_num
  have hgap : 0 < r0 - Rs := sub_pos.mpr hcmp
  have hterm : 0 < 2 * (r0 - Rs) * r0 / r :=
    div_pos (mul_pos (mul_pos (by norm_num) hgap) hr0) hr
  rw [nec_numerator Rs r (ne_of_gt hr)]
  linarith

theorem nec_face (Rs : ℚ) :
    shapeSlope Rs (2 * r0) * (2 * r0) - shape Rs (2 * r0) = -r0 := by
  have hr : (2 * r0 : ℚ) ≠ 0 := by unfold r0; norm_num
  rw [nec_numerator Rs (2 * r0) hr]
  unfold r0
  field_simp
  ring

theorem nec_face_ratio (Rs : ℚ) :
    r0 ^ 2 / (2 * r0) ^ 3 * (shapeSlope Rs (2 * r0) * (2 * r0) - shape Rs (2 * r0)) =
      -1 / 8 := by
  rw [nec_face]
  unfold r0
  norm_num

/-- Flat steady coast: ∂t v = 0 and vanishing velocity derivatives give ∂x P = J. -/
theorem steady_balance (ρ dP J : ℚ) (hρ : ρ ≠ 0) :
    -dP / ρ + J / ρ = 0 ↔ dP = J := by
  constructor
  · intro h
    field_simp at h
    linarith
  · intro h
    rw [h]
    field_simp
    ring

/-- One side, coordinate energy: (c⁴ / (2G)) (Rs − r₀) = exotic mass × c². -/
theorem sixth_energy_integral :
    cLight ^ 4 / (2 * GNewt) * (rsSixth - r0) =
      compactMass (1 / 6) 20 * ((rsSixth - r0) / rsSixth) * cLight ^ 2 := by
  unfold compactMass rsSixth r0 cLight GNewt
  field_simp

theorem half_energy_integral :
    cLight ^ 4 / (2 * GNewt) * (rsHalf - r0) =
      compactMass (1 / 2) 20 * ((rsHalf - r0) / rsHalf) * cLight ^ 2 := by
  unfold compactMass rsHalf r0 cLight GNewt
  field_simp

theorem sixth_energy_one_side :
    compactMass (1 / 6) 20 * ((rsSixth - r0) / rsSixth) * cLight ^ 2 =
      -201940217826562255731595018653792400000000000000000 / 200229 := by
  rw [sixth_coordinate_one_side]
  unfold cLight
  norm_num

theorem half_energy_one_side :
    compactMass (1 / 2) 20 * ((rsHalf - r0) / rsHalf) * cLight ^ 2 =
      -40388043565312451146319003730758480000000000000000 / 66743 := by
  rw [half_coordinate_one_side]
  unfold cLight
  norm_num

theorem sixth_energy_mouth :
    2 * (compactMass (1 / 6) 20 * ((rsSixth - r0) / rsSixth) * cLight ^ 2) =
      -403880435653124511463190037307584800000000000000000 / 200229 := by
  rw [sixth_coordinate_one_side]
  unfold cLight
  norm_num

theorem half_energy_mouth :
    2 * (compactMass (1 / 2) 20 * ((rsHalf - r0) / rsHalf) * cLight ^ 2) =
      -80776087130624902292638007461516960000000000000000 / 66743 := by
  rw [half_coordinate_one_side]
  unfold cLight
  norm_num

theorem sixth_energy_pair :
    4 * (compactMass (1 / 6) 20 * ((rsSixth - r0) / rsSixth) * cLight ^ 2) =
      -807760871306249022926380074615169600000000000000000 / 200229 := by
  rw [sixth_coordinate_one_side]
  unfold cLight
  norm_num

theorem half_energy_pair :
    4 * (compactMass (1 / 2) 20 * ((rsHalf - r0) / rsHalf) * cLight ^ 2) =
      -161552174261249804585276014923033920000000000000000 / 66743 := by
  rw [half_coordinate_one_side]
  unfold cLight
  norm_num

/-- At r = 2 r₀ the one-side energy is half the infinite-arm energy. -/
theorem energy_face_half (Rs : ℚ) :
    shape Rs (2 * r0) - r0 = (Rs - r0) / 2 := by
  unfold shape r0
  field_simp
  ring

theorem sixth_energy_face :
    cLight ^ 4 / (2 * GNewt) * (rsSixth - r0) / 2 =
      -100970108913281127865797509326896200000000000000000 / 200229 := by
  rw [sixth_energy_integral, sixth_energy_one_side]
  norm_num

theorem half_energy_face :
    cLight ^ 4 / (2 * GNewt) * (rsHalf - r0) / 2 =
      -20194021782656225573159501865379240000000000000000 / 66743 := by
  rw [half_energy_integral, half_energy_one_side]
  norm_num

theorem kappa_at_forty (Rs : ℚ) : kappa Rs (2 * r0) = 1 / (16 * r0 ^ 2) := by
  unfold kappa r0
  field_simp
  ring

/-- Numerator of d/dr [(r² − Rs r − A) / r⁶]. Vanishes on 4 r² − 5 Rs r − 6 A = 0. -/
theorem null_peak_numerator (Rs r : ℚ) :
    (2 * r - Rs) * r ^ 6 - (r ^ 2 - Rs * r - (r0 - Rs) * r0) * (6 * r ^ 5) =
      r ^ 5 * (-(4 * r ^ 2) + 5 * Rs * r + 6 * ((r0 - Rs) * r0)) := by
  unfold r0
  ring

/-- Numerator of d/dr of the squared coast sweep. Vanishes on the cubic. -/
theorem coast_peak_numerator (Rs r A : ℚ) :
    (2 * r - Rs) * (r ^ 2 * (Rs * r + 2 * A)) -
        (r ^ 2 - Rs * r - A) * (Rs * r ^ 2 + 2 * r * (Rs * r + 2 * A)) =
      -r * (Rs * r ^ 3 - 2 * Rs ^ 2 * r ^ 2 - 5 * A * Rs * r - 4 * A ^ 2) := by
  ring

/-- The gate's h on a pair is that pair's κ. The product in the potential is −h. -/
def gateH (κ : ℚ) : ℚ := κ

theorem product_is_minus_gateH (κ γ E1 E2 S1 S2 : ℚ) :
    mouthPotential κ γ E1 E2 S1 S2 =
      γ / 2 * (S1 - E1) ^ 2 + γ / 2 * (S2 - E2) ^ 2 +
        gateH κ / 2 * (S1 ^ 2 + S2 ^ 2) - gateH κ * S1 * S2 := by
  unfold mouthPotential gateH
  ring

theorem edge_pair_cancels (κ s1 s2 : ℚ) :
    κ * (s2 - s1) + κ * (s1 - s2) = 0 := by
  ring

/-- One mode of V = (lam/2) c² exp(−2 lam t) integrates to c²/4. -/
theorem mode_integral (c lam : ℚ) (hlam : lam ≠ 0) :
    (lam / 2) * c ^ 2 / (2 * lam) = c ^ 2 / 4 := by
  field_simp
  ring

theorem two_mouth_norm (δ : ℚ) :
    ((δ / 2) ^ 2 + (δ / 2) ^ 2) / 4 = δ ^ 2 / 8 := by
  ring

/-- Numerator of the ship-time integrand, split at the face factor u + r₀. -/
theorem schedule_numerator (Rs u : ℚ) :
    Rs * u + r0 * (2 * r0 - Rs) = Rs * (u + r0) + 2 * r0 * (r0 - Rs) := by
  ring

theorem schedule_sixth_arguments :
    (3 * r0 - rsSixth) / (2 * r0 - rsSixth) = 17 / 11 ∧
      2 * r0 / (2 * r0 - rsSixth) = 12 / 11 ∧
        4 * (r0 - rsSixth) / (3 * (2 * r0 - rsSixth)) = 20 / 33 := by
  unfold rsSixth r0
  norm_num

theorem schedule_half_arguments :
    (3 * r0 - rsHalf) / (2 * r0 - rsHalf) = 5 / 3 ∧
      2 * r0 / (2 * r0 - rsHalf) = 4 / 3 ∧
        4 * (r0 - rsHalf) / (3 * (2 * r0 - rsHalf)) = 4 / 9 := by
  unfold rsHalf r0
  norm_num

/-- `(r − r₀) b / (2 r (r − b)) = b / (2 (r + r₀ − Rs))`. The left side is `−(r − r₀) Φ' / V`. -/
theorem join_pole (Rs r : ℚ) (hr : r ≠ 0) (ht : r ≠ r0) (hf : r + r0 - Rs ≠ 0) :
    (r - r0) * shape Rs r / (2 * r * (r - shape Rs r)) =
      shape Rs r / (2 * (r + r0 - Rs)) := by
  have hsplit : r ^ 2 - Rs * r - (r0 - Rs) * r0 = (r - r0) * (r + r0 - Rs) := gap_split Rs r
  have hdiff : r - shape Rs r = (r ^ 2 - Rs * r - (r0 - Rs) * r0) / r := by
    unfold shape
    field_simp
    ring
  rw [hdiff, hsplit]
  field_simp

/-- Cancelling the throat gap leaves `b / (2 r)`. At the throat that residue is `1/2`. -/
theorem join_residue (Rs : ℚ) : shape Rs r0 / (2 * r0) = 1 / 2 := by
  rw [shape_at_throat Rs]
  field_simp [r0]

theorem join_weight_sixth : r0 / (2 * (2 * r0 - rsSixth)) = 3 / 11 := by
  unfold rsSixth r0
  norm_num

theorem join_weight_half : r0 / (2 * (2 * r0 - rsHalf)) = 1 / 3 := by
  unfold rsHalf r0
  norm_num

/-- At the on-state the difference is `γ (E₁ − E₂) / (2κ + γ)`. The sum is `E₁ + E₂`. -/
theorem entry_steady_difference (κ γ E1 E2 : ℚ) (hd : 2 * κ + γ ≠ 0) :
    ((E1 - κ * (E1 - E2) / (2 * κ + γ)) -
        (E2 + κ * (E1 - E2) / (2 * κ + γ))) * (2 * κ + γ) =
      γ * (E1 - E2) := by
  have hmul := div_mul_cancel₀ (κ * (E1 - E2)) hd
  have hsplit :
      ((E1 - κ * (E1 - E2) / (2 * κ + γ)) -
          (E2 + κ * (E1 - E2) / (2 * κ + γ))) * (2 * κ + γ) =
        E1 * (2 * κ + γ) - κ * (E1 - E2) / (2 * κ + γ) * (2 * κ + γ) -
          (E2 * (2 * κ + γ) + κ * (E1 - E2) / (2 * κ + γ) * (2 * κ + γ)) := by
    ring
  rw [hsplit, hmul]
  ring

/-- With the sum already on the common mean, the potential is `(2κ + γ) Δ² / 4`. -/
theorem entry_switch (κ γ Δ : ℚ) :
    γ / 2 * (Δ / 2) ^ 2 + γ / 2 * (Δ / 2) ^ 2 + κ / 2 * Δ ^ 2 =
      (2 * κ + γ) * Δ ^ 2 / 4 := by
  ring

/-- That switch potential is `γ / (2κ)` times the seated potential. -/
theorem entry_ratio (κ γ gap : ℚ) (hk : κ ≠ 0) (hg : γ ≠ 0) (hd : 2 * κ + γ ≠ 0)
    (hgap : gap ≠ 0) :
    (γ ^ 2 * gap ^ 2 / (4 * (2 * κ + γ))) /
        (κ * γ * gap ^ 2 / (2 * (2 * κ + γ))) =
      γ / (2 * κ) := by
  field_simp
  norm_num

/-- `c² V / (2 r₀²) = g/10` at `V = 196133 / (250 c²)`. -/
theorem entry_gate :
    cLight ^ 2 * (196133 / (250 * cLight ^ 2)) / (2 * r0 ^ 2) = gStd / 10 := by
  unfold cLight gStd r0
  norm_num

/-- The 40 m static piece is the proved tension ratio times the throat piece. -/
theorem entry_face_sixth : (96 : ℚ) / 7 * ((7 : ℚ) / 96) = 1 := by
  norm_num

theorem entry_face_half : (32 : ℚ) / 3 * ((3 : ℚ) / 32) = 1 := by
  norm_num

/-- Out to radius r the one-side energy is the infinite-arm side times (1 − r₀/r). -/
theorem inventory_fraction (Rs r : ℚ) (hr : r ≠ 0) :
    shape Rs r - r0 = (Rs - r0) * (1 - r0 / r) := by
  unfold shape
  field_simp
  ring

/-- The 40 m face and the arm beyond it each hold half of one side. -/
theorem inventory_half (Rs : ℚ) :
    (Rs - r0) * (1 - r0 / (2 * r0)) = (Rs - r0) / 2 := by
  unfold r0
  field_simp
  ring

/-- Two faces equal one side. -/
theorem inventory_crossing (Rs : ℚ) :
    2 * ((Rs - r0) / 2) = Rs - r0 := by
  ring

/-- Four sides minus the crossing leave three sides. -/
theorem inventory_remainder (Rs : ℚ) :
    4 * (Rs - r0) - (Rs - r0) = 3 * (Rs - r0) := by
  ring

/-- The crossing is one quarter of the four-side inventory. -/
theorem inventory_share (Rs : ℚ) (h : Rs - r0 ≠ 0) :
    (Rs - r0) / (4 * (Rs - r0)) = 1 / 4 := by
  field_simp

/-- At the throat gate the one-sixth face keeps 89/96 of its closed squared speed. -/
theorem depart_face_sixth : (1 : ℚ) - (7 : ℚ) / 96 = (89 : ℚ) / 96 := by
  norm_num

/-- At the throat gate the half-compact face keeps 29/32 of its closed squared speed. -/
theorem depart_face_half : (1 : ℚ) - (3 : ℚ) / 32 = (29 : ℚ) / 32 := by
  norm_num

/-- A larger face potential is reached sooner while V decays. -/
theorem depart_potential_order :
    ((96 : ℚ) / 7 > (32 : ℚ) / 3) ∧ ((32 : ℚ) / 3 > 1) := by
  norm_num

/-- The difference of the squared 1 g speeds is the static piece over κ. -/
theorem depart_press (κ load S : ℚ) (hk : κ ≠ 0) :
    load / κ - (load - S) / κ = S / κ := by
  field_simp
  ring

/-- The tension integrand splits into the logarithm piece and the rational piece. -/
theorem release_integrand (Rs r : ℚ) (hr : r ≠ 0) :
    shape Rs r / r = Rs / r + (r0 - Rs) * r0 / r ^ 2 := by
  unfold shape
  field_simp

/-- The evaluated rational piece is `(r₀ − Rs) (1 − r₀/R)`. -/
theorem release_rational (Rs R : ℚ) (hR : R ≠ 0) :
    (r0 - Rs) * r0 * (1 / r0 - 1 / R) = (r0 - Rs) * (1 - r0 / R) := by
  unfold r0
  field_simp

/-- At the 40 m face the rational piece is half of `(r₀ − Rs)`. -/
theorem release_face (Rs : ℚ) :
    (r0 - Rs) * (1 - r0 / (2 * r0)) = (r0 - Rs) / 2 := by
  unfold r0
  field_simp
  ring

theorem release_face_sixth : (r0 - rsSixth) / 2 = 25 / 3 := by
  unfold rsSixth
  unfold r0
  norm_num

theorem release_face_half : (r0 - rsHalf) / 2 = 5 := by
  unfold rsHalf
  unfold r0
  norm_num

/-- The throat load that holds the 40 m speed is `44/3` on the one-sixth mouth. -/
theorem level_load_sixth :
    kappa rsSixth r0 / (1 / (16 * r0 ^ 2)) = 44 / 3 := by
  have hk := kappa_sixth
  rw [hk]
  unfold r0
  norm_num

/-- The throat load that holds the 40 m speed is `12` on the half-compact mouth. -/
theorem level_load_half :
    kappa rsHalf r0 / (1 / (16 * r0 ^ 2)) = 12 := by
  have hk := kappa_half
  rw [hk]
  unfold r0
  norm_num

/-- A 1 g beam at the face speed is `15/22` m wide on the one-sixth throat. -/
theorem level_width_sixth :
    (10 : ℚ) * (1 / (16 * r0 ^ 2)) / kappa rsSixth r0 = 15 / 22 := by
  have hk := kappa_sixth
  rw [hk]
  unfold r0
  norm_num

/-- A 1 g beam at the face speed is `5/6` m wide on the half-compact throat. -/
theorem level_width_half :
    (10 : ℚ) * (1 / (16 * r0 ^ 2)) / kappa rsHalf r0 = 5 / 6 := by
  have hk := kappa_half
  rw [hk]
  unfold r0
  norm_num

/-- The one-sixth throat pays a larger multiple than the half-compact throat. -/
theorem level_order : ((44 : ℚ) / 3 > 12) ∧ (12 > 1) := by
  norm_num

/-- Scaling the load by `κ/κ_face` returns the face value of `a / (κ W)`. -/
theorem level_match (κ κf load W : ℚ) (hκ : κ ≠ 0) (hf : κf ≠ 0) (hW : W ≠ 0) :
    (load * (κ / κf)) / (κ * W) = load / (κf * W) := by
  field_simp

/-- The one-sixth fit beam is `3/44` of the 10 m beam. -/
theorem fit_beam_sixth : ((15 : ℚ) / 22) / 10 = 3 / 44 := by
  norm_num

/-- The half-compact fit beam is `1/12` of the 10 m beam. -/
theorem fit_beam_half : ((5 : ℚ) / 6) / 10 = 1 / 12 := by
  norm_num

/-- The squared-speed ratio of the one-sixth fit beam is `44/3`. -/
theorem fit_span_sixth : (10 : ℚ) / (15 / 22) = 44 / 3 := by
  norm_num

/-- The squared-speed ratio of the half-compact fit beam is `12`. -/
theorem fit_span_half : (10 : ℚ) / (5 / 6) = 12 := by
  norm_num

/-- At fixed speed the lateral load scales as `κ/κ₀`. -/
theorem fit_load (κ κ0 v W : ℚ) (hκ0 : κ0 ≠ 0) (hv : v ≠ 0) (hW : W ≠ 0) :
    (κ * v ^ 2 * W) / (κ0 * v ^ 2 * W) = κ / κ0 := by
  field_simp

/-- The one-sixth face load on the fit beam is `3/44` of the throat load. -/
theorem fit_face_sixth :
    (1 / (16 * r0 ^ 2)) / kappa rsSixth r0 = 3 / 44 := by
  have hk := kappa_sixth
  rw [hk]
  unfold r0
  norm_num

/-- The half-compact face load on the fit beam is `1/12` of the throat load. -/
theorem fit_face_half :
    (1 / (16 * r0 ^ 2)) / kappa rsHalf r0 = 1 / 12 := by
  have hk := kappa_half
  rw [hk]
  unfold r0
  norm_num

/-- The one-sixth load at 25 m is `576/1375` of the throat load. -/
theorem fit_station_sixth_25 :
    kappa rsSixth 25 / kappa rsSixth r0 = 576 / 1375 := by
  have hk := kappa_sixth
  rw [hk]
  unfold kappa rsSixth r0
  norm_num

/-- The half-compact load at 25 m is `832/1875` of the throat load. -/
theorem fit_station_half_25 :
    kappa rsHalf 25 / kappa rsHalf r0 = 832 / 1875 := by
  have hk := kappa_half
  rw [hk]
  unfold kappa rsHalf r0
  norm_num

/-- The one-sixth load at 30 m is `184/891` of the throat load. -/
theorem fit_station_sixth_30 :
    kappa rsSixth 30 / kappa rsSixth r0 = 184 / 891 := by
  have hk := kappa_sixth
  rw [hk]
  unfold kappa rsSixth r0
  norm_num

/-- The half-compact load at 30 m is `56/243` of the throat load. -/
theorem fit_station_half_30 :
    kappa rsHalf 30 / kappa rsHalf r0 = 56 / 243 := by
  have hk := kappa_half
  rw [hk]
  unfold kappa rsHalf r0
  norm_num

/-- The face load sits under the 25 m load, and both sit under 1. -/
theorem fit_order :
    ((3 : ℚ) / 44 < (576 : ℚ) / 1375) ∧ ((576 : ℚ) / 1375 < 1) ∧
    ((1 : ℚ) / 12 < (832 : ℚ) / 1875) ∧ ((832 : ℚ) / 1875 < 1) := by
  norm_num

end GateLedger
