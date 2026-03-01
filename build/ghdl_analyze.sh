#!/usr/bin/env bash
# SPDX-License-Identifier: MIT
set -e

# VHDL sourcefiles.
SRC_PREFIX=../src
mapfile SRC_FILES < $SRC_PREFIX/files.lst
SRC_FILES=(${SRC_FILES[@]/#/$SRC_PREFIX/})

# VHDL testbench sources.
SIM_PREFIX=../src/tb
mapfile SIM_FILES < $SIM_PREFIX/files.lst
SIM_FILES=(${SIM_FILES[@]/#/$SIM_PREFIX/})

function analyze () {
    cmd="ghdl -a --std=08 $1"
    echo $cmd
    $cmd
}

for f in "${SRC_FILES[@]}"; do
    analyze $f
done
for f in "${SIM_FILES[@]}"; do
    analyze $f
done
