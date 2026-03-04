# float_synth

> What if we synthesize the `IEEE.float_pkg`?

Doing anything with floating point is hard. And that is regarding both software and hardware. A computer (or better: any binary logic) can fundamentally only do integer arithmetic. Floating point is no exception. We must do a series of integer operations which as a whole do our desired floating point operation. To implement it, we have two choices:

 1. Do these integer operations in software (slow).
 2. Do these integer operations in hardware (big and therefore expensive).

Which one to choose is dependent on many factors. Here I'm exploring a hardware implementation targeting FPGAs.

## FPUs
Building your own FPU in HDL, altough possible, is a complex undertaking. Stefan Nolting's [NEORV32](https://github.com/stnolting/neorv32/blob/main/rtl/core/neorv32_cpu_alu_fpu.vhd) is an excellent example of a complex but good implementation. Another way to implement could be to use the vendor supplied IP blocks. But I have my reservations about those. For one, the vendor does in my opinion have no incentive to provide _good_ free IP blocks. Secondly, switching to another vendor just becomes unnecessary work. What I actually want is something well-designed, well-documented, open and reusable. This is where `IEEE.float_pkg` comes in.

## IEEE.float_pkg
The IEEE library contains, since VHDL-2008, the excellent `float_pkg` (as well as `fixed_pkg`) from David Bishop. It describes on a high and generic level how a floating point number works and provides procedures for every mathematical operation. The package also can, with [some tweaks](https://github.com/FPHDL/fphdl) (Really Altera? It has been 18 years!), actually be synthesized!

So ... case closed? Use the package and problem solved? Not quite. The `float_pkg` has one major drawback: It is fully combinational. Everything happens at once. No clocks. That is deadly for timing closure. The roughly ~1000 LUT4 it takes to synthesize a 32-bit floating point addition are hefty enough. But having them more or less chained together on one very long path is bad, very bad. It forces us to slow down our clock to, let's say 50 MHz, instead of possible 200 MHz.

## Register Retiming
The idea is rather simple: We do use the IEEE package. But to make it work we slap some (or many) flip-flops to the outputs to do a _pseudo_-pipelining. So the HDL as written does everything combinational and then synchronizes the result through some _N_ pipeline stages. To the _outside_ it behaves as if the IP block is capable of calculating the result on every clock but with a latency of _N_ cycles. FFs back-to-back don't help in timing closure. But good tools can optimize the delay of the resulting circuit and shuffle the FFs to wherever they need to without changing the outside behaviour.

As you might have guessed, the vendor tools don't do that or only if you pay good $$$. OSS to the rescue! The fantastic collection of NVC/GHDL/Yosys/ABC are together more than capable of suceeding (and even exceeding) in this task.

## Processing Pipeline
To get to a netlist that is ready to be consumed by the FPGA vendors toolchain, we must run though some hoops. They process the initial abstract and frankly unusable VHDL description into a balanced sea of gates that the vendor tools can then actually import and use.

The hoops are:
 1. Analyze with GHDL.
 2. Synthesize to abstract RTLIL with Yosys+GHDL.
 3. Synthesize to generic logic gates with Yosys.
 4. Retime the flip-flops with ABC.
 5. Export the verilog netlist with Yosys.

The scripts that achieve this processing are found in the `build` folder. They take the designs from [`src`](src) and generate the various versions into [`src/gen`](src/gen). Putting best git practices aside, altough generated, the processed designs are commited to git and the curious reader may view them. Of note are the `.svg` graphs of the retimed netlists.

## Results
Below table shows the resource usage and achieved timing of the various mathematical operations in three variations:
 - Variant _Base_ is the practicly unusable and plain VHDL implementation of just using `float_pkg` + FFs.
 - Variant _Opt_ is the Yosys+ABC optimized and retimed entity targeting the best possible delay.
 - Variant _Altera_ is using the Altera supplied _megafunctions_ i.e. IP blocks from the `fp_functions` package.

| Entity | Function | Base |||| Opt |||| Altera ||||
|:---:|---|---|---|---|---|---|---|---|---|---|---|---|---|
||| LUT4 | FF | Fmax | Latency | LUT4 | FF | Fmax | Latency | LUT4 | FF | Fmax | Latency |
| fconv16 | `y = float16(a)` | 108 |  48 | 114 | 3 |  97 |  63 | 236 | 3 | 136 |  96 | 217 | 5 |
| fadd16  | `y = a + b`  | ~~147~~ | 128 |  83 | 8 | 457 | 349 | 197 | 8 | 263 | 264 | 219 | 9 |

Todo:
 - The _base_ variant of _fadd16_ uses suspiciously few LUT4. The testbench is also failing to simulate. Broken?

Note:
 - The Altera _megafunction_ `fp_functions` does only support a minimum float size of 16-bit i.e. (1.5.10) in a half precision representation.
 - David Bishop's `float_pkg` would be capable of generating down to 7-bit floats in format (1.3.3). How usefull such a minimal representation would be is left as an excersise to the reader.
 - Therefore to have a fair comparison the `float_pkg` was configured to also use the 16-bit (1.5.10) half precision representation.
 - Furthermore it was configured to have rounding to zero (saving some logic) and no NaN/Inf checking.
 - I tried to configure `fp_functions` as similar as possible. See [`src/gen/README.md`](src/gen/README.md) for details.
 - For the _Base_ variant I was too lazy to setup the Quartus workaround to make it work with the generic `float_pkg`. So that one is _synthesized_ with GHDL from VHDL-2008 to the VHDL-93 Quartus understands well.
 - Fmax is in unit [MHz].
 - The _max_clock_ is what Quartus reports for the Altera Cyclone-IV E FPGA _slow 1V2 85C_ model.
 - To prevent Quartus from infering ram based shift registers the parameter `AUTO_SHIFT_REGISTER_RECOGNITION` has been set to `OFF`. Otherwise the ram could negatively impact the achievable timing.


## License
[MIT](LICENSE) © [NikLeberg](https://github.com/NikLeberg).
