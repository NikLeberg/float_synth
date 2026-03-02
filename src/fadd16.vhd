-- =============================================================================
-- File:                    fadd16.vhd
-- Entity:                  fadd16
-- Author:                  Niklaus Leuenberger <@NikLeberg>
-- SPDX-License-Identifier: MIT
-- Description:             Floating point addition utilizing the VHDL-2008
--                          float_pkg and relying on register retiming.
-- Note:                    Float representation is 16-bit (1.5.10).
-- =============================================================================

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity fadd16 is
  generic (
    N_STAGES : natural := 1  -- number of pipeline stages
  );
  port (
    clk  : in  std_logic;
    a, b : in  std_logic_vector(15 downto 0); -- float 16-bit (1.5.10)
    y    : out std_logic_vector(15 downto 0)  -- float 16-bit (1.5.10)
  );
end entity;

architecture rtl of fadd16 is
  use work.float16_pkg.all;
  use work.float16_type_pkg.all;

  signal ffy : float16_arr(N_STAGES downto 0) := (others => (others => '0'));
begin

  ffy(0) <= to_float(a) + to_float(b);

  ffy(N_STAGES downto 1) <= ffy(N_STAGES - 1 downto 0) when rising_edge(clk);
  y <= to_slv(ffy(N_STAGES));

end architecture;
