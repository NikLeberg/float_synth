-- =============================================================================
-- File:                    top.vhd
-- Entity:                  top
-- Author:                  Niklaus Leuenberger <@NikLeberg>
-- SPDX-License-Identifier: MIT
-- Description:             Toplevel entity. Using various floating point
--                          arithmetic operations and testing different
--                          implementations.
-- Note:                    Float representation is 16-bit (1.5.10).
-- =============================================================================

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity top is
  generic (
    OP : string := "fconv";    -- operation to implement
                               -- select: fconv, fadd, fmul
    VARIANT : string := "base" -- implementation variant
                               -- select: base, opt, altera
  );
  port (
    clk     : in  std_logic;
    a, b, c : in  std_logic_vector(15 downto 0); -- float 16-bit (1.5.10)
    y       : out std_logic_vector(15 downto 0)  -- float 16-bit (1.5.10)
  );
end entity;

architecture rtl of top is

  -- declare verilog modules
  component fconv16_opt is
    port (
      clk : in  std_logic;
      a   : in  std_logic_vector(15 downto 0); -- signed 16-bit integer
      y   : out std_logic_vector(15 downto 0)  -- float 16-bit (1.5.10)
    );
  end component;
  component fadd16_opt is
    port (
      clk  : in  std_logic;
      a, b : in  std_logic_vector(15 downto 0); -- float 16-bit (1.5.10)
      y    : out std_logic_vector(15 downto 0)  -- float 16-bit (1.5.10)
    );
  end component;

  -- declare altera megawizard entities
  component fconv16_alt is
    port (
      clk    : in  std_logic;
      areset : in  std_logic;
      a      : in  std_logic_vector(15 downto 0);
      q      : out std_logic_vector(15 downto 0)
    );
  end component;
  component fadd16_alt is
    port (
      clk    : in  std_logic;
      areset : in  std_logic;
      a, b   : in  std_logic_vector(15 downto 0);
      q      : out std_logic_vector(15 downto 0)
    );
  end component;

  signal aff, bff, cff : std_logic_vector(15 downto 0) := (others => '0');

begin

  process (clk) is
  begin
    if rising_edge(clk) then
      aff <= a;
      bff <= b;
      cff <= c;
    end if;
  end process;

  gen_fconv : if OP = "fconv" generate
    gen_variant : if VARIANT = "base" generate
      fconv_inst : entity work.fconv16_base
        port map (clk => clk, a => aff, y => y);

    elsif VARIANT = "opt" generate
      fconv_inst : fconv16_opt
        port map (clk => clk, a => aff, y => y);

    elsif VARIANT = "altera" generate
      fconv_inst : fconv16_alt
        port map (clk => clk, areset => '0', a => aff, q => y);

    end generate;
  end generate;

  gen_fadd : if OP = "fadd" generate
    gen_variant : if VARIANT = "base" generate
      fadd_inst : entity work.fadd16_base
        port map (clk => clk, a => aff, b => bff, y => y);

    elsif VARIANT = "opt" generate
      fadd_inst : fadd16_opt
        port map (clk => clk, a => aff, b => bff, y => y);

    elsif VARIANT = "altera" generate
      fadd_inst : fadd16_alt
        port map (clk => clk, areset => '0', a => aff, b => bff, q => y);

    end generate;
  end generate;

end architecture;
