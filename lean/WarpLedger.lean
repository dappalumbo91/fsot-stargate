/-
Copyright 2026 Damian Arthur Palumbo
SPDX-License-Identifier: Apache-2.0
-/

import Mathlib.Analysis.Real.Pi.Bounds
import Mathlib.Analysis.SpecialFunctions.Artanh
import Mathlib.Tactic.FieldSimp
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.NormNum
import Mathlib.Tactic.Positivity
import Mathlib.Tactic.Ring

/-
Ledger after the mix join. Not part of `lean_lib FSOT`.

`WarpMix.lean` is the shift algebra. This file is the rest of the system:
the compactness mass, the bend window, the printed clean and fail lines,
and the ship-scale ledger.

The Einstein tensor stays with the Warp Factory logs. The sail trip and the
tidal radii are not energy-condition scores. Ship speed is only an amplitude.
The pin is not an input.
-/

set_option maxHeartbeats 8000000

namespace WarpLedger

noncomputable section

def cLight : ℚ := 299792458
def GNewt : ℚ := 66743 / 10 ^ 15
def gStd : ℚ := 980665 / 100000
def moonDistance : ℚ := 384400000
def astronomicalUnit : ℚ := 149597870700
def earthRadius : ℚ := 6371000
def leoRadius : ℚ := 6771000
def jupiterMass : ℚ := 189813 * 10 ^ 22
def earthMass : ℚ := 59722 * 10 ^ 20
def moonMass : ℚ := 7342 * 10 ^ 19
def sigmaSB : ℚ := 5670374419 / 10 ^ 17

/-- `M = C R c² / (2G)`, Warp Factory `c` and `G`. -/
def compactMass (C R : ℚ) : ℚ := C * R * cLight ^ 2 / (2 * GNewt)

theorem compactness_is_rs_over_r {C R : ℚ} (hR : R ≠ 0) (hc : cLight ≠ 0) (hG : GNewt ≠ 0) :
    2 * GNewt * compactMass C R / (cLight ^ 2 * R) = C := by
  unfold compactMass
  field_simp

theorem sixth_mass_prints :
    22435 * 10 ^ 23 < compactMass (1 / 6) 20 ∧ compactMass (1 / 6) 20 < 22445 * 10 ^ 23 := by
  unfold compactMass cLight GNewt
  norm_num

theorem half_mass_prints :
    67325 * 10 ^ 23 < compactMass (1 / 2) 20 ∧ compactMass (1 / 2) 20 < 67335 * 10 ^ 23 := by
  unfold compactMass cLight GNewt
  norm_num

theorem seventh_mass_prints :
    19235 * 10 ^ 23 < compactMass (1 / 7) 20 ∧ compactMass (1 / 7) 20 < 19245 * 10 ^ 23 := by
  unfold compactMass cLight GNewt
  norm_num

theorem sixth_rest_energy :
    20165 * 10 ^ 40 < compactMass (1 / 6) 20 * cLight ^ 2 ∧
      compactMass (1 / 6) 20 * cLight ^ 2 < 20175 * 10 ^ 40 := by
  unfold compactMass cLight GNewt
  norm_num

theorem sixth_jupiters :
    (11815 / 10000 : ℚ) < compactMass (1 / 6) 20 / jupiterMass ∧
      compactMass (1 / 6) 20 / jupiterMass < (11825 / 10000 : ℚ) := by
  unfold compactMass cLight GNewt jupiterMass
  norm_num

theorem sixth_earths :
    (3755 / 10 : ℚ) < compactMass (1 / 6) 20 / earthMass ∧
      compactMass (1 / 6) 20 / earthMass < (3765 / 10 : ℚ) := by
  unfold compactMass cLight GNewt earthMass
  norm_num

theorem sixth_schwarzschild :
    2 * GNewt * compactMass (1 / 6) 20 / cLight ^ 2 = 10 / 3 := by
  unfold compactMass cLight GNewt
  norm_num

/- Stored shell file. Route constants wrote it. Warp Factory reads it back. -/

def shellR2 : ℚ := 9811159383104 / 10 ^ 9
def shellMass : ℚ := 3303042913764 * 10 ^ 18
def routeC : ℚ := 299792000
def routeG : ℚ := 6674 / 10 ^ 14
def routeMass : ℚ := (1 / 2) * shellR2 * routeC ^ 2 / (2 * routeG)

theorem shell_file_matches :
    |shellMass - routeMass| / shellMass < 1 / 10 ^ 12 := by
  unfold shellMass routeMass shellR2 routeC routeG
  norm_num

theorem shell_file_wf_compact :
    (5000205 / 10000000 : ℚ) < 2 * GNewt * shellMass / (cLight ^ 2 * shellR2) ∧
      2 * GNewt * shellMass / (cLight ^ 2 * shellR2) < (5000215 / 10000000 : ℚ) := by
  unfold GNewt shellMass cLight shellR2
  norm_num

def ellPrinted : ℚ := 8573494832025231 / 10 ^ 16

theorem cavity_is_one_ell : 20 - 20 * (1 - ellPrinted) = ellPrinted * 20 := by
  ring

theorem cavity_prints :
    (2845 / 1000 : ℚ) < 20 * (1 - ellPrinted) ∧ 20 * (1 - ellPrinted) < (2855 / 1000 : ℚ) := by
  unfold ellPrinted
  norm_num

/- Bend window. The chord covers one curvature rise past the strongest bend. -/

def windowEnd (rSlope rCurv : ℝ) : ℝ := rCurv + (rCurv - rSlope)

theorem window_symmetric (rSlope rCurv : ℝ) :
    windowEnd rSlope rCurv - rCurv = rCurv - rSlope := by
  unfold windowEnd
  ring

def chordWeight (rSlope rEnd dMax dEnd r : ℝ) : ℝ :=
  dMax + (dEnd - dMax) * ((r - rSlope) / (rEnd - rSlope))

theorem chord_at_slope (rSlope rEnd dMax dEnd : ℝ) :
    chordWeight rSlope rEnd dMax dEnd rSlope = dMax := by
  unfold chordWeight
  simp

theorem chord_at_end {rSlope rEnd dMax dEnd : ℝ} (h : rSlope ≠ rEnd) :
    chordWeight rSlope rEnd dMax dEnd rEnd = dEnd := by
  unfold chordWeight
  have hdiv : (rEnd - rSlope) / (rEnd - rSlope) = 1 := by field_simp [sub_ne_zero.mpr h]
  rw [hdiv]
  ring

theorem chord_at_bend {rSlope rCurv dMax dEnd : ℝ} (h : rSlope ≠ rCurv) :
    chordWeight rSlope (windowEnd rSlope rCurv) dMax dEnd rCurv = (dMax + dEnd) / 2 := by
  unfold chordWeight windowEnd
  have hden : rCurv + (rCurv - rSlope) - rSlope = (rCurv - rSlope) * 2 := by ring
  rw [hden]
  have hne : rCurv - rSlope ≠ 0 := sub_ne_zero.mpr h.symm
  field_simp [hne]
  ring

/-- Hold the max slope through the bend, then a straight fall to the window end. -/
def plateauWeight (rCurv rEnd dMax dEnd r : ℝ) : ℝ :=
  if r ≤ rCurv then dMax
  else dMax + (dEnd - dMax) * ((r - rCurv) / (rEnd - rCurv))

