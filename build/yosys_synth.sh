#!/usr/bin/env bash
# SPDX-License-Identifier: MIT
set -e

SYNTH_FILE="../src/synth.lst"
SYNTH_OUT="../src/gen/opt"

mkdir -p "$SYNTH_OUT"

function postprocess_module () {
    infile="$1"
    old_module="$2"
    new_module="$3"

    [[ "$old_module" == "$new_module" ]] && return

    sed -i -E \
        -e "s/^([[:space:]]*module[[:space:]]+)$old_module([[:space:]*(;])/\1${new_module}\2/i" \
        "$infile"
}

while IFS= read -r line || [[ -n "$line" ]]; do
    line="$(echo "$line" | xargs)"
    [[ -z "$line" || "$line" =~ ^# ]] && continue

    entity="${line%% *}"

    generic_args=""
    if [[ "$line" == *" "* ]]; then
        generics="${line#* }"
        IFS=',' read -ra gen_array <<< "$generics"
        for g in "${gen_array[@]}"; do
            g="$(echo "$g" | xargs)"
            generic_args="${generic_args} -g${g}"
        done
    fi

    echo "Synthesizing: $entity${generic_args:+ (generics:$generic_args)}"

    synth_prefix="$SYNTH_OUT/${entity}_opt"

    TOP="$entity" \
    GENERIC_ARGS="$generic_args" \
    SYNTH_PREFIX="$synth_prefix" \
    yosys -m ghdl -c yosys_synth.tcl

    postprocess_module "$synth_prefix.v" "$entity" "${entity}_opt"

done < "$SYNTH_FILE"
