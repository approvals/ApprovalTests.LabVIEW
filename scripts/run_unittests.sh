#! /usr/bin/env bash
mkdir reports 2> /dev/null
echo "Running Unit Tests"
kill=""
if [ "${1:-}" == "kill" ]; then
  kill="--kill --kill-timeout 300000"
fi


rm "reports/Caraya.UnitTestReport.xml" 2>/dev/null
rm "reports/LUnit.UnitTestReport.xml" 2>/dev/null
rm "reports/Error.Propagation.UnitTestReport.xml" 2>/dev/null
rm "reports/CoreLibrary.UnitTestReport.xml" 2>/dev/null

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



g-cli ${kill} --timeout 300000 lunit -- -r "reports/CoreLibrary.UnitTestReport.xml" "Core Library Tests.lvproj" || fail

g-cli ${kill} --timeout 300000 lunit -- -r "reports/LUnit.UnitTestReport.xml" "Extension Tests.lvproj" || fail



SECONDS=0
echo "Running Caraya Extension Tests" # needed because caray tool is not very verbose.
g-cli ${kill} --timeout 300000 Caraya -- -s "Tests/Caraya.Tests/Caraya Extension Tests/Caraya Extension Tests.lvclass" -x "reports/Caraya.UnitTestReport.xml" || fail
echo "Test Time: $SECONDS"


SECONDS=0
echo "Running Error Propagation Tests"
g-cli ${kill} --timeout 300000 Caraya -- -s "Tests/Error.Propagation.Tests/Error.Propagation.Tests.lvclass" -x "reports/Error.Propagation.UnitTestReport.xml" || fail
echo "Test Time: $SECONDS"

echo "${bold}${green}PASS${reset}" 