theorem plateau_holds (rCurv rEnd dMax dEnd r : ℝ) (hr : r ≤ rCurv) :
    plateauWeight rCurv rEnd dMax dEnd r = dMax := by
  unfold plateauWeight
  simp [hr]

theorem plateau_at_end {rCurv rEnd dMax dEnd : ℝ} (h : rCurv < rEnd) :
    plateauWeight rCurv rEnd dMax dEnd rEnd = dEnd := by
  unfold plateauWeight
  simp [not_le.mpr h]
  have hdiv : (rEnd - rCurv) / (rEnd - rCurv) = 1 :=
    div_self (sub_ne_zero.mpr h.ne.symm)
  rw [hdiv]
  ring

theorem plateau_above_chord_at_bend {rSlope rCurv dMax dEnd : ℝ}
    (hs : rSlope < rCurv) (hd : dEnd < dMax) :
    chordWeight rSlope (windowEnd rSlope rCurv) dMax dEnd rCurv <
      plateauWeight rCurv (windowEnd rSlope rCurv) dMax dEnd rCurv := by
  rw [chord_at_bend hs.ne, plateau_holds _ _ _ _ _ le_rfl]
  linarith

theorem payment_scale_returns {Mpay excess : ℝ} (h : Mpay ≠ 0) :
    Mpay * ((Mpay - excess) / Mpay) = Mpay - excess := by
  field_simp [h]

theorem payment_removes_excess {Mnow excess M : ℝ} (h : excess = Mnow - M) :
    Mnow - excess = M := by
  linarith

/- Printed clean bar. The digits are the log. The tensor is not evaluated here. -/

structure CleanBar where
  nullWorst : ℚ
  weakWorst : ℚ
  strongWorst : ℚ
  dominantWorst : ℚ
  serious : ℚ
  energy : ℚ
  shift : ℚ
  requested : ℚ

def CleanBar.passes (b : CleanBar) : Prop :=
  b.nullWorst < 1 / 1000 ∧
    b.weakWorst < 1 / 1000 ∧
      b.strongWorst < 1 / 1000 ∧
        b.dominantWorst < 1 / 1000 ∧
          b.serious = 0 ∧ 0 < b.energy ∧ b.shift = b.requested

def sixthBend : CleanBar where
  nullWorst := 6785 / 10 ^ 8
  weakWorst := 6785 / 10 ^ 8
  strongWorst := 1889 / 10 ^ 7
  dominantWorst := 1605 / 10 ^ 7
  serious := 0
  energy := 23794 * 10 ^ 23
  shift := 1 / 25
  requested := 1 / 25

def seventhBend : CleanBar where
  nullWorst := 3264 / 100000
  weakWorst := 3264 / 100000
  strongWorst := 3264 / 100000
  dominantWorst := 1176 / 10000
  serious := 187 / 10000
  energy := 20207 * 10 ^ 23
  shift := 1 / 25
  requested := 1 / 25

def seventhClip : CleanBar where
  nullWorst := 3709 / 100000
  weakWorst := 3709 / 100000
  strongWorst := 3709 / 100000
  dominantWorst := 1223 / 10000
  serious := 186 / 10000
  energy := 20179 * 10 ^ 23
  shift := 1 / 25
  requested := 1 / 25

def sixthBend06 : CleanBar where
  nullWorst := 1023 / 10000
  weakWorst := 1023 / 10000
  strongWorst := 1023 / 10000
  dominantWorst := 2223 / 10000
  serious := 758 / 10000
  energy := 23758 * 10 ^ 23
  shift := 6 / 100
  requested := 6 / 100

def seventhPlateau : CleanBar where
  nullWorst := 7704 / 100000
  weakWorst := 7704 / 100000
  strongWorst := 7704 / 100000
  dominantWorst := 3349 / 10000
  serious := 208 / 10000
  energy := 20171 * 10 ^ 23
  shift := 1 / 25
  requested := 1 / 25

def flatSixth : CleanBar where
  nullWorst := 4774 / 100000
  weakWorst := 4774 / 100000
  strongWorst := 4774 / 100000
  dominantWorst := 2148 / 10000
  serious := 149 / 10000
  energy := 24183 * 10 ^ 23
  shift := 1 / 25
  requested := 1 / 25

def half010 : CleanBar where
  nullWorst := 1067 / 10 ^ 8
  weakWorst := 2158 / 10 ^ 8
  strongWorst := 1067 / 10 ^ 8
  dominantWorst := 1923 / 10 ^ 8
  serious := 0
  energy := 82868 * 10 ^ 23
  shift := 1 / 10
  requested := 1 / 10

def third006 : CleanBar where
  nullWorst := 9336 / 10 ^ 9
  weakWorst := 1890 / 10 ^ 8
  strongWorst := 9336 / 10 ^ 9
  dominantWorst := 1700 / 10 ^ 8
  serious := 0
  energy := 51417 * 10 ^ 23
  shift := 6 / 100
  requested := 6 / 100

def third010 : CleanBar where
  nullWorst := 2015 / 10000
  weakWorst := 2015 / 10000
  strongWorst := 2015 / 10000
  dominantWorst := 4531 / 10000
  serious := 792 / 10000
  energy := 51280 * 10 ^ 23
  shift := 1 / 10
  requested := 1 / 10

def half011 : CleanBar where
  nullWorst := 3567 / 100000
  weakWorst := 3567 / 100000
  strongWorst := 3567 / 100000
  dominantWorst := 1771 / 10000
  serious := 119 / 10000
  energy := 82811 * 10 ^ 23
  shift := 11 / 100
  requested := 11 / 100

theorem sixthBend_passes : sixthBend.passes := by
  unfold CleanBar.passes sixthBend
  norm_num

theorem half010_passes : half010.passes := by
  unfold CleanBar.passes half010
  norm_num

theorem third006_passes : third006.passes := by
  unfold CleanBar.passes third006
  norm_num

theorem seventhBend_fails : ¬seventhBend.passes := by
  intro h
  have hdom := h.2.2.2.1
  unfold seventhBend at hdom
  norm_num at hdom

theorem seventhClip_fails : ¬seventhClip.passes := by
  intro h
  have hdom := h.2.2.2.1
  unfold seventhClip at hdom
  norm_num at hdom

theorem sixthBend06_fails : ¬sixthBend06.passes := by
  intro h
  have hdom := h.2.2.2.1
  unfold sixthBend06 at hdom
  norm_num at hdom

theorem seventhPlateau_fails : ¬seventhPlateau.passes := by
  intro h
  have hdom := h.2.2.2.1
  unfold seventhPlateau at hdom
  norm_num at hdom

theorem flatSixth_fails : ¬flatSixth.passes := by
  intro h
  have hdom := h.2.2.2.1
  unfold flatSixth at hdom
  norm_num at hdom

theorem third010_fails : ¬third010.passes := by
  intro h
  have hdom := h.2.2.2.1
  unfold third010 at hdom
  norm_num at hdom

theorem half011_fails : ¬half011.passes := by
  intro h
  have hdom := h.2.2.2.1
  unfold half011 at hdom
  norm_num at hdom

theorem seventhBend_shift : seventhBend.shift = seventhBend.requested := rfl
theorem sixthBend06_shift : sixthBend06.shift = sixthBend06.requested := rfl
theorem seventhPlateau_shift : seventhPlateau.shift = seventhPlateau.requested := rfl

