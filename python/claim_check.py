# Copyright 2026 Damian Arthur Palumbo
# SPDX-License-Identifier: Apache-2.0
"""Reprint the shutdown mean, the depth-5 name, and the gate's h from the pin.

The pin is fsot_compute.py in the FSOT 2.1 vendor tree. Set FSOT_VENDOR to
that directory, or clone FSOT-2.1-Lean next to this repository. The script
exits 1 when the pin is absent or the reprint disagrees. It does not edit
the pin. The seated optics-computing h stays the published value. The pin's
kappa_domains on that pair sits one unit in the last place above it.
"""

from __future__ import annotations

import hashlib
import math
import os
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
PIN_PREFIX = "aeb2adad6e80f487"
SHUTDOWN_MEAN = 7.3407640288136422e-01
CLOSED = -0.6456729548144859
OPEN = 0.9501974701670142
H_DEPTH5 = 9.8587139727597098e-02
H_OPTICS = 1.0001300937604073e-01
DEPTH5_NAMES = ("Particle_Physics", "Quantum_Mechanics")

failures: list[str] = []


def check(name: str, ok: bool, detail: str) -> None:
    print(f"{'PASS' if ok else 'FAIL'}  {name}  {detail}")
    if not ok:
        failures.append(f"{name}: {detail}")


def vendor_dir() -> Path | None:
    named = os.environ.get("FSOT_VENDOR", "")
    if named and (Path(named) / "fsot_compute.py").is_file():
        return Path(named)
    guess = ROOT.parent / "FSOT-2.1-Lean" / "vendor"
    if (guess / "fsot_compute.py").is_file():
        return guess
    return None


def main() -> int:
    vendor = vendor_dir()
    if vendor is None:
        check(
            "pin present",
            False,
            "set FSOT_VENDOR to the AEB2AD vendor directory, or clone FSOT-2.1-Lean next to this repository",
        )
        print("RESULT  1 failures")
        return 1

    pin_path = vendor / "fsot_compute.py"
    digest = hashlib.sha256(pin_path.read_bytes()).hexdigest()
    check("pin AEB2AD", digest.startswith(PIN_PREFIX), digest[:16])
    if not digest.startswith(PIN_PREFIX):
        print(f"RESULT  {len(failures)} failures")
        return 1

    sys.path.insert(0, str(vendor))
    import fsot_complex_interaction as ci
    import fsot_dynamics as fd
    import fsot_matter_antimatter as ma
    import fsot_scale_interconnects as si
    from fsot_compute import A_BLEED, DOMAINS, POOF, domain_scalar

    clock = ci.coupled_equilibrium()
    names = clock["sectors"]
    coupled = [clock["S_coupled"][name] for name in names]
    bare = [clock["S_bare"][name] for name in names]
    mean_coupled = sum(coupled) / len(coupled)
    mean_bare = sum(bare) / len(bare)
    print(f"INFO  shutdown_mean={mean_coupled:.17g} steps={clock['steps']}")
    check("shutdown steps", clock["steps"] == 7, str(clock["steps"]))
    check(
        "shutdown mean",
        mean_coupled == SHUTDOWN_MEAN and mean_bare == SHUTDOWN_MEAN and mean_coupled == mean_bare,
        f"coupled={mean_coupled:.17g} bare={mean_bare:.17g}",
    )

    closed = fd.scalar_at_D(5, False)
    open_scalar = fd.scalar_at_D(5, True)
    print(f"INFO  depth5_closed={closed:.17g} depth5_open={open_scalar:.17g}")
    check("depth-5 closed value", closed == CLOSED, f"{closed:.17g}")
    check("depth-5 open value", open_scalar == OPEN, f"{open_scalar:.17g}")

    unobserved = []
    observed_closed = []
    for name in DOMAINS:
        if ma.matter_unobserved_S(name) == closed:
            unobserved.append(name)
        if float(domain_scalar(name)) == closed:
            observed_closed.append(name)
    unobserved.sort()
    print(f"INFO  depth5_names={','.join(unobserved)}")
    check("depth-5 name", tuple(unobserved) == DEPTH5_NAMES, ",".join(unobserved) or "(none)")
    check("closed value is unobserved", observed_closed == [], ",".join(observed_closed) or "(none)")
    for name in DEPTH5_NAMES:
        check(
            f"open reading {name}",
            float(domain_scalar(name)) == open_scalar,
            f"{float(domain_scalar(name)):.17g}",
        )
        check(
            f"closed reading {name}",
            ma.matter_unobserved_S(name) == closed,
            f"{ma.matter_unobserved_S(name):.17g}",
        )

    h = float(A_BLEED) * float(POOF) * abs(open_scalar) * abs(closed)
    pin_optics = si.kappa_domains("Quantum_Optics", "Quantum_Computing")
    observed_pair = si.kappa_domains("Particle_Physics", "Quantum_Mechanics")
    print(f"INFO  h_depth5={h:.17g} product={-h:.17g}")
    print(f"INFO  h_optics_seated={H_OPTICS:.17g} h_optics_pin={pin_optics:.17g}")
    print(f"INFO  particle_qm_observed_kappa={observed_pair:.17g}")
    check("depth-5 h", h == H_DEPTH5, f"{h:.17g}")
    check("depth-5 product", -h == -H_DEPTH5, f"{-h:.17g}")
    gap = pin_optics - H_OPTICS
    check(
        "optics pin is one ulp above the seated h",
        gap == math.ulp(H_OPTICS),
        f"pin={pin_optics:.17g} seated={H_OPTICS:.17g} gap={gap:.17g}",
    )
    check(
        "seated optics h stays",
        H_OPTICS != pin_optics,
        f"seated={H_OPTICS:.17g}",
    )

    print(f"RESULT  {len(failures)} failures")
    return 1 if failures else 0


if __name__ == "__main__":
    sys.exit(main())
