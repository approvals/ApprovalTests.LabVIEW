#! /usr/bin/env bash
mkdir reports 2> /dev/null
rm "reports\\Caraya.InstallTestReport.xml" 2>/dev/null
rm "reports\\LUnit.InstallTestReport.xml" 2>/dev/null
rm "reports\\VITester.InstallTestReport.xml" 2>/dev/null

set -euo pipefail

HERE=$(cygpath -w $(pwd))
g-cli vipc -- -v "${LV_VERSION:-"20.0 (64-bit)"}" -t 1200 "approvals-dev.vipc"
# if above fails set LV_VERSION ENV variable. If you have the vip tool. then `g-cli vip -- --list` will list all available version strings.
SECONDS=0
echo "Running Caraya Tests" # needed because caray tool is not very verbose.
g-cli caraya -- -s "InstallTests\\Caraya.Tests\\Caraya Extension Tests\\Caraya Extension Tests.lvclass" -x "reports\\Caraya.InstallTestReport.xml"
echo "Test Time: $SECONDS"
g-cli vitester -- -r "reports\\VITester.InstallTestReport.xml" "InstallTests\\VITester.Tests\\VITester Extension Tests\\VITester Extension Tests.lvclass"
g-cli lunit -- -r "reports\\LUnit.InstallTestReport.xml" "InstallTests"

