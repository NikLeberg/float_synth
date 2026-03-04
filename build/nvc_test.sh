#!/usr/bin/env bash
# SPDX-License-Identifier: MIT
set -e

# Testbenches.
SIM_PREFIX=../src/tb
mapfile SIM_TESTS < $SIM_PREFIX/tests.lst

# Toplevel testbenches.
TOP_PREFIX=../src/top
mapfile TOP_TESTS < $TOP_PREFIX/tests.lst

function test () {
    if [[ "$1" == \#* ]]; then
        echo "Skipped testbench ${1#\#}."
        return
    fi
    cmd="nvc --std=08 --ieee-warnings=off -e $1 -r"
    echo $cmd
    $cmd
}

for t in "${SIM_TESTS[@]}"; do
    test $t
done
for t in "${TOP_TESTS[@]}"; do
    test $t
done
