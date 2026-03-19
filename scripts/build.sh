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
g-cli vipb -- -b "Approval Tests.vipb" -v "$VERSION.$1" -rn "release-notes.txt"
echo "Script Time: $SECONDS"
