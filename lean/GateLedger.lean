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
identity, the mouth masses, the cavity against both horizons, and the
size of γ² − 1. The 400000-step crossings stay with the Octave log.
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

end GateLedger
