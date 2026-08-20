#! /usr/bin/env bash

REPORTS_DIR="reports"

CARAYA_REPORT="$REPORTS_DIR/Caraya.PostInstall.UnitTestReport.xml"
LUNIT_REPORT="$REPORTS_DIR/LUnit.PostInstall.UnitTestReport.xml"
ERROR_PROPAGATION_REPORT="$REPORTS_DIR/Error.PostInstall.Propagation.UnitTestReport.xml"
CORE_LIBRARY_REPORT="$REPORTS_DIR/CoreLibrary.PostInstall.UnitTestReport.xml"

mkdir "$REPORTS_DIR" 2> /dev/null
echo "Running Unit Tests"
kill=""
if [ "${1:-}" == "kill" ]; then
  kill="--kill --kill-timeout 5000"
fi

rm "${CARAYA_REPORT}" 2>/dev/null
rm "${LUNIT_REPORT}" 2>/dev/null
rm "${ERROR_PROPAGATION_REPORT}" 2>/dev/null
rm "${CORE_LIBRARY_REPORT}" 2>/dev/null

export TERM=${TERM:-xterm}
green=$(tput setaf 2)
red=$(tput setaf 1)
reset=$(tput sgr0)
bold=$(tput bold)

fail() {
    echo "${bold}${red}FAIL${reset}"
    exit 1
}
# set -x
set -euo pipefail

g-cli ${kill} --timeout 180000 lunit -- -r "${CORE_LIBRARY_REPORT}" "InstallTests/Core Library Tests.lvproj" || fail

g-cli ${kill} --timeout 180000 lunit -- -r "${LUNIT_REPORT}" "InstallTests/Extension Tests.lvproj" || fail

SECONDS=0
echo "Running Caraya Extension Tests" # needed because caray tool is not very verbose.
g-cli ${kill} --timeout 180000 Caraya -- -s "InstallTests/Caraya.Tests/Caraya Extension Tests/Caraya Extension Tests.lvclass" -x "${CARAYA_REPORT}" || fail
echo "Test Time: $SECONDS"

SECONDS=0
echo "Running Error Propagation Tests"
g-cli ${kill} --timeout 180000 Caraya -- -s "InstallTests/Error.Propagation.Tests/Error.Propagation.Tests.lvclass" -x "${ERROR_PROPAGATION_REPORT}" || fail
echo "Test Time: $SECONDS"

echo "${bold}${green}PASS${reset}" 
