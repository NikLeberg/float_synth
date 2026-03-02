-- =============================================================================
-- File:                    fconv16.vhd
-- Entity:                  fconv16
-- Author:                  Niklaus Leuenberger <@NikLeberg>
-- SPDX-License-Identifier: MIT
-- Description:             Signed to floating point converter utilizing the
--                          VHDL2008 float_pkg and relying on register retiming.
-- Note:                    Float representation is 16-bit (1.5.10).
-- =============================================================================

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity fconv16 is
  generic (
    N_STAGES : natural := 1  -- number of pipeline stages
  );
  port (
    clk : in  std_logic;
    a   : in  std_logic_vector(15 downto 0); -- signed 16-bit integer
    y   : out std_logic_vector(15 downto 0)  -- float 16-bit (1.5.10)
  );
end entity;

architecture rtl of fconv16 is
  use work.float16_pkg.all;
  use work.float16_type_pkg.all;

  signal ffy : float16_arr(N_STAGES downto 0) := (others => (others => '0'));
begin

  ffy(0) <= to_float(signed(a));

  ffy(N_STAGES downto 1) <= ffy(N_STAGES - 1 downto 0) when rising_edge(clk);
  y <= to_slv(ffy(N_STAGES));

end architecture;
