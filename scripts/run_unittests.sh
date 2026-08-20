#! /usr/bin/env bash
REPORTS_DIR="reports"

CARAYA_PREBUILD_REPORT="$REPORTS_DIR/Caraya.PreBuild.UnitTestReport.xml"
LUNIT_PREBUILD_REPORT="$REPORTS_DIR/LUnit.PreBuild.UnitTestReport.xml"
ERROR_PROPAGATION_PREBUILD_REPORT="$REPORTS_DIR/ErrorPropagation.PreBuild.UnitTestReport.xml"
CORE_LIBRARY_PREBUILD_REPORT="$REPORTS_DIR/CoreLibrary.PreBuild.UnitTestReport.xml"


mkdir "$REPORTS_DIR" 2> /dev/null
echo "Running Unit Tests"
kill=""
if [ "${1:-}" == "kill" ]; then
  kill="--kill --kill-timeout 5000"
fi


rm "$CARAYA_PREBUILD_REPORT" 2>/dev/null
rm "$LUNIT_PREBUILD_REPORT" 2>/dev/null
rm "$ERROR_PROPAGATION_PREBUILD_REPORT" 2>/dev/null
rm "$CORE_LIBRARY_PREBUILD_REPORT" 2>/dev/null

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



g-cli ${kill} --timeout 180000 lunit -- -r "${CORE_LIBRARY_PREBUILD_REPORT}" "Tests/Core Library Tests.lvproj" || fail

g-cli ${kill} --timeout 180000 lunit -- -r "${LUNIT_PREBUILD_REPORT}" "Tests/Extension Tests.lvproj" || fail



SECONDS=0
echo "Running Caraya Extension Tests" # needed because caray tool is not very verbose.
g-cli ${kill} --timeout 180000 Caraya -- -s "Tests/Caraya.Tests/Caraya Extension Tests/Caraya Extension Tests.lvclass" -x "${CARAYA_PREBUILD_REPORT}" || fail
echo "Test Time: $SECONDS"


SECONDS=0
echo "Running Error Propagation Tests"
g-cli ${kill} --timeout 180000 Caraya -- -s "Tests/Error.Propagation.Tests/Error.Propagation.Tests.lvclass" -x "${ERROR_PROPAGATION_PREBUILD_REPORT}" || fail
echo "Test Time: $SECONDS"

echo "${bold}${green}PASS${reset}" 

