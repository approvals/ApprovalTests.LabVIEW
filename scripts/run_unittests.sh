#! /usr/bin/env bash
mkdir reports 2> /dev/null
rm "reports\\Caraya.UnitTestReport.xml" 2>/dev/null
rm "reports\\LUnit.UnitTestReport.xml" 2>/dev/null
rm "reports\\VITester.UnitTestReport.xml" 2>/dev/null
rm "reports\\Scrubber.UnitTestReport.xml" 2>/dev/null

green=$(tput setaf 2)
red=$(tput setaf 1)
reset=$(tput sgr0)
bold=$(tput bold)

fail() {
    echo "${bold}${red}FAIL${reset}"
    exit 1
}

set -euo pipefail

HERE=$(cygpath -w $(pwd))

g-cli vipc -- -v "${LV_VERSION:-"20.0 (64-bit)"}" -t 1200 "approvals-dev.vipc" || fail
g-cli lunit -- -r "reports\\LUnit.UnitTestReport.xml" "Approval Testing.lvproj" || fail
g-cli vitester -- -r "reports\\VITester.UnitTestReport.xml" "Tests\\Extension Tests.lvproj" || fail
SECONDS=0
echo "Running Caraya Extension Tests" # needed because caray tool is not very verbose.
g-cli caraya -- -s "Tests\\Caraya.Tests\\Caraya Extension Tests\\Caraya Extension Tests.lvclass" -x "reports\\Caraya.UnitTestReport.xml" || fail
echo "Test Time: $SECONDS"
SECONDS=0
echo "Running Error Propagation Tests"
g-cli caraya -- -s "Tests\\Error.Propagation.Tests\\Error.Propagation.Tests.lvclass" -x "reports\\Error.Propagation.UnitTestReport.xml" || fail
echo "Test Time: $SECONDS"
echo "${bold}${green}PASS${reset}" 

