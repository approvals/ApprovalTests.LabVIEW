#! /usr/bin/env bash
mkdir reports 2> /dev/null


# Detect OS and set path separator and working directory accordingly
if [[ "$OSTYPE" == "msys" || "$OSTYPE" == "cygwin" || "$OSTYPE" == "win32" ]]; then
    SEP="\\"
    HERE=$(cygpath -w $(pwd))
else
    SEP="/"
    HERE=$(pwd)
fi

rm "reports${SEP}Caraya.UnitTestReport.xml" 2>/dev/null
rm "reports${SEP}LUnit.UnitTestReport.xml" 2>/dev/null
rm "reports${SEP}Scrubber.UnitTestReport.xml" 2>/dev/null

export TERM=${TERM:-xterm}
green=$(tput setaf 2)
red=$(tput setaf 1)
reset=$(tput sgr0)
bold=$(tput bold)



fail() {
    echo "${bold}${red}FAIL${reset}"
    exit 1
}
set -x
set -euo pipefail


vipm install "approvals-dev.vipc" || fail

echo "nisvcloc PID before suite 1: $(pgrep nisvcloc)"


SECONDS=0
echo "Running Caraya Extension Tests" # needed because caray tool is not very verbose.
g-cli --timeout 300000 Caraya -- -s "Tests${SEP}Caraya.Tests${SEP}Caraya Extension Tests${SEP}Caraya Extension Tests.lvclass" -x "reports${SEP}Caraya.UnitTestReport.xml" || fail
echo "Test Time: $SECONDS"


echo "nisvcloc PID before suite 2: $(pgrep nisvcloc)"
pkill nisvcloc || true
nohup nisvcloc &
sleep 2

SECONDS=0
echo "Running Error Propagation Tests"
g-cli --timeout 300000 Caraya -- -s "Tests${SEP}Error.Propagation.Tests${SEP}Error.Propagation.Tests.lvclass" -x "reports${SEP}Error.Propagation.UnitTestReport.xml" || fail
echo "Test Time: $SECONDS"

echo "nisvcloc PID before suite 3: $(pgrep nisvcloc)"
pkill nisvcloc || true
nohup nisvcloc &
sleep 2
ls ~/natinst/.config/LabVIEW-2026
ls ~/natinst/.config/LabVIEW-2026 | xargs

apt updated && apt install tree
tree "~/natinst/.config/LabVIEW Data"
rm -rf "~/natinst/.config/LabVIEW Data/lvfailurelog" || true
g-cli --timeout 300000 lunit -- -r "reports${SEP}LUnit.UnitTestReport.xml" "Approval Testing.lvproj" || fail
echo "${bold}${green}PASS${reset}" 

