#! /usr/bin/env bash
mkdir reports 2> /dev/null
rm "reports/Caraya.InstallTestReport.xml" 2>/dev/null
rm "reports/LUnit.InstallTestReport.xml" 2>/dev/null

set -euo pipefail

g-cli --kill --kill-timeout 5000 lunit -- -r "reports/LUnit.InstallTestReport.xml" "InstallTests"
SECONDS=0
echo "Running Caraya Extension Tests" # needed because Caraya tool is not very verbose.
g-cli --kill --kill-timeout 5000 Caraya -- -s "InstallTests/Caraya.Tests/Caraya Extension Tests/Caraya Extension Tests.lvclass" -x "reports/Caraya.InstallTestReport.xml"
echo "Test Time: $SECONDS"
