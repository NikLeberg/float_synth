# SPDX-License-Identifier: MIT

# Import yosys commands into TCL.
yosys -import

# Build the ghdl command from TOP and GENERIC_ARGS env vars.
# GENERIC_ARGS is a space-separated list of -gKEY=VALUE flags,
set top $::env(TOP)
set synth_prefix $::env(SYNTH_PREFIX)
set generic_args {}
foreach arg [split $::env(GENERIC_ARGS) " "] {
    set arg [string trim $arg]
    if {$arg ne ""} {
        lappend generic_args $arg
    }
}

# Import VHDL and run generic synthesis.
eval ghdl --std=08 --no-formal {*}$generic_args $top
synth

# Legalize FFs for ABC. Only some FF can be represented in ABC. Namely ones with
# init state 0 and driven by the same "clock domain" built from clk+arst+srst.
# Otherwise yosys must partition netlist into different clock domains which
# prevents optimization on a global level.
dfflegalize -cell \$_DFF_P_ 0

# Invoke ABC with exposed FFs and run customized retiming script.
abc -dff -lut 4 -script retime.abc

# Netlist from ABC contains many redundant nodes and named wires we do not need.
opt -full -purge
stat

# Generate verilog netlist into ../src/gen/opt/
write_verilog "${synth_prefix}.v"

# Generate netlist graphic alongside the verilog output.
show -width -format svg -prefix "${synth_prefix}"