/- Ship ledger. β = 0.04 = 1/25. -/

def sqrt624Lo : ℚ := 249799919 / 10000000
def sqrt624Hi : ℚ := 249799920 / 10000000

theorem sqrt624_bounds :
    (sqrt624Lo : ℝ) < Real.sqrt 624 ∧ Real.sqrt 624 < (sqrt624Hi : ℝ) := by
  constructor
  · rw [Real.lt_sqrt (by unfold sqrt624Lo; norm_num)]
    unfold sqrt624Lo
    norm_num
  · rw [Real.sqrt_lt (by norm_num) (by unfold sqrt624Hi; norm_num)]
    unfold sqrt624Hi
    norm_num

theorem gamma_trip :
    (1 : ℝ) / Real.sqrt (1 - ((1 : ℝ) / 25) ^ 2) = 25 / Real.sqrt 624 := by
  have hcomp : (1 : ℝ) - ((1 : ℝ) / 25) ^ 2 = 624 / 625 := by norm_num
  rw [hcomp, Real.sqrt_div (by norm_num) (625 : ℝ)]
  have h25 : Real.sqrt (625 : ℝ) = 25 := by
    rw [show (625 : ℝ) = 25 ^ 2 by norm_num, Real.sqrt_sq (by norm_num)]
  rw [h25]
  field_simp

