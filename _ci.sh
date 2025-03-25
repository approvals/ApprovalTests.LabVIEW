#! /usr/bin/bash

set -euo pipefail

git submodule init
git submodule update

./_run_unittests.sh
./_build.sh $1
./_install.sh $1
./_create_install_tests.sh
./_run_install_tests.sh
