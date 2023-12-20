#! /usr/bin/bash

set -euo pipefail

HERE=$(cygpath -w $(pwd))

g-cli vipc -- -v "20.0 (64-bit)" -t 1200 "Approval Testing.vipc"
# begin-snippet: run_tests
echo "Running Caraya Tests" # needed because caray tool is not very verbose.
g-cli caraya -- -s "Tests\\Caraya.Tests\\Caraya Extension Test Suite\\Caraya Extension Test Suite.lvclass" -x "Caraya.UnitTestReport.xml"
# Temporarily disable VITester.
#g-cli vitester -- -r "VItester.UnitTestReport.xml" "Approval Testing.lvproj"
# end-snippet
