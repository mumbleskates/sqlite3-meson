#!/usr/bin/env bash

set -euxo pipefail

meson setup build "$@"
cd build
meson compile
