library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity fconv16_base is
  generic (
    N_STAGES: natural := 3
  );
  port (
    clk: in std_logic;
    a: in std_logic_vector (15 downto 0);
    y: out std_logic_vector (15 downto 0)
  );
end entity;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

architecture rtl of fconv16_base is
  signal wrap_clk: std_logic;
  subtype typwrap_a is std_logic_vector (15 downto 0);
  signal wrap_a: typwrap_a;
  subtype typwrap_y is std_logic_vector (15 downto 0);
  signal wrap_y: typwrap_y;
  constant n1_o : std_logic_vector (63 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000";
  signal ffy : std_logic_vector (63 downto 0);
  signal n19_o : std_logic;
  signal n21_o : std_logic;
  signal n22_o : std_logic_vector (15 downto 0);
  signal n25_o : std_logic;
  signal n26_o : std_logic;
  signal n28_o : std_logic_vector (4 downto 0);
  signal n29_o : std_logic;
  signal n30_o : std_logic;
  signal n32_o : std_logic_vector (4 downto 0);
  signal n33_o : std_logic;
  signal n34_o : std_logic;
  signal n36_o : std_logic_vector (4 downto 0);
  signal n37_o : std_logic;
  signal n38_o : std_logic;
  signal n40_o : std_logic_vector (4 downto 0);
  signal n41_o : std_logic;
  signal n42_o : std_logic;
  signal n44_o : std_logic_vector (4 downto 0);
  signal n45_o : std_logic;
  signal n46_o : std_logic;
  signal n48_o : std_logic_vector (4 downto 0);
  signal n49_o : std_logic;
  signal n50_o : std_logic;
  signal n52_o : std_logic_vector (4 downto 0);
  signal n53_o : std_logic;
  signal n54_o : std_logic;
  signal n56_o : std_logic_vector (4 downto 0);
  signal n57_o : std_logic;
  signal n58_o : std_logic;
  signal n60_o : std_logic_vector (4 downto 0);
  signal n61_o : std_logic;
  signal n62_o : std_logic;
  signal n64_o : std_logic_vector (4 downto 0);
  signal n65_o : std_logic;
  signal n66_o : std_logic;
  signal n68_o : std_logic_vector (4 downto 0);
  signal n69_o : std_logic;
  signal n70_o : std_logic;
  signal n72_o : std_logic_vector (4 downto 0);
  signal n73_o : std_logic;
  signal n74_o : std_logic;
  signal n76_o : std_logic_vector (4 downto 0);
  signal n77_o : std_logic;
  signal n78_o : std_logic;
  signal n80_o : std_logic_vector (4 downto 0);
  signal n81_o : std_logic;
  signal n82_o : std_logic;
  signal n84_o : std_logic_vector (4 downto 0);
  signal n85_o : std_logic;
  signal n86_o : std_logic;
  signal n88_o : std_logic_vector (4 downto 0);
  signal n91_o : std_logic_vector (7 downto 0);
  signal n94_o : std_logic;
  constant n96_o : std_logic_vector (15 downto 0) := "0111110000000000";
  signal n97_o : std_logic_vector (14 downto 0);
  signal n98_o : std_logic_vector (31 downto 0);
  signal n100_o : std_logic_vector (31 downto 0);
  signal n101_o : std_logic_vector (30 downto 0);
  signal n102_o : std_logic_vector (15 downto 0);
  signal n103_o : std_logic_vector (9 downto 0);
  signal n123_o : std_logic;
  signal n125_o : std_logic_vector (4 downto 0);
  signal n127_o : std_logic_vector (9 downto 0);
  signal n129_o : std_logic_vector (9 downto 0);
  signal n130_o : std_logic_vector (4 downto 0);
  signal n131_o : std_logic;
  signal n132_o : std_logic_vector (9 downto 0);
  signal n134_o : std_logic_vector (4 downto 0);
  signal n135_o : std_logic;
  signal n136_o : std_logic;
  signal n137_o : std_logic_vector (3 downto 0);
  signal n138_o : std_logic_vector (4 downto 0);
  signal n139_o : std_logic_vector (15 downto 0);
  signal n140_o : std_logic_vector (15 downto 0);
  signal n141_o : std_logic_vector (15 downto 0);
  signal n157_o : std_logic_vector (15 downto 0);
  signal n187_o : std_logic_vector (47 downto 0);
  signal n191_o : std_logic_vector (15 downto 0);
  signal n203_o : std_logic_vector (47 downto 0);
  signal n204_q : std_logic_vector (47 downto 0) := n1_o (63 downto 16);
  signal n205_o : std_logic_vector (63 downto 0);
begin
  wrap_clk <= clk;
  wrap_a <= typwrap_a(a);
  y <= std_logic_vector(wrap_y);
  wrap_y <= n191_o;
  -- ../src/fconv16.vhd:30:10
  ffy <= n205_o; -- (isignal)
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:2795:17
  n19_o <= '1' when wrap_a = "0000000000000000" else '0';
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:2799:27
  n21_o <= wrap_a (15);
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:2800:27
  n22_o <= std_logic_vector(abs signed (wrap_a));
  n25_o <= n22_o (0);
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:2802:28
  n26_o <= '1' when n25_o = '1' else '0';
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:2802:28
  n28_o <= "11111" when n26_o = '0' else "00000";
  n29_o <= n22_o (1);
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:2802:28
  n30_o <= '1' when n29_o = '1' else '0';
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:2802:28
  n32_o <= n28_o when n30_o = '0' else "00001";
  n33_o <= n22_o (2);
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:2802:28
  n34_o <= '1' when n33_o = '1' else '0';
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:2802:28
  n36_o <= n32_o when n34_o = '0' else "00010";
  n37_o <= n22_o (3);
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:2802:28
  n38_o <= '1' when n37_o = '1' else '0';
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:2802:28
  n40_o <= n36_o when n38_o = '0' else "00011";
  n41_o <= n22_o (4);
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:2802:28
  n42_o <= '1' when n41_o = '1' else '0';
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:2802:28
  n44_o <= n40_o when n42_o = '0' else "00100";
  n45_o <= n22_o (5);
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:2802:28
  n46_o <= '1' when n45_o = '1' else '0';
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:2802:28
  n48_o <= n44_o when n46_o = '0' else "00101";
  n49_o <= n22_o (6);
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:2802:28
  n50_o <= '1' when n49_o = '1' else '0';
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:2802:28
  n52_o <= n48_o when n50_o = '0' else "00110";
  n53_o <= n22_o (7);
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:2802:28
  n54_o <= '1' when n53_o = '1' else '0';
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:2802:28
  n56_o <= n52_o when n54_o = '0' else "00111";
  n57_o <= n22_o (8);
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:2802:28
  n58_o <= '1' when n57_o = '1' else '0';
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:2802:28
  n60_o <= n56_o when n58_o = '0' else "01000";
  n61_o <= n22_o (9);
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:2802:28
  n62_o <= '1' when n61_o = '1' else '0';
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:2802:28
  n64_o <= n60_o when n62_o = '0' else "01001";
  n65_o <= n22_o (10);
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:2802:28
  n66_o <= '1' when n65_o = '1' else '0';
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:2802:28
  n68_o <= n64_o when n66_o = '0' else "01010";
  n69_o <= n22_o (11);
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:2802:28
  n70_o <= '1' when n69_o = '1' else '0';
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:2802:28
  n72_o <= n68_o when n70_o = '0' else "01011";
  n73_o <= n22_o (12);
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:2802:28
  n74_o <= '1' when n73_o = '1' else '0';
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:2802:28
  n76_o <= n72_o when n74_o = '0' else "01100";
  n77_o <= n22_o (13);
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:2802:28
  n78_o <= '1' when n77_o = '1' else '0';
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:2802:28
  n80_o <= n76_o when n78_o = '0' else "01101";
  n81_o <= n22_o (14);
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:2802:28
  n82_o <= '1' when n81_o = '1' else '0';
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:2802:28
  n84_o <= n80_o when n82_o = '0' else "01110";
  n85_o <= n22_o (15);
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:2802:28
  n86_o <= '1' when n85_o = '1' else '0';
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:2802:28
  n88_o <= n84_o when n86_o = '0' else "01111";
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:2802:16
  n91_o <= std_logic_vector (resize (signed (n88_o), 8));  --  sext
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:2803:16
  n94_o <= '1' when unsigned (n91_o) > unsigned'("00001111") else '0';
  n97_o <= n96_o (14 downto 0);
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:2809:54
  n98_o <= std_logic_vector (resize (signed (n88_o), 32));  --  sext
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:2809:53
  n100_o <= std_logic_vector (unsigned'("00000000000000000000000000001111") - unsigned (n98_o));
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:2809:41
  n101_o <= n100_o (30 downto 0);  --  trunc
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:2809:20
  n102_o <= std_logic_vector (shift_left (unsigned (n22_o), to_integer (unsigned (n101_o))));
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:2811:28
  n103_o <= n102_o (14 downto 5);
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:231:8
  n123_o <= '1' when n103_o = (9 downto 0 => '1') else '0';
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:232:29
  n125_o <= std_logic_vector (unsigned (n88_o) + unsigned'("00001"));
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:236:29
  n127_o <= std_logic_vector (unsigned (n103_o) + unsigned'("0000000001"));
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:231:5
  n129_o <= n127_o when n123_o = '0' else "0000000000";
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:2818:11
  n130_o <= n88_o when n131_o = '0' else n125_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:2818:11
  n131_o <= n123_o and '0';
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:2818:11
  n132_o <= n103_o when std_logic'('0') = '0' else n129_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:2834:32
  n134_o <= std_logic_vector (unsigned (n130_o) - unsigned'("00001"));
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:2835:56
  n135_o <= n134_o (4);
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:2835:47
  n136_o <= not n135_o;
  n137_o <= n134_o (3 downto 0);
  n138_o <= n136_o & n137_o;
  n139_o <= n21_o & n138_o & n132_o;
  n140_o <= n21_o & n97_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:2803:7
  n141_o <= n139_o when n94_o = '0' else n140_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:2795:5
  n157_o <= n141_o when n19_o = '0' else "0000000000000000";
  -- ../src/fconv16.vhd:35:32
  n187_o <= ffy (47 downto 0);
  -- ../src/fconv16.vhd:36:18
  n191_o <= ffy (63 downto 48);
  n203_o <= n1_o (63 downto 16);
  -- ../src/fconv16.vhd:35:3
  process (wrap_clk)
  begin
    if rising_edge (wrap_clk) then
      n204_q <= n187_o;
    end if;
  end process;
  -- ../src/fconv16.vhd:35:3
  n205_o <= n204_q & n157_o;
end rtl;
