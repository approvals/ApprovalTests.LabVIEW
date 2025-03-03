#! /usr/bin/bash
mkdir reports 2> /dev/null
rm "reports\\Caraya.UnitTestReport.xml" 2>/dev/null
rm "reports\\LUnit.UnitTestReport.xml" 2>/dev/null
rm "reports\\VITester.UnitTestReport.xml" 2>/dev/null
rm "reports\\Scrubber.UnitTestReport.xml" 2>/dev/null

set -euo pipefail

HERE=$(cygpath -w $(pwd))

g-cli vipc -- -v "${LV_VERSION:-"20.0 (64-bit)"}" -t 1200 "approvals-dev.vipc"
# begin-snippet: run_tests
SECONDS=0
echo "Running Basic Mechanics Tests"
g-cli caraya -- -s "Tests\\Basic.Mechanics.Tests\\Basic.Mechanics.Tests.lvclass" -x "reports\\Basic.Mechanics.UnitTestReport.xml"
echo "Test Time: $SECONDS"
SECONDS=0
echo "Running Caraya Tests" # needed because caray tool is not very verbose.
g-cli caraya -- -s "Tests\\Caraya.Tests\\Caraya Extension Tests\\Caraya Extension Tests.lvclass" -x "reports\\Caraya.UnitTestReport.xml"
echo "Test Time: $SECONDS"
SECONDS=0
echo "Running Scrubber Tests"
g-cli caraya -- -s "Tests\\Scrubber.Tests\\Scrubber.Tests.lvclass" -x "reports\\Scrubber.UnitTestReport.xml"
echo "Test Time: $SECONDS"
SECONDS=0
echo "Running Error Propagation Tests"
g-cli caraya -- -s "Tests\\Error.Propagation.Tests\\Error.Propagation.Tests.lvclass" -x "reports\\Error.Propagation.UnitTestReport.xml"
echo "Test Time: $SECONDS"
g-cli vitester -- -r "reports\\VITester.UnitTestReport.xml" "Approval Testing.lvproj"
g-cli lunit -- -r "reports\\LUnit.UnitTestReport.xml" "Approval Testing.lvproj"
# end-snippet
