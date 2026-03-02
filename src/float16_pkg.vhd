-- =============================================================================
-- File:                    float16_pkg.vhd
-- Package:                 float16_pkg
-- Author:                  Niklaus Leuenberger <@NikLeberg>
-- SPDX-License-Identifier: MIT
-- Description:             Packages for float representation in 16bit (1.5.10).
-- =============================================================================

library ieee;

package fixed16_pkg is new ieee.fixed_generic_pkg
  generic map (
    fixed_round_style    => ieee.fixed_float_types.fixed_truncate,
    fixed_overflow_style => ieee.fixed_float_types.fixed_saturate,
    fixed_guard_bits     => 1,
    no_warning           => true
  );


library ieee;

package float16_pkg is new ieee.float_generic_pkg
  generic map (
    float_exponent_width => 5,
    float_fraction_width => 10,
    float_round_style    => ieee.fixed_float_types.round_zero,
    float_denormalize    => true,
    float_check_error    => false,
    float_guard_bits     => 2,
    no_warning           => true,
    fixed_pkg            => work.fixed16_pkg
  );


use work.float16_pkg.all;

package float16_type_pkg is
  subtype float16 is float (5 downto -10);
  type float16_arr is array (natural range<>) of float16;
end package;
