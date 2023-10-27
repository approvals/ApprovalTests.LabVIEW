#! /usr/bin/bash

set -euo pipefail

HERE=$(cygpath -w $(pwd))

g-cli vipc -- -v "20.0 (64-bit)" -t 1200 "Approval Testing.vipc"
#g-cli caraya -- -s . -x "UnitTestReport.xml"
g-cli vitester -- -r "UnitTestReport.xml" "Approval Testing.lvproj"
