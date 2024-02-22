#! /usr/bin/bash
set -euo pipefail
SECONDS=0

g-cli clearlvcache
g-cli switcheroo -- -t "Tests\\Caraya.Tests" -o "Source\\Extensions\\Caraya.Extension\\Caraya.Extension.lvlib" -r "<vilib>\\SAS\\Approval Tests\\Extensions\\lib_Caraya.Extension.lvlib"
g-cli switcheroo -- -t "Tests\\LUnit.Tests" -o "Source\\Extensions\\LUnit.Extension\\LUnit.Extension.lvlib" -r "<vilib>\\SAS\\Approval Tests\\Extensions\\lib_LUnit.Extension.lvlib"
g-cli switcheroo -- -t "Tests\\VITester.Tests" -o "Source\\Extensions\\Caraya.Extension\\VITester.Extension.lvlib" -r "<vilib>\\SAS\\Approval Tests\\Extensions\\lib_VITester.Extension.lvlib"
g-cli switcheroo -- -t "Tests\\Scrubber.Tests" -o "Source\\Extensions\\Caraya.Extension\\Caraya.Extension.lvlib" -r "<vilib>\\SAS\\Approval Tests\\Extensions\\lib_Caraya.Extension.lvlib"
g-cli switcheroo -- -t "Tests\\Scrubber.Tests" -o "Source\\Approval Tests\\Approval Tests.lvlib" -r "<vilib>\\SAS\\Approval Tests\\Approval Tests\\lib_Approval Tests.lvlib"

echo "Total Script Time $SECONDS"