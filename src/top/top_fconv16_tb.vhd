-- =============================================================================
-- File:                    top_fconf16_tb.vhd
-- Entity:                  top_fconf16_tb
-- Author:                  Niklaus Leuenberger <@NikLeberg>
-- SPDX-License-Identifier: MIT
-- Description:             Toplevel testbench for integer to floating point
--                          conversion implementations.
-- =============================================================================

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.float16_pkg.all;
use work.float16_type_pkg.all;

entity top_fconf16_tb is
  generic (
    N_STAGES : natural;
    VARIANT  : string
  );
end entity;

architecture sim of top_fconf16_tb is
  constant CLK_PERIOD : delay_length := 20 ns; -- 50 MHz
  signal clk, done : std_logic := '0';

  signal a, y : std_logic_vector(15 downto 0) := (others => '0');

  type test_vec_t is record
    a : integer;
    y : real;
  end record;
  type test_vec_arr_t is array (natural range<>) of test_vec_t;
  constant TEST_VEC : test_vec_arr_t := (
    -- basic functionality
    (0, 0.0),
    (1, 1.0),
    (-1, -1.0),
    (2, 2.0),
    (-2, -2.0),

    -- small integers (exact)
    (3, 3.0),
    (7, 7.0),
    (15, 15.0),
    (31, 31.0),
    (127, 127.0),
    (-128, -128.0),

    -- still exact region
    (255, 255.0),
    (512, 512.0),
    (1023, 1023.0),
    (2047, 2047.0),
    (2048, 2048.0),

    -- first precision loss (ULP = 2)
    (2049, 2048.0),
    (2050, 2050.0),
    (2051, 2050.0),

    -- next region (ULP = 4)
    (4095, 4094.0),
    (4096, 4096.0),
    (4097, 4096.0),

    -- larger magnitudes
    (8191, 8188.0),
    (8192, 8192.0),
    (10000, 10000.0),

    -- signed 16-bit min and max values
    (32767, 32752.0),
    (-32768, -32768.0),

    -- rounding towards zero
    (2046, 2046.0),
    (2047, 2047.0),
    (2048, 2048.0),
    (2049, 2048.0),
    (2050, 2050.0),
    (2051, 2050.0),
    (2052, 2052.0),
    (2053, 2052.0),

    -- symmetry checks
    (-2049, -2048.0),
    (-4097, -4096.0),
    (-8191, -8188.0)
  );
begin

  clk <= '0' when done else not clk after CLK_PERIOD / 2;

  dut : entity work.top
    generic map (
      OP      => "fconv",
      VARIANT => VARIANT
    )
    port map (
      clk => clk,
      a   => a,
      b   => (others => '0'),
      c   => (others => '0'),
      y   => y
    );

  stimuli : process
    variable v : signed(15 downto 0);
  begin
    wait until rising_edge(clk);

    for i in TEST_VEC'range loop
      v := to_signed(TEST_VEC(i).a, 16);
      a <= std_logic_vector(v);
      wait until rising_edge(clk);
    end loop;

    wait;
  end process;

  test : process
    variable v : real;
  begin
    wait until rising_edge(clk);

    -- initial sync
    for i in 0 to N_STAGES loop
      wait until rising_edge(clk);
    end loop;

    for i in TEST_VEC'range loop
      v := to_real(to_float(y));
      assert v = TEST_VEC(i).y
        report to_string(TEST_VEC(i).a) & " != " & to_string(TEST_VEC(i).y) &
          ", got: " & to_string(v)
        severity error;
      wait until rising_edge(clk);
    end loop;

    done <= '1';
    wait;
  end process;
end architecture;

entity top_fconv16_base_tb is end entity;
architecture sim of top_fconv16_base_tb is
begin
  dut : entity work.top_fconf16_tb generic map (3, "base");
end architecture;

entity top_fconv16_opt_tb is end entity;
architecture sim of top_fconv16_opt_tb is
begin
  dut : entity work.top_fconf16_tb generic map (3, "opt");
end architecture;
