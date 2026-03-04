-- =============================================================================
-- File:                    top_fadd16_tb.vhd
-- Entity:                  top_fadd16_tb
-- Author:                  Niklaus Leuenberger <@NikLeberg>
-- SPDX-License-Identifier: MIT
-- Description:             Toplevel testbench for floating point addition
--                          implementations.
-- =============================================================================

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.float16_pkg.all;
use work.float16_type_pkg.all;

entity top_fadd16_tb is
  generic (
    N_STAGES : natural;
    VARIANT  : string
  );
end entity;

architecture sim of top_fadd16_tb is
  constant CLK_PERIOD : delay_length := 20 ns; -- 50 MHz
  signal clk, done : std_logic := '0';

  signal a, b, y : std_logic_vector(15 downto 0) := (others => '1');

  type test_vec_t is record
    a, b, y : real;
  end record;
  type test_vec_arr_t is array (natural range<>) of test_vec_t;
  constant TEST_VEC : test_vec_arr_t := (
    (0.0, 0.0, 0.0),
    (1.0, 0.0, 1.0),
    (0.0, 1.0, 1.0),
    (1.0, 1.0, 2.0),
    (2.0, 3.0, 5.0),

    (5.0, -5.0, 0.0),
    (-3.0, -2.0, -5.0),
    (7.0, -2.0, 5.0),
    (-7.0, 2.0, -5.0),

    (8.0, 8.0, 16.0),
    (15.0, 1.0, 16.0),

    (16.0, 1.0, 17.0),
    (32.0, 1.0, 33.0),
    (64.0, 2.0, 66.0),

    (18.0, 2.0, 20.0),
    (18.0, 1.0, 19.0),
    (22.0, 3.0, 25.0),

    (20.0, -18.0, 2.0),
    (36.0, -32.0, 4.0),

    (60.0, 4.0, 64.0),
    (60.0, 1.0, 61.0),

    (-18.0, -2.0, -20.0),
    (-36.0, -4.0, -40.0),

    (120.0, 8.0, 128.0),
    (120.0, 1.0, 121.0)
  );
begin

  clk <= '0' when done else not clk after CLK_PERIOD / 2;

  dut : entity work.top
    generic map (
      OP      => "fadd",
      VARIANT => VARIANT
    )
    port map (
      clk => clk,
      a   => a,
      b   => b,
      c   => (others => '0'),
      y   => y
    );

  stimuli : process
    variable v : signed(15 downto 0);
  begin
    wait until rising_edge(clk);

    for i in TEST_VEC'range loop
      a <= to_slv(to_float(TEST_VEC(i).a));
      b <= to_slv(to_float(TEST_VEC(i).b));
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
        report to_string(TEST_VEC(i).a) & " + " & to_string(TEST_VEC(i).b) &
          " != " & to_string(TEST_VEC(i).y) & ", got: " & to_string(v)
        severity error;
      wait until rising_edge(clk);
    end loop;

    done <= '1';
    wait;
  end process;
end architecture;

entity top_fadd16_base_tb is end entity;
architecture sim of top_fadd16_base_tb is
begin
  dut : entity work.top_fadd16_tb generic map (8+1, "base");
end architecture;

entity top_fadd16_opt_tb is end entity;
architecture sim of top_fadd16_opt_tb is
begin
  dut : entity work.top_fadd16_tb generic map (8+1, "opt");
end architecture;
