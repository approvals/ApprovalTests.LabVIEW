#! /usr/bin/bash

set -euo pipefail

./_run_unittests.sh
g-cli quitLabVIEW
git restore .
g-cli clearlvcache
./_build.sh $1
./_install.sh $1
./_create_install_tests.sh
./_run_install_tests.sh
