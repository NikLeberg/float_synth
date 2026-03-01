-- =============================================================================
-- File:                    fadd8.vhd
-- Entity:                  fadd8
-- Author:                  Niklaus Leuenberger <@NikLeberg>
-- SPDX-License-Identifier: MIT
-- Description:             Signed to floating point converter utilizing the
--                          VHDL2008 float_pkg and relying on register retiming.
-- Note:                    Float representation is 8-bit (1.4.3).
-- =============================================================================

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity fadd8 is
  generic (
    N_STAGES : natural := 1  -- number of pipeline stages
  );
  port (
    clk  : in  std_logic;
    a, b : in  std_logic_vector(7 downto 0); -- float 8-bit (1.4.3)
    y    : out std_logic_vector(7 downto 0)  -- float 8-bit (1.4.3)
  );
end entity;

architecture rtl of fadd8 is
  use work.float8_pkg.all;
  use work.float8_type_pkg.all;

  signal ffy : float8_arr(N_STAGES downto 0) := (others => (others => '0'));
begin

  ffy(0) <= to_float(a) + to_float(b);

  ffy(N_STAGES downto 1) <= ffy(N_STAGES - 1 downto 0) when rising_edge(clk);
  y <= to_slv(ffy(N_STAGES));

end architecture;
