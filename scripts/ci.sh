#! /usr/bin/env bash

set -euo pipefail

git submodule init
git submodule update

./scripts/run_unittests.sh
./scripts/build.sh $1
./scripts/install.sh $1
./scripts/create_install_tests.sh
./scripts/run_install_tests.sh
