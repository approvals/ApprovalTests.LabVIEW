#!/usr/bin/env python3
"""Verify the built package installs its palette (.mnu) files where LabVIEW will find them.

In 3.0.x the Linux `vipm build` put the sub-palette .mnu files in <application>,
put dir.mnu in <menus>/SAS and dropped the top-level palette .mnu entirely, so the
palettes silently vanished from LabVIEW. This check fails the build if that happens again.
"""
import re
import sys

SPEC_PATH = sys.argv[1] if len(sys.argv) > 1 else "source/spec"
TOP_LEVEL_MNU = "functions_sas_lib_approval_tests.mnu"
PALETTE_ROOT = "<menus>/categories"

with open(SPEC_PATH, encoding="utf-8", errors="replace") as f:
    spec = f.read()

# Map each file group's Target Dir to the files it installs.
mnu_files = []  # (target_dir, file_name)
for group in re.split(r"^\[File Group \d+\]\s*$", spec, flags=re.MULTILINE)[1:]:
    target = re.search(r'^Target Dir="(.*)"\s*$', group, re.MULTILINE)
    target_dir = target.group(1).replace("\\", "/").rstrip("/") if target else ""
    for name in re.findall(r'^File \d+="(.*)"\s*$', group, re.MULTILINE):
        if name.lower().endswith(".mnu"):
            mnu_files.append((target_dir, name))

errors = []
if not mnu_files:
    errors.append("No .mnu palette files found in the package.")

for target_dir, name in mnu_files:
    if not target_dir.lower().startswith(PALETTE_ROOT):
        errors.append(f'"{name}" installs to "{target_dir}", which is not under <menus>/Categories.')

if not any(name.lower() == TOP_LEVEL_MNU and target_dir.lower().startswith(PALETTE_ROOT)
           for target_dir, name in mnu_files):
    errors.append(f'Top-level palette "{TOP_LEVEL_MNU}" is not installed under <menus>/Categories.')

print("Palette files in package:")
for target_dir, name in mnu_files:
    print(f"  {target_dir}/{name}")

if errors:
    print("Palette check FAILED:")
    for e in errors:
        print(f"  - {e}")
    sys.exit(1)

print("Palette check passed.")
