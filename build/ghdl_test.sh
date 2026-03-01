#!/usr/bin/env bash
# SPDX-License-Identifier: MIT
set -e

# Testbenches.
SIM_PREFIX=../src/tb
mapfile SIM_TESTS < $SIM_PREFIX/tests.lst

function test () {
    cmd="ghdl -r --std=08 $1"
    echo $cmd
    $cmd
}

for t in "${SIM_TESTS[@]}"; do
    test $t
done
