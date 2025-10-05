#! /usr/bin/env bash

rm -r InstallTests 2>/dev/null

set -euo pipefail
SECONDS=0

g-cli --kill clearlvcache

cp -r Tests InstallTests

# replace each extension
g-cli switcheroo -- -t "InstallTests" -o "Source\\Extensions\\Caraya.Extension\\Caraya.Extension.lvlib" -r "<vilib>\\SAS\\Approval Tests\\Extensions\\lib_Caraya.Extension.lvlib"
g-cli switcheroo -- -t "InstallTests" -o "Source\\Extensions\\LUnit.Extension\\LUnit.Extension.lvlib" -r "<vilib>\\SAS\\Approval Tests\\Extensions\\lib_LUnit.Extension.lvlib"
g-cli switcheroo -- -t "InstallTests" -o "Source\\Extensions\\VITester.Extension\\VITester.Extension.lvlib" -r "<vilib>\\SAS\\Approval Tests\\Extensions\\lib_VITester.Extension.lvlib"
g-cli switcheroo --kill -- -t "InstallTests" -o "Source\\Approval Tests\\Approval Tests.lvlib" -r "<vilib>\\SAS\\Approval Tests\\Approval Tests\\lib_Approval Tests.lvlib"


echo "Total Script Time $SECONDS"
