-- =============================================================================
-- File:                    fconv8_tb.vhd
-- Entity:                  fconv8_tb
-- Author:                  Niklaus Leuenberger <@NikLeberg>
-- SPDX-License-Identifier: MIT
-- Description:             Testbench for integer to floating point converter
--                          with generic pipeline depth.
-- =============================================================================

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.float8_pkg.all;
use work.float8_type_pkg.all;

entity fconv8_tb is
  generic (
    N_STAGES : natural := 1
  );
end entity;

architecture sim of fconv8_tb is
  constant CLK_PERIOD : delay_length := 20 ns; -- 50 MHz
  signal clk, done : std_logic := '0';

  signal a, y : std_logic_vector(7 downto 0) := (others => '0');

  type test_vec_t is record
    a : integer;
    y : real;
  end record;
  type test_vec_arr_t is array (natural range<>) of test_vec_t;
  constant TEST_VEC : test_vec_arr_t := (
    (0, 0.0),
    (1, 1.0),
    (-1, -1.0),
    (2, 2.0),
    (-2, -2.0),

    (3, 3.0),
    (7, 7.0),
    (8, 8.0),
    (15, 15.0),
    (-15, -15.0),
    (16, 16.0),

    (17, 16.0),
    (18, 18.0),
    (19, 18.0),
    (23, 22.0),

    (31, 30.0),
    (33, 32.0),
    (36, 36.0),
    (39, 36.0),

    (63, 60.0),
    (65, 64.0),
    (72, 72.0),
    (95, 88.0),

    (127, 120.0),
    (-128, -128.0)
  );
begin

  clk <= '0' when done else not clk after CLK_PERIOD / 2;

  dut : entity work.fconv8
    generic map (
      N_STAGES => N_STAGES
    )
    port map (
      clk => clk,
      a   => a,
      y   => y
    );

  stimuli : process
    variable v : signed(7 downto 0);
  begin
    wait until rising_edge(clk);

    for i in TEST_VEC'range loop
      v := to_signed(TEST_VEC(i).a, 8);
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

entity fconv8_1_tb is end entity;
architecture sim of fconv8_1_tb is
begin
  dut : entity work.fconv8_tb generic map (1);
end architecture;

entity fconv8_4_tb is end entity;
architecture sim of fconv8_4_tb is
begin
  dut : entity work.fconv8_tb generic map (4);
end architecture;

entity fconv8_12_tb is end entity;
architecture sim of fconv8_12_tb is
begin
  dut : entity work.fconv8_tb generic map (12);
end architecture;
