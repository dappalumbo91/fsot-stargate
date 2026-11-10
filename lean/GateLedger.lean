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
and the integral of one decay mode. The 400000-step crossings stay with the Octave log.
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

end GateLedger
