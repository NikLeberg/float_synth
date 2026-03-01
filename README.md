# float_synth

> What if we synthesize the `IEEE.float_pkg`?

Doing anything with floating point is hard. And that is regarding both software and hardware. A computer (or better: any binary logic) can fundamentally only do integer arithmetic. Floating point is no exception. We must do a series of integer operations which as a whole do our desired floating point operation[^1]. To implement it, we have two choices:

 1. Do these integer operations in software (slow).
 2. Do these integer operations in hardware (big and therefore expensive).

Which one to choose is dependent on many factors. Here I'm exploring a hardware implementation targeting FPGAs.

## FPUs
Building your own FPU in HDL, altough possible, is a complex undertaking. Stefan Nolting's [NEORV32](https://github.com/stnolting/neorv32/blob/main/rtl/core/neorv32_cpu_alu_fpu.vhd) is an excellent example of comples but good implementation. Another way to implement could be to use the vendor supplied IP blocks. But I have my reservations about those. For one, the vendor does in my opinion have no incentive to provide _good_ free IP blocks. Secondly, switching to another vendor just becomes unnecessary work. What I actually want is something well-designed, well-documented, open and reusable. This is where `IEEE.float_pkg` comes in.

## IEEE.float_pkg
The IEEE library contains, since VHDL-2008, the excellent `float_pkg` (as well as `fixed_pkg`) from David Bishop. It describes on a high and generic level how a floating point number works and provides procedures for every mathematical operation. The package also can, with [some tweaks](https://github.com/FPHDL/fphdl) (Really Altera? It has been 18 years!), actually be synthesized!

So ... case closed? Use the package and problem solved? Not quite. The `float_pkg` has one major drawback: It is fully combinational. Everything happens at once. No clocks. That is deadly for timing closure. The roughly ~1000 LUT4 it takes to synthesize a floating point addition are hefty enough. But having them more or less chained together on one very long path is bad, very bad. It forces us to slow down our clock to, let's say 50 MHz, instead of possible 200 MHz.

## Register Retiming
The idea is rather simple: We do use the IEEE package. But to make it work we slap some (or many) flop-flops to the outputs to do a _pseudo_-pipelining. So the HDL as written does everything combinational and then synchronizes the result through some _N_ pipeline stages. To the _outside_ it behaves as if the IP block is capable of calculating the result on every clock but with a delay of _N_ cycles. FFs back-to-back don't help in timing closure. But good tools can optimize the delay of the resulting circuit and shuffle the FFs to wherever they need to without changing the outside behaviour.

As you might have guessed, the vendor tools don't do that or only if you pay good $$$. OSS to the rescue! The fantastic collection of NVC/GHDL/Yosys/ABC are together more than capable of suceeding (and even exceeding) in this task.

## Processing Pipeline
To get to a netlist that is ready to be consumed by the FPGA vendors toolchain, we must run though some hoops. They process the initial abstract and frankly unusable VHDL description into a balanced sea of gates that the vendor tools can then actually import and use.

The hoops are:
 1. Analyze with GHDL.
 2. Synthesize to abstract RTLIL with Yosys+GHDL.
 3. Synthesize to generic logic gates with Yosys.
 4. Retime the flip-flops with ABC.
 5. Export the verilog netlist with Yosys.

The scripts that achieve this processing are found in the `build` folder. They take the designs from `src` and generate the various versions into `src/gen`. 

## Results
TBD

## License
[MIT](LICENSE) © [NikLeberg](https://github.com/NikLeberg).
