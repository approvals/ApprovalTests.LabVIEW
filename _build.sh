#! /usr/bin/bash
VERSION="2.2.6"
rm build/*.vip 2>/dev/null
set -euo pipefail

echo "Building $VERSION.$1"

HERE=$(cygpath -w $(pwd))
SECONDS=0
g-cli clearlvcache
g-cli quitLabVIEW
sleep 2s
g-cli vipc -- -v "20.0 (64-bit)" -t 1200 "approvals-dev.vipc"
g-cli vipb -- -b "Approval Tests.vipb" -v "$VERSION.$1" -rn "release-notes.txt"
echo "Script Time: $SECONDS"
