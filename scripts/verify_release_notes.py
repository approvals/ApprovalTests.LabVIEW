#!/usr/bin/env python3
import re
import sys

SPEC_PATH = "source/spec"
RELEASE_NOTES_PATH = "release-notes.txt"

with open(SPEC_PATH, encoding="utf-8") as f:
    spec = f.read()

match = re.search(r'^Release Notes="(.*)"$', spec, re.MULTILINE)
if not match:
    print(f"Could not find Release Notes in {SPEC_PATH}")
    sys.exit(1)

spec_notes = match.group(1).replace("\\0A", "\n")

with open(RELEASE_NOTES_PATH, encoding="utf-8") as f:
    repo_notes = f.read()

spec_notes = spec_notes.replace("\r\n", "\n").rstrip("\n")
repo_notes = repo_notes.replace("\r\n", "\n").rstrip("\n")

if spec_notes != repo_notes:
    print("Release notes mismatch between release-notes.txt and the built package's spec file.")
    print(f"--- {RELEASE_NOTES_PATH} ---")
    print(repo_notes)
    print(f"--- {SPEC_PATH} Release Notes ---")
    print(spec_notes)
    sys.exit(1)

print("Release notes match.")
