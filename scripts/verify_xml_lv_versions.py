#!/usr/bin/env python3
"""Verify the XML-based LabVIEW files in the built package were saved in the right LabVIEW version.

pylavi's vi_validate only reads the binary resource formats (.vi, .ctl, ...), so it
never looks at .lvlib / .lvclass files. In 3.0.0 every .lvlib and .lvclass in the
package was saved in LabVIEW 2026 (LVVersion="26008000") instead of 2020, and the
pylavi check still passed. This check fails the build if that happens again.

The version is read from the LVVersion attribute on the root element, e.g.
LVVersion="20008000" -> 20.0 (major = first two digits, minor = third digit).
The range mirrors pylavi's: version >= GT and version < LT.

Usage: verify_xml_lv_versions.py [package_dir] [--gt 20] [--lt 21]
"""
import argparse
import os
import re
import sys

XML_EXTENSIONS = {".lvlib", ".lvclass", ".xctl", ".lvsc"}
LV_VERSION = re.compile(rb'\bLVVersion="(\d{8})"')

parser = argparse.ArgumentParser(description=__doc__.splitlines()[0])
parser.add_argument("package_dir", nargs="?", default="source")
parser.add_argument("--gt", type=float, default=20, help="minimum LabVIEW version (inclusive)")
parser.add_argument("--lt", type=float, default=21, help="maximum LabVIEW version (exclusive)")
args = parser.parse_args()

checked = 0
errors = []
for root, _, files in os.walk(args.package_dir):
    for name in sorted(files):
        if os.path.splitext(name)[1].lower() not in XML_EXTENSIONS:
            continue
        path = os.path.join(root, name)
        rel = os.path.relpath(path, args.package_dir)
        checked += 1
        with open(path, "rb") as f:
            match = LV_VERSION.search(f.read(4096))  # attribute is on the root element
        if not match:
            errors.append(f"{rel}: no LVVersion attribute found")
            continue
        raw = match.group(1).decode()
        version = int(raw[:2]) + int(raw[2]) / 10
        status = "OK  " if args.gt <= version < args.lt else "FAIL"
        print(f"{status} {raw} ({version:g})  {rel}")
        if status == "FAIL":
            errors.append(f"{rel}: saved in LabVIEW {version:g} (LVVersion={raw}), expected >= {args.gt:g} and < {args.lt:g}")

if checked == 0:
    errors.append(f"No {', '.join(sorted(XML_EXTENSIONS))} files found under {args.package_dir}")

if errors:
    print(f"\nXML LabVIEW version check FAILED ({len(errors)} problem(s)):")
    for e in errors:
        print(f"  {e}")
    sys.exit(1)
print(f"\nXML LabVIEW version check passed ({checked} files).")
