#! /usr/bin/env bash

rm -r InstallTests 2>/dev/null

set -euo pipefail

cp -r Tests InstallTests

# replace each extension and core library
g-cli --kill --kill-timeout 5000 switcheroo -- -t "InstallTests" -o "Source/Extensions/Caraya.Extension/Caraya.Extension.lvlib" -r "<vilib>/SAS/Approval Tests/Extensions\\lib_Caraya.Extension.lvlib"
g-cli --kill --kill-timeout 5000 switcheroo -- -t "InstallTests" -o "Source\\Extensions\\LUnit.Extension\\LUnit.Extension.lvlib" -r "<vilib>\\SAS\\Approval Tests\\Extensions\\lib_LUnit.Extension.lvlib"
g-cli --kill --kill-timeout 5000 switcheroo --kill -- -t "InstallTests" -o "Source\\Approval Tests\\Approval Tests.lvlib" -r "<vilib>\\SAS\\Approval Tests\\Approval Tests\\lib_Approval Tests.lvlib"

