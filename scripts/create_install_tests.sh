#! /usr/bin/env bash

rm -r InstallTests 2>/dev/null

set -euo pipefail

cp -r Tests InstallTests


# replace each extension and core library
echo "Swapping out Caraya Extension"
g-cli --kill --kill-timeout 5000 switcheroo -- -t "InstallTests" -o "Source/Extensions/Caraya.Extension/Caraya.Extension.lvlib" -r "<vilib>/SAS/Approvals/Extensions/Caraya.Extension/lib_Caraya.Extension.lvlib"
echo "Swapping out LUnit Extension"
g-cli --kill --kill-timeout 5000 switcheroo -- -t "InstallTests" -o "Source/Extensions/LUnit.Extension/LUnit.Extension.lvlib" -r "<vilib>/SAS/Approvals/Extensions/LUnit.Extension/lib_LUnit.Extension.lvlib"
echo "Swapping out Core Library"
g-cli --kill --kill-timeout 5000 switcheroo --kill -- -t "InstallTests" -o "Source/Approval Tests/Approval Tests.lvlib" -r "<vilib>/SAS/Approvals/Approval Tests/lib_Approval Tests.lvlib"

