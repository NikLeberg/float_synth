#!/usr/bin/env bash
set -e

SYNTH_FILE="../src/synth.lst"
SYNTH_OUT="../src/gen/base"

mkdir -p "$SYNTH_OUT"

function postprocess_entity () {
    infile="$1"
    old_entity="$2"
    new_entity="$3"

    [[ "$old_entity" == "$new_entity" ]] && return

    sed -i -E \
        -e "s/^([[:space:]]*entity[[:space:]]+)$old_entity([[:space:]]+is)/\1${new_entity}\2/i" \
        -e "s/^([[:space:]]*architecture[[:space:]]+[a-zA-Z0-9_]+[[:space:]]+of[[:space:]]+)$old_entity([[:space:]]+is)/\1${new_entity}\2/i" \
        "$infile"
}

function synth () {
    entity="$1"
    shift 1

    new_entity="${entity}_base"
    outfile="$SYNTH_OUT/${new_entity}.vhd"

    cmd=(ghdl --synth --std=08 --no-formal "$@" "$entity")

    echo "${cmd[*]} > $outfile"
    "${cmd[@]}" > "$outfile"

    postprocess_entity "$outfile" "$entity" "$new_entity"
}

while IFS= read -r line || [[ -n "$line" ]]; do
    line="$(echo "$line" | xargs)"
    [[ -z "$line" || "$line" =~ ^# ]] && continue

    entity="${line%% *}"

    generic_args=()
    if [[ "$line" == *" "* ]]; then
        generics="${line#* }"
        IFS=',' read -ra gen_array <<< "$generics"
        for g in "${gen_array[@]}"; do
            g="$(echo "$g" | xargs)"
            generic_args+=("-g${g}")
        done
    fi

    synth "$entity" "${args[@]}"

done < "$SYNTH_FILE"
