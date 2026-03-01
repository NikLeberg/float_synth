-- =============================================================================
-- File:                    float8_pkg.vhd
-- Package:                 float8_pkg
-- Author:                  Niklaus Leuenberger <@NikLeberg>
-- SPDX-License-Identifier: MIT
-- Description:             Packages for float representation in 8-bit (1.4.3).
-- =============================================================================

library ieee;

package fixed8_pkg is new ieee.fixed_generic_pkg
  generic map (
    fixed_round_style    => ieee.fixed_float_types.fixed_truncate,
    fixed_overflow_style => ieee.fixed_float_types.fixed_saturate,
    fixed_guard_bits     => 1,
    no_warning           => true
  );


library ieee;

package float8_pkg is new ieee.float_generic_pkg
  generic map (
    float_exponent_width => 4,
    float_fraction_width => 3,
    float_round_style    => ieee.fixed_float_types.round_zero,
    float_denormalize    => true,
    float_check_error    => true,
    float_guard_bits     => 1,
    no_warning           => true,
    fixed_pkg            => work.fixed8_pkg
  );


use work.float8_pkg.all;

package float8_type_pkg is
  subtype float8 is float (4 downto -3);
  type float8_arr is array (natural range<>) of float8;
end package;
