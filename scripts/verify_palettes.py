#!/usr/bin/env python3
"""Verify the built package installs its palette (.mnu) files where LabVIEW will find them.

In 3.0.x the Linux `vipm build` put the sub-palette .mnu files in <application>,
put dir.mnu in <menus>/SAS and dropped the top-level palette .mnu entirely, so the
palettes silently vanished from LabVIEW. This check fails the build if that happens again.

Checks:
  - the top-level palette and every sub-palette install to exactly <menus>/Categories
    (they refer to each other by bare file name, so they must sit side by side);
    an extra copy of the top-level palette in a Categories subfolder (the SAS
    custom category) is allowed;
  - every sub-palette a palette links to is in the package under that exact name
    (case matters: Linux file systems are case-sensitive);
  - every other .mnu (e.g. a category's dir.mnu) installs somewhere under <menus>/Categories.

Usage: verify_palettes.py [path/to/unzipped/package/spec]
"""
import os
import re
import sys

SPEC_PATH = sys.argv[1] if len(sys.argv) > 1 else "source/spec"
PACKAGE_DIR = os.path.dirname(SPEC_PATH) or "."
TOP_LEVEL_MNU = "functions_sas_lib_approval_tests.mnu"
PALETTE_ROOT = "<menus>/Categories"
PALETTE_FILE = re.compile(r"^_?functions_.*\.mnu$", re.IGNORECASE)
# Sub-palette links are stored inside a .mnu as bare file names.
SUB_PALETTE_LINK = re.compile(rb"_functions_[A-Za-z0-9_]+\.mnu")

with open(SPEC_PATH, encoding="utf-8", errors="replace") as f:
    spec = f.read()

# Collect every .mnu: (target dir, file name, path inside the unzipped package).
mnu_files = []
for group in re.finditer(r"^\[File Group (\d+)\]\s*$(.*?)(?=^\[|\Z)", spec, re.MULTILINE | re.DOTALL):
    index, body = group.group(1), group.group(2)
    target = re.search(r'^Target Dir="(.*)"\s*$', body, re.MULTILINE)
    target_dir = target.group(1).replace("\\", "/").rstrip("/") if target else ""
    for name in re.findall(r'^File \d+="(.*)"\s*$', body, re.MULTILINE):
        if name.lower().endswith(".mnu"):
            mnu_files.append((target_dir, name, os.path.join(PACKAGE_DIR, f"File Group {index}", name)))

print("Palette files in package:")
for target_dir, name, _ in mnu_files:
    print(f"  {target_dir}/{name}")

errors = []
if not mnu_files:
    errors.append("No .mnu palette files found in the package.")

palettes = [m for m in mnu_files if PALETTE_FILE.match(os.path.basename(m[1]))]
others = [m for m in mnu_files if m not in palettes]

def under_palette_root(target_dir):
    return (target_dir.lower() + "/").startswith(PALETTE_ROOT.lower() + "/")

for target_dir, name, _ in palettes:
    if target_dir.lower() == PALETTE_ROOT.lower() and "/" not in name:
        continue
    # VIPM's custom-category palette set also drops a copy of the top-level palette
    # into <menus>/Categories/<category> (2.5.1 shipped this too) - that's fine.
    if name == TOP_LEVEL_MNU and under_palette_root(target_dir):
        continue
    errors.append(f'"{name}" installs to "{target_dir}", not {PALETTE_ROOT}.')

for target_dir, name, _ in others:
    if not under_palette_root(target_dir):
        errors.append(f'"{name}" installs to "{target_dir}", which is not under {PALETTE_ROOT}.')

installed = {name for target_dir, name, _ in palettes if target_dir.lower() == PALETTE_ROOT.lower()}
if TOP_LEVEL_MNU not in installed:
    errors.append(f'Top-level palette "{TOP_LEVEL_MNU}" is not installed to {PALETTE_ROOT}.')

for target_dir, name, path in palettes:
    if not os.path.isfile(path):
        errors.append(f'"{name}" is listed in the spec but missing from the package ({path}).')
        continue
    with open(path, "rb") as f:
        links = sorted({m.decode("ascii") for m in SUB_PALETTE_LINK.findall(f.read())})
    for link in links:
        if link != name and link not in installed:
            errors.append(f'"{name}" links to sub-palette "{link}", which is not installed to {PALETTE_ROOT}.')

if errors:
    print("Palette check FAILED:")
    for e in errors:
        print(f"  - {e}")
    sys.exit(1)

print("Palette check passed.")
