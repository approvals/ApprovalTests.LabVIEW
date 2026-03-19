#! /usr/bin/env bash
set -euo pipefail

# Detect OS and set path separator and working directory accordingly
if [[ "$OSTYPE" == "msys" || "$OSTYPE" == "cygwin" || "$OSTYPE" == "win32" ]]; then
    SEP="\\"
    HERE=$(cygpath -w $(pwd))
else
    SEP="/"
    HERE=$(pwd)
fi

package=$(ls -t build${SEP}*.vip | head -n 1)
vipm install "${package}"
