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

# Synthesized VHDL sourcefiles.
SYNTH_PREFIX=../src/gen
mapfile SYNTH_FILES < $SYNTH_PREFIX/files.lst
SYNTH_FILES=(${SYNTH_FILES[@]/#/$SYNTH_PREFIX/})

# Toplevel VHDL sourcefiles.
TOP_PREFIX=../src/top
mapfile TOP_FILES < $TOP_PREFIX/files.lst
TOP_FILES=(${TOP_FILES[@]/#/$TOP_PREFIX/})

function analyze () {
    cmd="nvc --std=08 -a $1"
    echo $cmd
    $cmd
}

for f in "${SRC_FILES[@]}"; do
    analyze $f
done
for f in "${SIM_FILES[@]}"; do
    analyze $f
done
for f in "${SYNTH_FILES[@]}"; do
    analyze $f
done
for f in "${TOP_FILES[@]}"; do
    analyze $f
done