theorem gamma_sq_of_def {β : ℝ} (hβ : β ^ 2 < 1) :
    (1 / Real.sqrt (1 - β ^ 2)) ^ 2 * (1 - β ^ 2) = 1 := by
  have hnonneg : 0 ≤ 1 - β ^ 2 := by linarith
  have hpos : 0 < 1 - β ^ 2 := by linarith
  field_simp [Real.sqrt_ne_zero'.mpr hpos]
  rw [Real.sq_sqrt hnonneg]

theorem gamma_minus_one_bounds :
    (25 : ℝ) / sqrt624Hi - 1 < 25 / Real.sqrt 624 - 1 ∧
      25 / Real.sqrt 624 - 1 < (25 : ℝ) / sqrt624Lo - 1 := by
  have hb := sqrt624_bounds
  constructor
  · have hdiv : (25 : ℝ) / sqrt624Hi < 25 / Real.sqrt 624 :=
      div_lt_div_of_pos_left (by norm_num) (Real.sqrt_pos.mpr (by norm_num)) hb.2
    linarith
  · have hdiv : (25 : ℝ) / Real.sqrt 624 < (25 : ℝ) / sqrt624Lo :=
      div_lt_div_of_pos_left (by norm_num) (by unfold sqrt624Lo; norm_num) hb.1
    linarith

theorem kinetic_ten_tonne :
    (7195 * 10 ^ 14 : ℝ) <
        10000 * ((1 / Real.sqrt (1 - ((1 : ℝ) / 25) ^ 2)) - 1) * (299792458 : ℝ) ^ 2 ∧
      10000 * ((1 / Real.sqrt (1 - ((1 : ℝ) / 25) ^ 2)) - 1) * (299792458 : ℝ) ^ 2 <
        (7205 * 10 ^ 14 : ℝ) := by
  rw [gamma_trip]
  have hg := gamma_minus_one_bounds
  have hlo : (7195 * 10 ^ 14 : ℝ) <
      10000 * ((25 : ℝ) / sqrt624Hi - 1) * (299792458 : ℝ) ^ 2 := by
    unfold sqrt624Hi
    norm_num
  have hhi : 10000 * ((25 : ℝ) / sqrt624Lo - 1) * (299792458 : ℝ) ^ 2 <
      (7205 * 10 ^ 14 : ℝ) := by
    unfold sqrt624Lo
    norm_num
  have hpos : (0 : ℝ) < 10000 * (299792458 : ℝ) ^ 2 := by norm_num
  have hleft := mul_lt_mul_of_pos_left hg.1 hpos
  have hright := mul_lt_mul_of_pos_left hg.2 hpos
  constructor <;> linarith

theorem mass_energy_eight_kilograms :
    (795 / 100 : ℝ) < 10000 * ((1 / Real.sqrt (1 - ((1 : ℝ) / 25) ^ 2)) - 1) ∧
      10000 * ((1 / Real.sqrt (1 - ((1 : ℝ) / 25) ^ 2)) - 1) < (805 / 100 : ℝ) := by
  rw [gamma_trip]
  have hg := gamma_minus_one_bounds
  have hlo : (795 / 100 : ℝ) < 10000 * ((25 : ℝ) / sqrt624Hi - 1) := by
    unfold sqrt624Hi
    norm_num
  have hhi : 10000 * ((25 : ℝ) / sqrt624Lo - 1) < (805 / 100 : ℝ) := by
    unfold sqrt624Lo
    norm_num
  constructor <;> linarith [mul_lt_mul_of_pos_left hg.1 (by norm_num : (0 : ℝ) < 10000),
    mul_lt_mul_of_pos_left hg.2 (by norm_num : (0 : ℝ) < 10000)]

theorem photon_fraction :
    (1 + (1 : ℝ) / 25) / (1 - (1 : ℝ) / 25) = (13 : ℝ) / 12 := by
  norm_num

theorem photon_ratio_exp :
    Real.exp (Real.artanh ((1 : ℝ) / 25)) = Real.sqrt ((13 : ℝ) / 12) := by
  have hmem : ((1 : ℝ) / 25) ∈ Set.Ioo (-1) 1 := by
    rw [Set.mem_Ioo]
    constructor <;> norm_num
  rw [Real.exp_artanh hmem, photon_fraction]

def photonLo : ℚ := 1040832 / 1000000
def photonHi : ℚ := 1040833 / 1000000

theorem photon_bounds :
    (photonLo : ℝ) < Real.sqrt ((13 : ℝ) / 12) ∧ Real.sqrt ((13 : ℝ) / 12) < (photonHi : ℝ) := by
  constructor
  · rw [Real.lt_sqrt (by unfold photonLo; norm_num)]
    unfold photonLo
    norm_num
  · rw [Real.sqrt_lt (by norm_num) (by unfold photonHi; norm_num)]
    unfold photonHi
    norm_num

theorem photon_prints :
    (10405 / 10000 : ℝ) < Real.sqrt ((13 : ℝ) / 12) ∧
      Real.sqrt ((13 : ℝ) / 12) < (10415 / 10000 : ℝ) ∧
      (4075 / 10 : ℝ) < 10000 * (Real.sqrt ((13 : ℝ) / 12) - 1) ∧
      10000 * (Real.sqrt ((13 : ℝ) / 12) - 1) < (4085 / 10 : ℝ) ∧
      (3665 * 10 ^ 16 : ℝ) < 10000 * (Real.sqrt ((13 : ℝ) / 12) - 1) * (299792458 : ℝ) ^ 2 ∧
      10000 * (Real.sqrt ((13 : ℝ) / 12) - 1) * (299792458 : ℝ) ^ 2 < (3675 * 10 ^ 16 : ℝ) := by
  have hb := photon_bounds
  have hratioLo : (10405 / 10000 : ℝ) < photonLo := by unfold photonLo; norm_num
  have hratioHi : (photonHi : ℝ) < 10415 / 10000 := by unfold photonHi; norm_num
  have hfuelLo : (4075 / 10 : ℝ) < 10000 * (photonLo - 1) := by unfold photonLo; norm_num
  have hfuelHi : 10000 * (photonHi - 1) < (4085 / 10 : ℝ) := by unfold photonHi; norm_num
  have hELo : (3665 * 10 ^ 16 : ℝ) < 10000 * (photonLo - 1) * (299792458 : ℝ) ^ 2 := by
    unfold photonLo
    norm_num
  have hEHi : 10000 * (photonHi - 1) * (299792458 : ℝ) ^ 2 < (3675 * 10 ^ 16 : ℝ) := by
    unfold photonHi
    norm_num
  have hpos : (0 : ℝ) < 10000 := by norm_num
  have hposE : (0 : ℝ) < 10000 * (299792458 : ℝ) ^ 2 := by norm_num
  refine ⟨?_, ?_, ?_, ?_, ?_, ?_⟩ <;> linarith [mul_lt_mul_of_pos_left hb.1 hpos,
    mul_lt_mul_of_pos_left hb.2 hpos, mul_lt_mul_of_pos_left hb.1 hposE,
    mul_lt_mul_of_pos_left hb.2 hposE]

/-- Accel and stop, exhaust matched to the trip speed. The ratio is `(13/12)^25`. -/
theorem matched_exhaust_ratio :
    Real.exp (2 * Real.artanh ((1 : ℝ) / 25) / ((1 : ℝ) / 25)) = ((13 : ℝ) / 12) ^ 25 := by
  have hmem : ((1 : ℝ) / 25) ∈ Set.Icc (-1) 1 := by
    rw [Set.mem_Icc]
    constructor <;> norm_num
  have hlog := Real.artanh_eq_half_log hmem
  have hpos : (0 : ℝ) < (13 : ℝ) / 12 := by norm_num
  have harg : 2 * Real.artanh ((1 : ℝ) / 25) / ((1 : ℝ) / 25) =
      (25 : ℕ) * Real.log ((13 : ℝ) / 12) := by
    rw [hlog, photon_fraction]
    field_simp
    ring_nf
  rw [harg, Real.exp_nat_mul, Real.exp_log hpos]

def exhaustRatio : ℚ := (13 / 12) ^ 25
def propellantKg : ℚ := 10000 * (exhaustRatio - 1)

theorem exhaust_ratio_prints :
    (7395 / 1000 : ℚ) < exhaustRatio ∧ exhaustRatio < (7405 / 1000 : ℚ) := by
  unfold exhaustRatio
  norm_num

theorem propellant_prints :
    (63500 : ℚ) < propellantKg ∧ propellantKg < 64500 := by
  unfold propellantKg exhaustRatio
  norm_num

theorem propellant_energy_prints :
    (4595 * 10 ^ 15 : ℝ) <
        (propellantKg : ℝ) * (1 / Real.sqrt (1 - ((1 : ℝ) / 25) ^ 2) - 1) * (299792458 : ℝ) ^ 2 ∧
      (propellantKg : ℝ) * (1 / Real.sqrt (1 - ((1 : ℝ) / 25) ^ 2) - 1) * (299792458 : ℝ) ^ 2 <
        (4605 * 10 ^ 15 : ℝ) := by
  rw [gamma_trip]
  have hg := gamma_minus_one_bounds
  have hlo : (4595 * 10 ^ 15 : ℝ) <
      (propellantKg : ℝ) * ((25 : ℝ) / sqrt624Hi - 1) * (299792458 : ℝ) ^ 2 := by
    unfold propellantKg exhaustRatio sqrt624Hi
    norm_num
  have hhi : (propellantKg : ℝ) * ((25 : ℝ) / sqrt624Lo - 1) * (299792458 : ℝ) ^ 2 <
      (4605 * 10 ^ 15 : ℝ) := by
    unfold propellantKg exhaustRatio sqrt624Lo
    norm_num
  have hpos : (0 : ℝ) < (propellantKg : ℝ) * (299792458 : ℝ) ^ 2 := by
    unfold propellantKg exhaustRatio
    norm_num
  have hleft := mul_lt_mul_of_pos_left hg.1 hpos
  have hright := mul_lt_mul_of_pos_left hg.2 hpos
  constructor <;> linarith

/-- Jet power in the rocket frame at the start of a 1 g burn, per kilogram dry. -/
def startPowerPerDry : ℚ := exhaustRatio * gStd * ((1 / 25) * cLight) / 2

theorem start_power_prints :
    (425 * 10 ^ 6 : ℚ) < startPowerPerDry ∧ startPowerPerDry < (435 * 10 ^ 6 : ℚ) ∧
      4 * 10 ^ 6 < startPowerPerDry / 100 ∧ startPowerPerDry / 100 < 5 * 10 ^ 6 := by
  unfold startPowerPerDry exhaustRatio gStd cLight
  norm_num

/- Perfect sail. One leg delivers `M v c / 2`. Two legs deliver `M v c`. -/

theorem perfect_sail_energy {M v c P : ℝ} (hM : 0 < M) (hc : 0 < c) (hP : 0 < P) :
    P * (v / (2 * P / (M * c))) = M * v * c / 2 := by
  have hden : 2 * P / (M * c) ≠ 0 := by positivity
  field_simp [hden]

theorem two_leg_energy {M v c P : ℝ} (hM : 0 < M) (hc : 0 < c) (hP : 0 < P) :
    2 * (P * (v / (2 * P / (M * c)))) = M * v * c := by
  have h := perfect_sail_energy (M := M) (v := v) (c := c) (P := P) hM hc hP
  linarith

theorem sail_energy_to_point04 :
    1795 * 10 ^ 16 < 10000 * (1 / 25) * cLight ^ 2 / 2 ∧
      10000 * (1 / 25) * cLight ^ 2 / 2 < 1805 * 10 ^ 16 := by
  unfold cLight
  norm_num

def beamDays (P : ℚ) : ℚ := (10000 * (1 / 25) * cLight ^ 2 / 2) / P / 86400

def beamAU (P : ℚ) : ℚ :=
  (cLight * (1 / 25)) * ((10000 * (1 / 25) * cLight ^ 2 / 2) / P) / 2 / astronomicalUnit

theorem beam_15TW :
    (135 / 10 : ℚ) < beamDays (15 * 10 ^ 12) ∧ beamDays (15 * 10 ^ 12) < (145 / 10 : ℚ) ∧
      (475 / 10 : ℚ) < beamAU (15 * 10 ^ 12) ∧ beamAU (15 * 10 ^ 12) < (485 / 10 : ℚ) := by
  unfold beamDays beamAU cLight astronomicalUnit
  norm_num

theorem beam_1TW :
    (2075 / 10 : ℚ) < beamDays (10 ^ 12) ∧ beamDays (10 ^ 12) < (2085 / 10 : ℚ) ∧
      (7195 / 10 : ℚ) < beamAU (10 ^ 12) ∧ beamAU (10 ^ 12) < (7205 / 10 : ℚ) := by
  unfold beamDays beamAU cLight astronomicalUnit
  norm_num

theorem aperture_moon_100m :
    (375 / 100 : ℚ) < (1 / 10 ^ 6) * moonDistance / 100 ∧
      (1 / 10 ^ 6) * moonDistance / 100 < (385 / 100 : ℚ) := by
  unfold moonDistance
  norm_num

theorem aperture_49AU_100m :
    (72500 : ℚ) < (1 / 10 ^ 6) * 49 * astronomicalUnit / 100 ∧
      (1 / 10 ^ 6) * 49 * astronomicalUnit / 100 < 73500 := by
  unfold astronomicalUnit
  norm_num

def sailSpeed (P : ℝ) : ℝ := Real.sqrt (2 * P * 384400000 / (10000 * 299792458))
def sailAccel (P : ℝ) : ℝ := 2 * P / (10000 * 299792458)
def sailHours (P : ℝ) : ℝ := 2 * sailSpeed P / sailAccel P / 3600
def sailJoules (P : ℝ) : ℝ := 10000 * sailSpeed P * 299792458

theorem sqrt_between {v2 lo hi : ℝ} (hv2 : 0 ≤ v2) (hlo : 0 ≤ lo) (hhi : 0 ≤ hi)
    (hsqLo : lo ^ 2 < v2) (hsqHi : v2 < hi ^ 2) :
    lo < Real.sqrt v2 ∧ Real.sqrt v2 < hi :=
  ⟨(Real.lt_sqrt hlo).2 hsqLo, (Real.sqrt_lt hv2 hhi).2 hsqHi⟩

private theorem time_mono {a lo v hi : ℝ} (ha : 0 < a) (hv : lo < v ∧ v < hi) :
    2 * lo / a / 3600 < 2 * v / a / 3600 ∧ 2 * v / a / 3600 < 2 * hi / a / 3600 := by
  have hform : ∀ x : ℝ, 2 * x / a / 3600 = x * (2 / (a * 3600)) := by
    intro x
    field_simp [ha.ne']
  rw [hform lo, hform v, hform hi]
  have hk : 0 < 2 / (a * 3600) := by positivity
  exact ⟨mul_lt_mul_of_pos_right hv.1 hk, mul_lt_mul_of_pos_right hv.2 hk⟩

private theorem energy_scale {k lo v hi : ℝ} (hk : 0 < k) (hv : lo < v ∧ v < hi) :
    k * lo < k * v ∧ k * v < k * hi :=
  ⟨mul_lt_mul_of_pos_left hv.1 hk, mul_lt_mul_of_pos_left hv.2 hk⟩

private theorem sail_row {P lo hi vLo vHi tLo tHi eLo eHi : ℝ}
    (hP : 0 < P) (hlo : 0 ≤ lo) (hhi : 0 ≤ hi)
    (hsqLo : lo ^ 2 < 2 * P * 384400000 / (10000 * 299792458))
    (hsqHi : 2 * P * 384400000 / (10000 * 299792458) < hi ^ 2)
    (hvLo : vLo < lo) (hvHi : hi < vHi)
    (htLo : tLo < 2 * lo / sailAccel P / 3600) (htHi : 2 * hi / sailAccel P / 3600 < tHi)
    (heLo : eLo < 10000 * lo * 299792458) (heHi : 10000 * hi * 299792458 < eHi) :
    vLo < sailSpeed P ∧ sailSpeed P < vHi ∧
      tLo < sailHours P ∧ sailHours P < tHi ∧
      eLo < sailJoules P ∧ sailJoules P < eHi := by
  have hv2 : 0 ≤ 2 * P * 384400000 / (10000 * 299792458) := by positivity
  have hmem : lo < sailSpeed P ∧ sailSpeed P < hi := by
    unfold sailSpeed
    exact sqrt_between hv2 hlo hhi hsqLo hsqHi
  have ha : 0 < sailAccel P := by
    unfold sailAccel
    positivity
  have ht := time_mono ha hmem
  have hE := energy_scale (k := 10000 * (299792458 : ℝ)) (by norm_num) hmem
  have hrewrite : ∀ x : ℝ, 10000 * x * 299792458 = (10000 * 299792458) * x := by
    intro x
    ring
  unfold sailHours sailJoules
  refine ⟨?_, ?_, ?_, ?_, ?_, ?_⟩
  · linarith
  · linarith
  · linarith
  · linarith
  · rw [hrewrite (sailSpeed P)]
    rw [hrewrite lo] at heLo
    linarith
  · rw [hrewrite (sailSpeed P)]
    rw [hrewrite hi] at heHi
    linarith

theorem sail_1GW :
    (505 : ℝ) < sailSpeed (10 ^ 9) ∧ sailSpeed (10 ^ 9) < 515 ∧
      (4215 / 10 : ℝ) < sailHours (10 ^ 9) ∧ sailHours (10 ^ 9) < (4225 / 10 : ℝ) ∧
      (1515 * 10 ^ 12 : ℝ) < sailJoules (10 ^ 9) ∧ sailJoules (10 ^ 9) < (1525 * 10 ^ 12 : ℝ) := by
  refine sail_row (P := 10 ^ 9) (lo := 5064030 / 10000) (hi := 5064031 / 10000)
      (vLo := 505) (vHi := 515) (tLo := 4215 / 10) (tHi := 4225 / 10)
      (eLo := 1515 * 10 ^ 12) (eHi := 1525 * 10 ^ 12)
      (by norm_num) (by norm_num) (by norm_num) (by norm_num) (by norm_num)
      (by norm_num) (by norm_num) (by unfold sailAccel; norm_num)
      (by unfold sailAccel; norm_num) (by norm_num) (by norm_num)

theorem sail_10GW :
    (1595 : ℝ) < sailSpeed (10 ^ 10) ∧ sailSpeed (10 ^ 10) < 1605 ∧
      (1325 / 10 : ℝ) < sailHours (10 ^ 10) ∧ sailHours (10 ^ 10) < (1335 / 10 : ℝ) ∧
      (4795 * 10 ^ 12 : ℝ) < sailJoules (10 ^ 10) ∧ sailJoules (10 ^ 10) < (4805 * 10 ^ 12 : ℝ) := by
  refine sail_row (P := 10 ^ 10) (lo := 16013871 / 10000) (hi := 16013872 / 10000)
      (vLo := 1595) (vHi := 1605) (tLo := 1325 / 10) (tHi := 1335 / 10)
      (eLo := 4795 * 10 ^ 12) (eHi := 4805 * 10 ^ 12)
      (by norm_num) (by norm_num) (by norm_num) (by norm_num) (by norm_num)
      (by norm_num) (by norm_num) (by unfold sailAccel; norm_num)
      (by unfold sailAccel; norm_num) (by norm_num) (by norm_num)

theorem sail_100GW :
    (5055 : ℝ) < sailSpeed (10 ^ 11) ∧ sailSpeed (10 ^ 11) < 5065 ∧
      (415 / 10 : ℝ) < sailHours (10 ^ 11) ∧ sailHours (10 ^ 11) < (425 / 10 : ℝ) ∧
      (1515 * 10 ^ 13 : ℝ) < sailJoules (10 ^ 11) ∧ sailJoules (10 ^ 11) < (1525 * 10 ^ 13 : ℝ) := by
  refine sail_row (P := 10 ^ 11) (lo := 50640307 / 10000) (hi := 50640308 / 10000)
      (vLo := 5055) (vHi := 5065) (tLo := 415 / 10) (tHi := 425 / 10)
      (eLo := 1515 * 10 ^ 13) (eHi := 1525 * 10 ^ 13)
      (by norm_num) (by norm_num) (by norm_num) (by norm_num) (by norm_num)
      (by norm_num) (by norm_num) (by unfold sailAccel; norm_num)
      (by unfold sailAccel; norm_num) (by norm_num) (by norm_num)

theorem sail_1TW :
    (15950 : ℝ) < sailSpeed (10 ^ 12) ∧ sailSpeed (10 ^ 12) < 16050 ∧
      (1325 / 100 : ℝ) < sailHours (10 ^ 12) ∧ sailHours (10 ^ 12) < (1335 / 100 : ℝ) ∧
      (4795 * 10 ^ 13 : ℝ) < sailJoules (10 ^ 12) ∧ sailJoules (10 ^ 12) < (4805 * 10 ^ 13 : ℝ) := by
  refine sail_row (P := 10 ^ 12) (lo := 160138713 / 10000) (hi := 160138714 / 10000)
      (vLo := 15950) (vHi := 16050) (tLo := 1325 / 100) (tHi := 1335 / 100)
      (eLo := 4795 * 10 ^ 13) (eHi := 4805 * 10 ^ 13)
      (by norm_num) (by norm_num) (by norm_num) (by norm_num) (by norm_num)
      (by norm_num) (by norm_num) (by unfold sailAccel; norm_num)
      (by unfold sailAccel; norm_num) (by norm_num) (by norm_num)

theorem sail_15TW :
    (61500 : ℝ) < sailSpeed (15 * 10 ^ 12) ∧ sailSpeed (15 * 10 ^ 12) < 62500 ∧
      (3435 / 1000 : ℝ) < sailHours (15 * 10 ^ 12) ∧ sailHours (15 * 10 ^ 12) < (3445 / 1000 : ℝ) ∧
      (1855 * 10 ^ 14 : ℝ) < sailJoules (15 * 10 ^ 12) ∧
      sailJoules (15 * 10 ^ 12) < (1865 * 10 ^ 14 : ℝ) := by
  refine sail_row (P := 15 * 10 ^ 12) (lo := 620214571 / 10000) (hi := 620214572 / 10000)
      (vLo := 61500) (vHi := 62500) (tLo := 3435 / 1000) (tHi := 3445 / 1000)
      (eLo := 1855 * 10 ^ 14) (eHi := 1865 * 10 ^ 14)
      (by norm_num) (by norm_num) (by norm_num) (by norm_num) (by norm_num)
      (by norm_num) (by norm_num) (by unfold sailAccel; norm_num)
      (by unfold sailAccel; norm_num) (by norm_num) (by norm_num)

/- Film. Both faces radiate. The cruise uses momentum `2E/c`. -/

def filmIncident : ℚ := 1000 * sigmaSB * (600 ^ 4)
def filmAccel : ℚ := 2 * filmIncident * 1000000 / (20000 * cLight)
def oneGeeAbsorption : ℚ :=
  2 * sigmaSB * (600 ^ 4) * 1000000 / (gStd * 20000 * cLight)

theorem heat_balance {α ε σ T I : ℝ} (hα : α ≠ 0) (h : α * I = 2 * ε * σ * T ^ 4) :
    I = 2 * ε * σ * T ^ 4 / α := by
  field_simp [hα] at h ⊢
  linarith

theorem film_intensity_prints :
    7345 * 10 ^ 3 < filmIncident ∧ filmIncident < 7355 * 10 ^ 3 := by
  unfold filmIncident sigmaSB
  norm_num

theorem film_power_prints :
    7345 * 10 ^ 9 < filmIncident * 1000000 ∧ filmIncident * 1000000 < 7355 * 10 ^ 9 := by
  unfold filmIncident sigmaSB
  norm_num

theorem film_accel_prints :
    (2445 / 1000 : ℚ) < filmAccel ∧ filmAccel < (2455 / 1000 : ℚ) ∧
      (245 / 1000 : ℚ) < filmAccel / gStd ∧ filmAccel / gStd < (255 / 1000 : ℚ) := by
  unfold filmAccel filmIncident sigmaSB gStd cLight
  norm_num

theorem station_mass_prints :
    725 * 10 ^ 5 < filmIncident * 1000000 / 100 / 1000 ∧
      filmIncident * 1000000 / 100 / 1000 < 735 * 10 ^ 5 ∧
      725 * 10 ^ 6 < filmIncident * 1000000 / 10 / 1000 ∧
      filmIncident * 1000000 / 10 / 1000 < 735 * 10 ^ 6 := by
  unfold filmIncident sigmaSB
  norm_num

theorem one_gee_is_the_cruise_scaled : oneGeeAbsorption = (1 / 1000) * filmAccel / gStd := by
  unfold oneGeeAbsorption filmAccel filmIncident sigmaSB gStd cLight
  norm_num

theorem one_gee_absorption_prints :
    (2495 / 10 ^ 7 : ℚ) < oneGeeAbsorption ∧ oneGeeAbsorption < (2505 / 10 ^ 7 : ℚ) := by
  unfold oneGeeAbsorption sigmaSB gStd cLight
  norm_num

theorem film_1200_intensity :
    1000 * sigmaSB * ((1200 : ℚ) ^ 4) = 16 * filmIncident := by
  unfold filmIncident sigmaSB
  norm_num

theorem film_1200_prints :
    (399 / 100 : ℚ) < 16 * filmAccel / gStd ∧ 16 * filmAccel / gStd < (401 / 100 : ℚ) ∧
      1175 * 10 ^ 11 < 16 * filmIncident * 1000000 ∧
      16 * filmIncident * 1000000 < 1185 * 10 ^ 11 := by
  unfold filmAccel filmIncident sigmaSB gStd cLight
  norm_num

noncomputable def filmSpeed : ℝ :=
  Real.sqrt (2 * (filmIncident : ℝ) * 1000000 * 384400000 / (20000 * 299792458))

theorem film_speed_bracket :
    (3069655 / 100 : ℝ) < filmSpeed ∧ filmSpeed < (3069656 / 100 : ℝ) := by
  unfold filmSpeed filmIncident sigmaSB
  refine sqrt_between (by norm_num) (by norm_num) (by norm_num) (by norm_num) (by norm_num)

theorem film_trip :
    (30650 : ℝ) < filmSpeed ∧ filmSpeed < 30750 ∧
      (695 / 100 : ℝ) < 2 * filmSpeed / (filmAccel : ℝ) / 3600 ∧
      2 * filmSpeed / (filmAccel : ℝ) / 3600 < (705 / 100 : ℝ) ∧
      (1835 * 10 ^ 14 : ℝ) < 20000 * filmSpeed * 299792458 ∧
      20000 * filmSpeed * 299792458 < (1845 * 10 ^ 14 : ℝ) := by
  have hb := film_speed_bracket
  have ha : (0 : ℝ) < filmAccel := by
    unfold filmAccel filmIncident sigmaSB cLight
    norm_num
  have ht := time_mono ha hb
  have hE := energy_scale (k := 20000 * (299792458 : ℝ)) (by norm_num) hb
  have hrewrite : ∀ x : ℝ, 20000 * x * 299792458 = (20000 * 299792458) * x := by
    intro x
    ring
  have hspeedLo : (30650 : ℝ) < 3069655 / 100 := by norm_num
  have hspeedHi : (3069656 / 100 : ℝ) < 30750 := by norm_num
  have htimeLo : (695 / 100 : ℝ) < 2 * (3069655 / 100) / (filmAccel : ℝ) / 3600 := by
    unfold filmAccel filmIncident sigmaSB cLight
    norm_num
  have htimeHi : 2 * (3069656 / 100 : ℝ) / (filmAccel : ℝ) / 3600 < (705 / 100 : ℝ) := by
    unfold filmAccel filmIncident sigmaSB cLight
    norm_num
  have hELo : (1835 * 10 ^ 14 : ℝ) < 20000 * (3069655 / 100) * 299792458 := by norm_num
  have hEHi : 20000 * (3069656 / 100 : ℝ) * 299792458 < (1845 * 10 ^ 14 : ℝ) := by norm_num
  refine ⟨?_, ?_, ?_, ?_, ?_, ?_⟩
  · linarith
  · linarith
  · linarith
  · linarith
  · rw [hrewrite filmSpeed]
    rw [hrewrite (3069655 / 100)] at hELo
    linarith
  · rw [hrewrite filmSpeed]
    rw [hrewrite (3069656 / 100)] at hEHi
    linarith

theorem film_1200_trip :
    (122500 : ℝ) < 4 * filmSpeed ∧ 4 * filmSpeed < 123500 ∧
      (165 / 100 : ℝ) < (2 * filmSpeed / (filmAccel : ℝ) / 3600) / 4 ∧
      (2 * filmSpeed / (filmAccel : ℝ) / 3600) / 4 < (175 / 100 : ℝ) := by
  have hb := film_speed_bracket
  have h4lo : (122500 : ℝ) < 4 * (3069655 / 100 : ℝ) := by norm_num
  have h4hi : 4 * (3069656 / 100 : ℝ) < (123500 : ℝ) := by norm_num
  have ha : (0 : ℝ) < filmAccel := by
    unfold filmAccel filmIncident sigmaSB cLight
    norm_num
  have ht := time_mono ha hb
  have htLo : (165 / 100 : ℝ) < (2 * (3069655 / 100 : ℝ) / (filmAccel : ℝ) / 3600) / 4 := by
    unfold filmAccel filmIncident sigmaSB cLight
    norm_num
  have htHi : (2 * (3069656 / 100 : ℝ) / (filmAccel : ℝ) / 3600) / 4 < (175 / 100 : ℝ) := by
    unfold filmAccel filmIncident sigmaSB cLight
    norm_num
  have hdiv : ∀ x : ℝ, (2 * x / (filmAccel : ℝ) / 3600) / 4 =
      x * (2 / ((filmAccel : ℝ) * 3600 * 4)) := by
    intro x
    field_simp [ha.ne']
  rw [hdiv filmSpeed, hdiv (3069655 / 100), hdiv (3069656 / 100)] at *
  have hk : (0 : ℝ) < 2 / ((filmAccel : ℝ) * 3600 * 4) := by positivity
  refine ⟨?_, ?_, ?_, ?_⟩ <;> linarith [mul_lt_mul_of_pos_right hb.1 hk,
    mul_lt_mul_of_pos_right hb.2 hk]

theorem sheet_diameter :
    (1125 : ℝ) < Real.sqrt (4 * 10 ^ 6 / Real.pi) ∧ Real.sqrt (4 * 10 ^ 6 / Real.pi) < 1135 := by
  constructor
  · rw [Real.lt_sqrt (by norm_num)]
    rw [lt_div_iff₀ Real.pi_pos]
    have hπ : Real.pi < 3.15 := Real.pi_lt_d2
    have hnum : (1125 : ℝ) ^ 2 * 3.15 < 4 * 10 ^ 6 := by norm_num
    nlinarith
  · rw [Real.sqrt_lt (by positivity) (by norm_num)]
    rw [div_lt_iff₀ Real.pi_pos]
    have hπ : 3.14 < Real.pi := Real.pi_gt_d2
    have hnum : (4 : ℝ) * 10 ^ 6 < 1135 ^ 2 * 3.14 := by norm_num
    nlinarith

theorem lunar_film_aperture :
    (335 / 1000 : ℝ) < (3844 / 10) / Real.sqrt (4 * 10 ^ 6 / Real.pi) ∧
      (3844 / 10) / Real.sqrt (4 * 10 ^ 6 / Real.pi) < (345 / 1000 : ℝ) := by
  have hd := sheet_diameter
  have hlo : (3844 / 10 : ℝ) / 1135 < (3844 / 10) / Real.sqrt (4 * 10 ^ 6 / Real.pi) :=
    div_lt_div_of_pos_left (by norm_num) (by linarith [hd.1]) hd.2
  have hhi : (3844 / 10) / Real.sqrt (4 * 10 ^ 6 / Real.pi) < (3844 / 10) / 1125 :=
    div_lt_div_of_pos_left (by norm_num) (by norm_num) hd.1
  have hnumLo : (335 / 1000 : ℝ) < (3844 / 10) / 1135 := by norm_num
  have hnumHi : (3844 / 10 : ℝ) / 1125 < 345 / 1000 := by norm_num
  constructor <;> linarith

/- Density-cap scale of the scored one-sixth shape. Not a second grid. -/

def peakRho : ℚ := 1263867 * 10 ^ 17
def halfRho : ℚ := 2015068 * 10 ^ 17

theorem peak_fraction_prints :
    (6265 / 10000 : ℚ) < peakRho / halfRho ∧ peakRho / halfRho < (6275 / 10000 : ℚ) := by
  unfold peakRho halfRho
  norm_num

theorem scale_hits_cap {rhoPeak rhoCap : ℝ} (hp : 0 < rhoCap) (hs : 0 < rhoPeak) :
    rhoPeak / (Real.sqrt (rhoPeak / rhoCap)) ^ 2 = rhoCap := by
  have hnonneg : 0 ≤ rhoPeak / rhoCap := div_nonneg hs.le hp.le
  rw [Real.sq_sqrt hnonneg]
  field_simp

theorem resize_same_compactness {M R s : ℝ} (hR : R ≠ 0) (hs : s ≠ 0) :
    M * s / (R * s) = M / R := by
  field_simp

noncomputable def densityScale : ℝ := Real.sqrt ((peakRho : ℝ) / halfRho)

theorem density_scale_bracket :
    (79196 / 100000 : ℝ) < densityScale ∧ densityScale < (79197 / 100000 : ℝ) := by
  unfold densityScale peakRho halfRho
  refine sqrt_between (by norm_num) (by norm_num) (by norm_num) (by norm_num) (by norm_num)

theorem density_scale_prints :
    (15835 / 1000 : ℝ) < 20 * densityScale ∧ 20 * densityScale < (15845 / 1000 : ℝ) ∧
      (17765 * 10 ^ 23 : ℝ) < (compactMass (1 / 6) 20) * densityScale ∧
      (compactMass (1 / 6) 20) * densityScale < (17775 * 10 ^ 23 : ℝ) ∧
      (9355 / 10000 : ℝ) < (compactMass (1 / 6) 20) * densityScale / jupiterMass ∧
      (compactMass (1 / 6) 20) * densityScale / jupiterMass < (9365 / 10000 : ℝ) := by
  have hb := density_scale_bracket
  have hRlo : (15835 / 1000 : ℝ) < 20 * (79196 / 100000) := by norm_num
  have hRhi : 20 * (79197 / 100000 : ℝ) < 15845 / 1000 := by norm_num
  have hM : (0 : ℝ) < compactMass (1 / 6) 20 := by
    unfold compactMass cLight GNewt
    norm_num
  have hMscale := energy_scale (k := (compactMass (1 / 6) 20 : ℝ)) hM hb
  have hMlo : (17765 * 10 ^ 23 : ℝ) < (compactMass (1 / 6) 20) * (79196 / 100000) := by
    unfold compactMass cLight GNewt
    norm_num
  have hMhi : (compactMass (1 / 6) 20 : ℝ) * (79197 / 100000) < 17775 * 10 ^ 23 := by
    unfold compactMass cLight GNewt
    norm_num
  have hJlo : (9355 / 10000 : ℝ) <
      (compactMass (1 / 6) 20) * (79196 / 100000) / jupiterMass := by
    unfold compactMass cLight GNewt jupiterMass
    norm_num
  have hJhi : (compactMass (1 / 6) 20 : ℝ) * (79197 / 100000) / jupiterMass < 9365 / 10000 := by
    unfold compactMass cLight GNewt jupiterMass
    norm_num
  have hJ : (0 : ℝ) < jupiterMass := by unfold jupiterMass; norm_num
  refine ⟨?_, ?_, ?_, ?_, ?_, ?_⟩
  · linarith [mul_lt_mul_of_pos_left hb.1 (by norm_num : (0 : ℝ) < 20)]
  · linarith [mul_lt_mul_of_pos_left hb.2 (by norm_num : (0 : ℝ) < 20)]
  · linarith
  · linarith
  · have hdiv := div_lt_div_of_pos_right hMscale.1 hJ
    linarith
  · have hdiv := div_lt_div_of_pos_right hMscale.2 hJ
    linarith

/- External pull of the one-sixth mass. Ledger arithmetic, not a grid score. -/

def shredCube : ℚ := 2 * GNewt * compactMass (1 / 6) 20 * earthRadius / gStd

theorem shred_about_58000km :
    (57950 * 1000) ^ 3 < shredCube ∧ shredCube < (58000 * 1000) ^ 3 := by
  unfold shredCube compactMass cLight GNewt earthRadius gStd
  norm_num

def leoPull : ℚ := GNewt * compactMass (1 / 6) 20 / (leoRadius ^ 2 * gStd)
def leoTide : ℚ := 2 * GNewt * compactMass (1 / 6) 20 * earthRadius / (leoRadius ^ 3 * gStd)
def moonPull : ℚ := GNewt * compactMass (1 / 6) 20 / (moonDistance ^ 2 * gStd)

theorem leo_pull_prints : (325 : ℚ) < leoPull ∧ leoPull < 335 := by
  unfold leoPull compactMass cLight GNewt leoRadius gStd
  norm_num

theorem leo_tide_prints : (625 : ℚ) < leoTide ∧ leoTide < 635 := by
  unfold leoTide compactMass cLight GNewt earthRadius leoRadius gStd
  norm_num

theorem moon_pull_prints : (95 / 1000 : ℚ) < moonPull ∧ moonPull < (105 / 1000 : ℚ) := by
  unfold moonPull compactMass cLight GNewt moonDistance gStd
  norm_num

theorem tide_ratio_is_mass {Mshell Mmoon d RE G : ℝ}
    (hG : G ≠ 0) (hRE : RE ≠ 0) (hd : d ≠ 0) (hM : Mmoon ≠ 0) :
    (2 * G * Mshell * RE / d ^ 3) / (2 * G * Mmoon * RE / d ^ 3) = Mshell / Mmoon := by
  field_simp

theorem lunar_tide_ratio :
    (30000 : ℚ) < compactMass (1 / 6) 20 / moonMass ∧
      compactMass (1 / 6) 20 / moonMass < 31000 := by
  unfold compactMass cLight GNewt moonMass
  norm_num

noncomputable def moonEqualDistance : ℝ :=
  moonDistance * Real.sqrt ((compactMass (1 / 6) 20 : ℝ) / moonMass)

theorem moon_equal_distance_prints :
    (445 / 1000 : ℝ) * astronomicalUnit < moonEqualDistance ∧
      moonEqualDistance < (455 / 1000 : ℝ) * astronomicalUnit := by
  unfold moonEqualDistance
  have hpos : (0 : ℝ) < moonDistance := by
    unfold moonDistance
    norm_num
  have hsLo : (445 / 1000 : ℝ) * astronomicalUnit / moonDistance <
      Real.sqrt ((compactMass (1 / 6) 20 : ℝ) / moonMass) := by
    rw [Real.lt_sqrt (by unfold astronomicalUnit moonDistance; norm_num)]
    unfold compactMass cLight GNewt moonMass astronomicalUnit moonDistance
    norm_num
  have hsHi : Real.sqrt ((compactMass (1 / 6) 20 : ℝ) / moonMass) <
      (455 / 1000 : ℝ) * astronomicalUnit / moonDistance := by
    rw [Real.sqrt_lt
      (by unfold compactMass cLight GNewt moonMass; norm_num)
      (by unfold astronomicalUnit moonDistance; norm_num)]
    unfold compactMass cLight GNewt moonMass astronomicalUnit moonDistance
    norm_num
  constructor
  · have hmul := mul_lt_mul_of_pos_left hsLo hpos
    have hclear : moonDistance * ((445 / 1000 : ℝ) * astronomicalUnit / moonDistance) =
        (445 / 1000) * astronomicalUnit := by
      field_simp
    linarith
  · have hmul := mul_lt_mul_of_pos_left hsHi hpos
    have hclear : moonDistance * ((455 / 1000 : ℝ) * astronomicalUnit / moonDistance) =
        (455 / 1000) * astronomicalUnit := by
      field_simp
    linarith

/- One acceleration. The lunar trip is the short range. 0.04c is the same film held longer. -/

theorem film_reaches_point04_days :
    (565 / 10 : ℚ) < ((1 / 25) * cLight) / filmAccel / 86400 ∧
      ((1 / 25) * cLight) / filmAccel / 86400 < (567 / 10 : ℚ) := by
  unfold filmAccel filmIncident sigmaSB cLight
  norm_num

theorem film_reaches_point04_au :
    (1955 / 10 : ℚ) < ((1 / 25) * cLight) ^ 2 / (2 * filmAccel) / astronomicalUnit ∧
      ((1 / 25) * cLight) ^ 2 / (2 * filmAccel) / astronomicalUnit < (1965 / 10 : ℚ) := by
  unfold filmAccel filmIncident sigmaSB cLight astronomicalUnit
  norm_num

theorem film_round_trip_energy :
    (7185 * 10 ^ 16 : ℚ) < 20000 * ((1 / 25) * cLight) * cLight ∧
      20000 * ((1 / 25) * cLight) * cLight < (7195 * 10 ^ 16 : ℚ) := by
  unfold cLight
  norm_num

theorem film_round_trip_is_two_legs :
    2 * (((1 / 25) * cLight) / filmAccel / 86400) =
      ((1 / 25) * cLight) / filmAccel / 43200 ∧
    2 * (((1 / 25) * cLight) ^ 2 / (2 * filmAccel) / astronomicalUnit) =
      ((1 / 25) * cLight) ^ 2 / filmAccel / astronomicalUnit := by
  constructor
  · field_simp
    ring
  · field_simp

end

end WarpLedger
