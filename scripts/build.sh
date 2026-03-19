#! /usr/bin/env bash
VERSION="3.0.0"
rm build/*.vip 2>/dev/null
set -euo pipefail

echo "Building $VERSION.$1"

# Detect OS and set path separator and working directory accordingly
if [[ "$OSTYPE" == "msys" || "$OSTYPE" == "cygwin" || "$OSTYPE" == "win32" ]]; then
    SEP="\\"
    HERE=$(cygpath -w $(pwd))
else
    SEP="/"
    HERE=$(pwd)
fi

SECONDS=0
g-cli clearlvcache
g-cli quitLabVIEW
sleep 2s
vipm install "approvals-dev.vipc"
curl -L -o xml.zip https://downloads.sourceforge.net/project/xmlstar/xmlstarlet/1.6.1/xmlstarlet-1.6.1-win32.zip
unzip xml.zip
./xmlstarlet-1.6.1/xml ed --inplace -u VI_Package_Builder_Settings/Advanced_Settings/Description/Release_Notes --value "$(dos2unix release-notes.txt && cat release-notes.txt)" "$VIPB_PATH"
./xmlstarlet-1.6.1/xml ed --inplace -u VI_Package_Builder_Settings/Library_General_Settings/Library_Version --value "${full_version}" "$VIPB_PATH"
rm -r xml.starlet-1.6.1
rm xml.zip
vipm build "Approval Tests.vipb

echo "Script Time: $SECONDS"
