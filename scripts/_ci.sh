#! /usr/bin/bash

set -euo pipefail

git submodule init
git submodule update

./scripts/_run_unittests.sh
./scripts/_build.sh $1
./scripts/_install.sh $1
./scripts/_create_install_tests.sh
./scripts/_run_install_tests.sh
