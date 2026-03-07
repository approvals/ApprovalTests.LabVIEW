#! /usr/bin/env bash
set -euo pipefail

g-cli vip -- --local-vip-file "$(cygpath -w $(ls build/*.vip))" -lv "20.0 (64-bit)"
