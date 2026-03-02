-- ------------------------------------------------------------------------- 
-- High Level Design Compiler for Intel(R) FPGAs Version 25.1std (Release Build #1129)
-- Quartus Prime development tool and MATLAB/Simulink Interface
-- 
-- Legal Notice: Copyright 2025 Intel Corporation.  All rights reserved.
-- Your use of  Intel Corporation's design tools,  logic functions and other
-- software and  tools, and its AMPP partner logic functions, and any output
-- files any  of the foregoing (including  device programming  or simulation
-- files), and  any associated  documentation  or information  are expressly
-- subject  to the terms and  conditions of the  Intel FPGA Software License
-- Agreement, Intel MegaCore Function License Agreement, or other applicable
-- license agreement,  including,  without limitation,  that your use is for
-- the  sole  purpose of  programming  logic devices  manufactured by  Intel
-- and  sold by Intel  or its authorized  distributors. Please refer  to the
-- applicable agreement for further details.
-- ---------------------------------------------------------------------------

-- VHDL created from fconv16_alt_0002
-- VHDL created on Mon Mar  2 00:12:02 2026


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use IEEE.MATH_REAL.all;
use std.TextIO.all;
use work.dspba_library_package.all;

LIBRARY altera_mf;
USE altera_mf.altera_mf_components.all;
LIBRARY lpm;
USE lpm.lpm_components.all;

entity fconv16_alt_0002 is
    port (
        a : in std_logic_vector(15 downto 0);  -- sfix16
        q : out std_logic_vector(15 downto 0);  -- float16_m10
        clk : in std_logic;
        areset : in std_logic
    );
end fconv16_alt_0002;

architecture normal of fconv16_alt_0002 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signX_uid6_fxpToFPTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal xXorSign_uid7_fxpToFPTest_b : STD_LOGIC_VECTOR (15 downto 0);
    signal xXorSign_uid7_fxpToFPTest_q : STD_LOGIC_VECTOR (15 downto 0);
    signal yE_uid8_fxpToFPTest_a : STD_LOGIC_VECTOR (16 downto 0);
    signal yE_uid8_fxpToFPTest_b : STD_LOGIC_VECTOR (16 downto 0);
    signal yE_uid8_fxpToFPTest_o : STD_LOGIC_VECTOR (16 downto 0);
    signal yE_uid8_fxpToFPTest_q : STD_LOGIC_VECTOR (16 downto 0);
    signal y_uid9_fxpToFPTest_in : STD_LOGIC_VECTOR (15 downto 0);
    signal y_uid9_fxpToFPTest_b : STD_LOGIC_VECTOR (15 downto 0);
    signal maxCount_uid11_fxpToFPTest_q : STD_LOGIC_VECTOR (4 downto 0);
    signal inIsZero_uid12_fxpToFPTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal inIsZero_uid12_fxpToFPTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal msbIn_uid13_fxpToFPTest_q : STD_LOGIC_VECTOR (4 downto 0);
    signal expPreRnd_uid14_fxpToFPTest_a : STD_LOGIC_VECTOR (5 downto 0);
    signal expPreRnd_uid14_fxpToFPTest_b : STD_LOGIC_VECTOR (5 downto 0);
    signal expPreRnd_uid14_fxpToFPTest_o : STD_LOGIC_VECTOR (5 downto 0);
    signal expPreRnd_uid14_fxpToFPTest_q : STD_LOGIC_VECTOR (5 downto 0);
    signal expFracRnd_uid16_fxpToFPTest_q : STD_LOGIC_VECTOR (16 downto 0);
    signal sticky_uid20_fxpToFPTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal sticky_uid20_fxpToFPTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal nr_uid21_fxpToFPTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal rnd_uid22_fxpToFPTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expFracR_uid24_fxpToFPTest_a : STD_LOGIC_VECTOR (18 downto 0);
    signal expFracR_uid24_fxpToFPTest_b : STD_LOGIC_VECTOR (18 downto 0);
    signal expFracR_uid24_fxpToFPTest_o : STD_LOGIC_VECTOR (18 downto 0);
    signal expFracR_uid24_fxpToFPTest_q : STD_LOGIC_VECTOR (17 downto 0);
    signal fracR_uid25_fxpToFPTest_in : STD_LOGIC_VECTOR (10 downto 0);
    signal fracR_uid25_fxpToFPTest_b : STD_LOGIC_VECTOR (9 downto 0);
    signal expR_uid26_fxpToFPTest_b : STD_LOGIC_VECTOR (6 downto 0);
    signal udf_uid27_fxpToFPTest_a : STD_LOGIC_VECTOR (8 downto 0);
    signal udf_uid27_fxpToFPTest_b : STD_LOGIC_VECTOR (8 downto 0);
    signal udf_uid27_fxpToFPTest_o : STD_LOGIC_VECTOR (8 downto 0);
    signal udf_uid27_fxpToFPTest_n : STD_LOGIC_VECTOR (0 downto 0);
    signal expInf_uid28_fxpToFPTest_q : STD_LOGIC_VECTOR (4 downto 0);
    signal ovf_uid29_fxpToFPTest_a : STD_LOGIC_VECTOR (8 downto 0);
    signal ovf_uid29_fxpToFPTest_b : STD_LOGIC_VECTOR (8 downto 0);
    signal ovf_uid29_fxpToFPTest_o : STD_LOGIC_VECTOR (8 downto 0);
    signal ovf_uid29_fxpToFPTest_n : STD_LOGIC_VECTOR (0 downto 0);
    signal excSelector_uid30_fxpToFPTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracZ_uid31_fxpToFPTest_q : STD_LOGIC_VECTOR (9 downto 0);
    signal fracRPostExc_uid32_fxpToFPTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal fracRPostExc_uid32_fxpToFPTest_q : STD_LOGIC_VECTOR (9 downto 0);
    signal udfOrInZero_uid33_fxpToFPTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excSelector_uid34_fxpToFPTest_q : STD_LOGIC_VECTOR (1 downto 0);
    signal expZ_uid37_fxpToFPTest_q : STD_LOGIC_VECTOR (4 downto 0);
    signal expR_uid38_fxpToFPTest_in : STD_LOGIC_VECTOR (4 downto 0);
    signal expR_uid38_fxpToFPTest_b : STD_LOGIC_VECTOR (4 downto 0);
    signal expRPostExc_uid39_fxpToFPTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal expRPostExc_uid39_fxpToFPTest_q : STD_LOGIC_VECTOR (4 downto 0);
    signal outRes_uid40_fxpToFPTest_q : STD_LOGIC_VECTOR (15 downto 0);
    signal zs_uid42_lzcShifterZ1_uid10_fxpToFPTest_q : STD_LOGIC_VECTOR (15 downto 0);
    signal vCount_uid44_lzcShifterZ1_uid10_fxpToFPTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q : STD_LOGIC_VECTOR (15 downto 0);
    signal zs_uid47_lzcShifterZ1_uid10_fxpToFPTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal vCount_uid49_lzcShifterZ1_uid10_fxpToFPTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal vCount_uid49_lzcShifterZ1_uid10_fxpToFPTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal cStage_uid52_lzcShifterZ1_uid10_fxpToFPTest_q : STD_LOGIC_VECTOR (15 downto 0);
    signal vStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q : STD_LOGIC_VECTOR (15 downto 0);
    signal zs_uid54_lzcShifterZ1_uid10_fxpToFPTest_q : STD_LOGIC_VECTOR (3 downto 0);
    signal vCount_uid56_lzcShifterZ1_uid10_fxpToFPTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal cStage_uid59_lzcShifterZ1_uid10_fxpToFPTest_q : STD_LOGIC_VECTOR (15 downto 0);
    signal vStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q : STD_LOGIC_VECTOR (15 downto 0);
    signal zs_uid61_lzcShifterZ1_uid10_fxpToFPTest_q : STD_LOGIC_VECTOR (1 downto 0);
    signal vCount_uid63_lzcShifterZ1_uid10_fxpToFPTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal cStage_uid66_lzcShifterZ1_uid10_fxpToFPTest_q : STD_LOGIC_VECTOR (15 downto 0);
    signal vStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q : STD_LOGIC_VECTOR (15 downto 0);
    signal vCount_uid70_lzcShifterZ1_uid10_fxpToFPTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal cStage_uid73_lzcShifterZ1_uid10_fxpToFPTest_q : STD_LOGIC_VECTOR (15 downto 0);
    signal vStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q : STD_LOGIC_VECTOR (15 downto 0);
    signal vCount_uid75_lzcShifterZ1_uid10_fxpToFPTest_q : STD_LOGIC_VECTOR (4 downto 0);
    signal vCountBig_uid77_lzcShifterZ1_uid10_fxpToFPTest_a : STD_LOGIC_VECTOR (6 downto 0);
    signal vCountBig_uid77_lzcShifterZ1_uid10_fxpToFPTest_b : STD_LOGIC_VECTOR (6 downto 0);
    signal vCountBig_uid77_lzcShifterZ1_uid10_fxpToFPTest_o : STD_LOGIC_VECTOR (6 downto 0);
    signal vCountBig_uid77_lzcShifterZ1_uid10_fxpToFPTest_c : STD_LOGIC_VECTOR (0 downto 0);
    signal vCountFinal_uid79_lzcShifterZ1_uid10_fxpToFPTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vCountFinal_uid79_lzcShifterZ1_uid10_fxpToFPTest_q : STD_LOGIC_VECTOR (4 downto 0);
    signal l_uid17_fxpToFPTest_merged_bit_select_in : STD_LOGIC_VECTOR (1 downto 0);
    signal l_uid17_fxpToFPTest_merged_bit_select_b : STD_LOGIC_VECTOR (0 downto 0);
    signal l_uid17_fxpToFPTest_merged_bit_select_c : STD_LOGIC_VECTOR (0 downto 0);
    signal rVStage_uid48_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_b : STD_LOGIC_VECTOR (7 downto 0);
    signal rVStage_uid48_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c : STD_LOGIC_VECTOR (7 downto 0);
    signal rVStage_uid55_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_b : STD_LOGIC_VECTOR (3 downto 0);
    signal rVStage_uid55_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c : STD_LOGIC_VECTOR (11 downto 0);
    signal rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_b : STD_LOGIC_VECTOR (1 downto 0);
    signal rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c : STD_LOGIC_VECTOR (13 downto 0);
    signal rVStage_uid69_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_b : STD_LOGIC_VECTOR (0 downto 0);
    signal rVStage_uid69_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c : STD_LOGIC_VECTOR (14 downto 0);
    signal fracRnd_uid15_fxpToFPTest_merged_bit_select_in : STD_LOGIC_VECTOR (14 downto 0);
    signal fracRnd_uid15_fxpToFPTest_merged_bit_select_b : STD_LOGIC_VECTOR (10 downto 0);
    signal fracRnd_uid15_fxpToFPTest_merged_bit_select_c : STD_LOGIC_VECTOR (3 downto 0);
    signal redist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q : STD_LOGIC_VECTOR (10 downto 0);
    signal redist1_rVStage_uid48_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist2_vCount_uid63_lzcShifterZ1_uid10_fxpToFPTest_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_vCount_uid56_lzcShifterZ1_uid10_fxpToFPTest_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_vCount_uid49_lzcShifterZ1_uid10_fxpToFPTest_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_vStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_1_q : STD_LOGIC_VECTOR (15 downto 0);
    signal redist6_vCount_uid44_lzcShifterZ1_uid10_fxpToFPTest_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_expR_uid26_fxpToFPTest_b_1_q : STD_LOGIC_VECTOR (6 downto 0);
    signal redist8_fracR_uid25_fxpToFPTest_b_1_q : STD_LOGIC_VECTOR (9 downto 0);
    signal redist9_inIsZero_uid12_fxpToFPTest_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_y_uid9_fxpToFPTest_b_1_q : STD_LOGIC_VECTOR (15 downto 0);
    signal redist11_signX_uid6_fxpToFPTest_b_5_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- signX_uid6_fxpToFPTest(BITSELECT,5)@0
    signX_uid6_fxpToFPTest_b <= STD_LOGIC_VECTOR(a(15 downto 15));

    -- redist11_signX_uid6_fxpToFPTest_b_5(DELAY,98)
    redist11_signX_uid6_fxpToFPTest_b_5 : dspba_delay
    GENERIC MAP ( width => 1, depth => 5, reset_kind => "ASYNC" )
    PORT MAP ( xin => signX_uid6_fxpToFPTest_b, xout => redist11_signX_uid6_fxpToFPTest_b_5_q, clk => clk, aclr => areset );

    -- expInf_uid28_fxpToFPTest(CONSTANT,27)
    expInf_uid28_fxpToFPTest_q <= "11111";

    -- expZ_uid37_fxpToFPTest(CONSTANT,36)
    expZ_uid37_fxpToFPTest_q <= "00000";

    -- rVStage_uid69_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select(BITSELECT,85)@3
    rVStage_uid69_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_b <= vStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q(15 downto 15);
    rVStage_uid69_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c <= vStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q(14 downto 0);

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- cStage_uid73_lzcShifterZ1_uid10_fxpToFPTest(BITJOIN,72)@3
    cStage_uid73_lzcShifterZ1_uid10_fxpToFPTest_q <= rVStage_uid69_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c & GND_q;

    -- rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select(BITSELECT,84)@2
    rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_b <= vStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q(15 downto 14);
    rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c <= vStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q(13 downto 0);

    -- zs_uid61_lzcShifterZ1_uid10_fxpToFPTest(CONSTANT,60)
    zs_uid61_lzcShifterZ1_uid10_fxpToFPTest_q <= "00";

    -- cStage_uid66_lzcShifterZ1_uid10_fxpToFPTest(BITJOIN,65)@2
    cStage_uid66_lzcShifterZ1_uid10_fxpToFPTest_q <= rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c & zs_uid61_lzcShifterZ1_uid10_fxpToFPTest_q;

    -- rVStage_uid55_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select(BITSELECT,83)@2
    rVStage_uid55_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_b <= vStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q(15 downto 12);
    rVStage_uid55_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c <= vStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q(11 downto 0);

    -- zs_uid54_lzcShifterZ1_uid10_fxpToFPTest(CONSTANT,53)
    zs_uid54_lzcShifterZ1_uid10_fxpToFPTest_q <= "0000";

    -- cStage_uid59_lzcShifterZ1_uid10_fxpToFPTest(BITJOIN,58)@2
    cStage_uid59_lzcShifterZ1_uid10_fxpToFPTest_q <= rVStage_uid55_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c & zs_uid54_lzcShifterZ1_uid10_fxpToFPTest_q;

    -- zs_uid42_lzcShifterZ1_uid10_fxpToFPTest(CONSTANT,41)
    zs_uid42_lzcShifterZ1_uid10_fxpToFPTest_q <= "0000000000000000";

    -- xXorSign_uid7_fxpToFPTest(LOGICAL,6)@0
    xXorSign_uid7_fxpToFPTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((15 downto 1 => signX_uid6_fxpToFPTest_b(0)) & signX_uid6_fxpToFPTest_b));
    xXorSign_uid7_fxpToFPTest_q <= a xor xXorSign_uid7_fxpToFPTest_b;

    -- yE_uid8_fxpToFPTest(ADD,7)@0
    yE_uid8_fxpToFPTest_a <= STD_LOGIC_VECTOR("0" & xXorSign_uid7_fxpToFPTest_q);
    yE_uid8_fxpToFPTest_b <= STD_LOGIC_VECTOR("0000000000000000" & signX_uid6_fxpToFPTest_b);
    yE_uid8_fxpToFPTest_o <= STD_LOGIC_VECTOR(UNSIGNED(yE_uid8_fxpToFPTest_a) + UNSIGNED(yE_uid8_fxpToFPTest_b));
    yE_uid8_fxpToFPTest_q <= yE_uid8_fxpToFPTest_o(16 downto 0);

    -- y_uid9_fxpToFPTest(BITSELECT,8)@0
    y_uid9_fxpToFPTest_in <= STD_LOGIC_VECTOR(yE_uid8_fxpToFPTest_q(15 downto 0));
    y_uid9_fxpToFPTest_b <= STD_LOGIC_VECTOR(y_uid9_fxpToFPTest_in(15 downto 0));

    -- redist10_y_uid9_fxpToFPTest_b_1(DELAY,97)
    redist10_y_uid9_fxpToFPTest_b_1 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => y_uid9_fxpToFPTest_b, xout => redist10_y_uid9_fxpToFPTest_b_1_q, clk => clk, aclr => areset );

    -- vCount_uid44_lzcShifterZ1_uid10_fxpToFPTest(LOGICAL,43)@1
    vCount_uid44_lzcShifterZ1_uid10_fxpToFPTest_q <= "1" WHEN redist10_y_uid9_fxpToFPTest_b_1_q = zs_uid42_lzcShifterZ1_uid10_fxpToFPTest_q ELSE "0";

    -- vStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest(MUX,45)@1
    vStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_s <= vCount_uid44_lzcShifterZ1_uid10_fxpToFPTest_q;
    vStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_combproc: PROCESS (vStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_s, redist10_y_uid9_fxpToFPTest_b_1_q, zs_uid42_lzcShifterZ1_uid10_fxpToFPTest_q)
    BEGIN
        CASE (vStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_s) IS
            WHEN "0" => vStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q <= redist10_y_uid9_fxpToFPTest_b_1_q;
            WHEN "1" => vStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q <= zs_uid42_lzcShifterZ1_uid10_fxpToFPTest_q;
            WHEN OTHERS => vStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rVStage_uid48_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select(BITSELECT,82)@1
    rVStage_uid48_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_b <= vStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q(15 downto 8);
    rVStage_uid48_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c <= vStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q(7 downto 0);

    -- redist1_rVStage_uid48_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1(DELAY,88)
    redist1_rVStage_uid48_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => rVStage_uid48_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c, xout => redist1_rVStage_uid48_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q, clk => clk, aclr => areset );

    -- zs_uid47_lzcShifterZ1_uid10_fxpToFPTest(CONSTANT,46)
    zs_uid47_lzcShifterZ1_uid10_fxpToFPTest_q <= "00000000";

    -- cStage_uid52_lzcShifterZ1_uid10_fxpToFPTest(BITJOIN,51)@2
    cStage_uid52_lzcShifterZ1_uid10_fxpToFPTest_q <= redist1_rVStage_uid48_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q & zs_uid47_lzcShifterZ1_uid10_fxpToFPTest_q;

    -- redist5_vStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_1(DELAY,92)
    redist5_vStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_1 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => vStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q, xout => redist5_vStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_1_q, clk => clk, aclr => areset );

    -- vCount_uid49_lzcShifterZ1_uid10_fxpToFPTest(LOGICAL,48)@1 + 1
    vCount_uid49_lzcShifterZ1_uid10_fxpToFPTest_qi <= "1" WHEN rVStage_uid48_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_b = zs_uid47_lzcShifterZ1_uid10_fxpToFPTest_q ELSE "0";
    vCount_uid49_lzcShifterZ1_uid10_fxpToFPTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => vCount_uid49_lzcShifterZ1_uid10_fxpToFPTest_qi, xout => vCount_uid49_lzcShifterZ1_uid10_fxpToFPTest_q, clk => clk, aclr => areset );

    -- vStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest(MUX,52)@2
    vStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_s <= vCount_uid49_lzcShifterZ1_uid10_fxpToFPTest_q;
    vStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_combproc: PROCESS (vStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_s, redist5_vStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_1_q, cStage_uid52_lzcShifterZ1_uid10_fxpToFPTest_q)
    BEGIN
        CASE (vStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_s) IS
            WHEN "0" => vStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q <= redist5_vStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_1_q;
            WHEN "1" => vStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q <= cStage_uid52_lzcShifterZ1_uid10_fxpToFPTest_q;
            WHEN OTHERS => vStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- vCount_uid56_lzcShifterZ1_uid10_fxpToFPTest(LOGICAL,55)@2
    vCount_uid56_lzcShifterZ1_uid10_fxpToFPTest_q <= "1" WHEN rVStage_uid55_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_b = zs_uid54_lzcShifterZ1_uid10_fxpToFPTest_q ELSE "0";

    -- vStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest(MUX,59)@2
    vStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_s <= vCount_uid56_lzcShifterZ1_uid10_fxpToFPTest_q;
    vStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_combproc: PROCESS (vStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_s, vStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q, cStage_uid59_lzcShifterZ1_uid10_fxpToFPTest_q)
    BEGIN
        CASE (vStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_s) IS
            WHEN "0" => vStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q <= vStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q;
            WHEN "1" => vStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q <= cStage_uid59_lzcShifterZ1_uid10_fxpToFPTest_q;
            WHEN OTHERS => vStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- vCount_uid63_lzcShifterZ1_uid10_fxpToFPTest(LOGICAL,62)@2
    vCount_uid63_lzcShifterZ1_uid10_fxpToFPTest_q <= "1" WHEN rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_b = zs_uid61_lzcShifterZ1_uid10_fxpToFPTest_q ELSE "0";

    -- vStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest(MUX,66)@2 + 1
    vStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_s <= vCount_uid63_lzcShifterZ1_uid10_fxpToFPTest_q;
    vStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            vStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (vStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_s) IS
                WHEN "0" => vStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q <= vStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q;
                WHEN "1" => vStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q <= cStage_uid66_lzcShifterZ1_uid10_fxpToFPTest_q;
                WHEN OTHERS => vStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- vCount_uid70_lzcShifterZ1_uid10_fxpToFPTest(LOGICAL,69)@3
    vCount_uid70_lzcShifterZ1_uid10_fxpToFPTest_q <= "1" WHEN rVStage_uid69_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_b = GND_q ELSE "0";

    -- vStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest(MUX,73)@3
    vStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_s <= vCount_uid70_lzcShifterZ1_uid10_fxpToFPTest_q;
    vStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_combproc: PROCESS (vStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_s, vStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q, cStage_uid73_lzcShifterZ1_uid10_fxpToFPTest_q)
    BEGIN
        CASE (vStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_s) IS
            WHEN "0" => vStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q <= vStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q;
            WHEN "1" => vStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q <= cStage_uid73_lzcShifterZ1_uid10_fxpToFPTest_q;
            WHEN OTHERS => vStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- fracRnd_uid15_fxpToFPTest_merged_bit_select(BITSELECT,86)@3
    fracRnd_uid15_fxpToFPTest_merged_bit_select_in <= vStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q(14 downto 0);
    fracRnd_uid15_fxpToFPTest_merged_bit_select_b <= fracRnd_uid15_fxpToFPTest_merged_bit_select_in(14 downto 4);
    fracRnd_uid15_fxpToFPTest_merged_bit_select_c <= fracRnd_uid15_fxpToFPTest_merged_bit_select_in(3 downto 0);

    -- sticky_uid20_fxpToFPTest(LOGICAL,19)@3 + 1
    sticky_uid20_fxpToFPTest_qi <= "1" WHEN fracRnd_uid15_fxpToFPTest_merged_bit_select_c /= "0000" ELSE "0";
    sticky_uid20_fxpToFPTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => sticky_uid20_fxpToFPTest_qi, xout => sticky_uid20_fxpToFPTest_q, clk => clk, aclr => areset );

    -- nr_uid21_fxpToFPTest(LOGICAL,20)@4
    nr_uid21_fxpToFPTest_q <= not (l_uid17_fxpToFPTest_merged_bit_select_c);

    -- l_uid17_fxpToFPTest_merged_bit_select(BITSELECT,81)@4
    l_uid17_fxpToFPTest_merged_bit_select_in <= STD_LOGIC_VECTOR(expFracRnd_uid16_fxpToFPTest_q(1 downto 0));
    l_uid17_fxpToFPTest_merged_bit_select_b <= STD_LOGIC_VECTOR(l_uid17_fxpToFPTest_merged_bit_select_in(1 downto 1));
    l_uid17_fxpToFPTest_merged_bit_select_c <= STD_LOGIC_VECTOR(l_uid17_fxpToFPTest_merged_bit_select_in(0 downto 0));

    -- rnd_uid22_fxpToFPTest(LOGICAL,21)@4
    rnd_uid22_fxpToFPTest_q <= l_uid17_fxpToFPTest_merged_bit_select_b or nr_uid21_fxpToFPTest_q or sticky_uid20_fxpToFPTest_q;

    -- maxCount_uid11_fxpToFPTest(CONSTANT,10)
    maxCount_uid11_fxpToFPTest_q <= "10000";

    -- redist6_vCount_uid44_lzcShifterZ1_uid10_fxpToFPTest_q_2(DELAY,93)
    redist6_vCount_uid44_lzcShifterZ1_uid10_fxpToFPTest_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => vCount_uid44_lzcShifterZ1_uid10_fxpToFPTest_q, xout => redist6_vCount_uid44_lzcShifterZ1_uid10_fxpToFPTest_q_2_q, clk => clk, aclr => areset );

    -- redist4_vCount_uid49_lzcShifterZ1_uid10_fxpToFPTest_q_2(DELAY,91)
    redist4_vCount_uid49_lzcShifterZ1_uid10_fxpToFPTest_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => vCount_uid49_lzcShifterZ1_uid10_fxpToFPTest_q, xout => redist4_vCount_uid49_lzcShifterZ1_uid10_fxpToFPTest_q_2_q, clk => clk, aclr => areset );

    -- redist3_vCount_uid56_lzcShifterZ1_uid10_fxpToFPTest_q_1(DELAY,90)
    redist3_vCount_uid56_lzcShifterZ1_uid10_fxpToFPTest_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => vCount_uid56_lzcShifterZ1_uid10_fxpToFPTest_q, xout => redist3_vCount_uid56_lzcShifterZ1_uid10_fxpToFPTest_q_1_q, clk => clk, aclr => areset );

    -- redist2_vCount_uid63_lzcShifterZ1_uid10_fxpToFPTest_q_1(DELAY,89)
    redist2_vCount_uid63_lzcShifterZ1_uid10_fxpToFPTest_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => vCount_uid63_lzcShifterZ1_uid10_fxpToFPTest_q, xout => redist2_vCount_uid63_lzcShifterZ1_uid10_fxpToFPTest_q_1_q, clk => clk, aclr => areset );

    -- vCount_uid75_lzcShifterZ1_uid10_fxpToFPTest(BITJOIN,74)@3
    vCount_uid75_lzcShifterZ1_uid10_fxpToFPTest_q <= redist6_vCount_uid44_lzcShifterZ1_uid10_fxpToFPTest_q_2_q & redist4_vCount_uid49_lzcShifterZ1_uid10_fxpToFPTest_q_2_q & redist3_vCount_uid56_lzcShifterZ1_uid10_fxpToFPTest_q_1_q & redist2_vCount_uid63_lzcShifterZ1_uid10_fxpToFPTest_q_1_q & vCount_uid70_lzcShifterZ1_uid10_fxpToFPTest_q;

    -- vCountBig_uid77_lzcShifterZ1_uid10_fxpToFPTest(COMPARE,76)@3
    vCountBig_uid77_lzcShifterZ1_uid10_fxpToFPTest_a <= STD_LOGIC_VECTOR("00" & maxCount_uid11_fxpToFPTest_q);
    vCountBig_uid77_lzcShifterZ1_uid10_fxpToFPTest_b <= STD_LOGIC_VECTOR("00" & vCount_uid75_lzcShifterZ1_uid10_fxpToFPTest_q);
    vCountBig_uid77_lzcShifterZ1_uid10_fxpToFPTest_o <= STD_LOGIC_VECTOR(UNSIGNED(vCountBig_uid77_lzcShifterZ1_uid10_fxpToFPTest_a) - UNSIGNED(vCountBig_uid77_lzcShifterZ1_uid10_fxpToFPTest_b));
    vCountBig_uid77_lzcShifterZ1_uid10_fxpToFPTest_c(0) <= vCountBig_uid77_lzcShifterZ1_uid10_fxpToFPTest_o(6);

    -- vCountFinal_uid79_lzcShifterZ1_uid10_fxpToFPTest(MUX,78)@3
    vCountFinal_uid79_lzcShifterZ1_uid10_fxpToFPTest_s <= vCountBig_uid77_lzcShifterZ1_uid10_fxpToFPTest_c;
    vCountFinal_uid79_lzcShifterZ1_uid10_fxpToFPTest_combproc: PROCESS (vCountFinal_uid79_lzcShifterZ1_uid10_fxpToFPTest_s, vCount_uid75_lzcShifterZ1_uid10_fxpToFPTest_q, maxCount_uid11_fxpToFPTest_q)
    BEGIN
        CASE (vCountFinal_uid79_lzcShifterZ1_uid10_fxpToFPTest_s) IS
            WHEN "0" => vCountFinal_uid79_lzcShifterZ1_uid10_fxpToFPTest_q <= vCount_uid75_lzcShifterZ1_uid10_fxpToFPTest_q;
            WHEN "1" => vCountFinal_uid79_lzcShifterZ1_uid10_fxpToFPTest_q <= maxCount_uid11_fxpToFPTest_q;
            WHEN OTHERS => vCountFinal_uid79_lzcShifterZ1_uid10_fxpToFPTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- msbIn_uid13_fxpToFPTest(CONSTANT,12)
    msbIn_uid13_fxpToFPTest_q <= "11110";

    -- expPreRnd_uid14_fxpToFPTest(SUB,13)@3 + 1
    expPreRnd_uid14_fxpToFPTest_a <= STD_LOGIC_VECTOR("0" & msbIn_uid13_fxpToFPTest_q);
    expPreRnd_uid14_fxpToFPTest_b <= STD_LOGIC_VECTOR("0" & vCountFinal_uid79_lzcShifterZ1_uid10_fxpToFPTest_q);
    expPreRnd_uid14_fxpToFPTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expPreRnd_uid14_fxpToFPTest_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            expPreRnd_uid14_fxpToFPTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expPreRnd_uid14_fxpToFPTest_a) - UNSIGNED(expPreRnd_uid14_fxpToFPTest_b));
        END IF;
    END PROCESS;
    expPreRnd_uid14_fxpToFPTest_q <= expPreRnd_uid14_fxpToFPTest_o(5 downto 0);

    -- redist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1(DELAY,87)
    redist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1 : dspba_delay
    GENERIC MAP ( width => 11, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracRnd_uid15_fxpToFPTest_merged_bit_select_b, xout => redist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q, clk => clk, aclr => areset );

    -- expFracRnd_uid16_fxpToFPTest(BITJOIN,15)@4
    expFracRnd_uid16_fxpToFPTest_q <= expPreRnd_uid14_fxpToFPTest_q & redist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q;

    -- expFracR_uid24_fxpToFPTest(ADD,23)@4
    expFracR_uid24_fxpToFPTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((18 downto 17 => expFracRnd_uid16_fxpToFPTest_q(16)) & expFracRnd_uid16_fxpToFPTest_q));
    expFracR_uid24_fxpToFPTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000000000000000000" & rnd_uid22_fxpToFPTest_q));
    expFracR_uid24_fxpToFPTest_o <= STD_LOGIC_VECTOR(SIGNED(expFracR_uid24_fxpToFPTest_a) + SIGNED(expFracR_uid24_fxpToFPTest_b));
    expFracR_uid24_fxpToFPTest_q <= expFracR_uid24_fxpToFPTest_o(17 downto 0);

    -- expR_uid26_fxpToFPTest(BITSELECT,25)@4
    expR_uid26_fxpToFPTest_b <= STD_LOGIC_VECTOR(expFracR_uid24_fxpToFPTest_q(17 downto 11));

    -- redist7_expR_uid26_fxpToFPTest_b_1(DELAY,94)
    redist7_expR_uid26_fxpToFPTest_b_1 : dspba_delay
    GENERIC MAP ( width => 7, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expR_uid26_fxpToFPTest_b, xout => redist7_expR_uid26_fxpToFPTest_b_1_q, clk => clk, aclr => areset );

    -- expR_uid38_fxpToFPTest(BITSELECT,37)@5
    expR_uid38_fxpToFPTest_in <= redist7_expR_uid26_fxpToFPTest_b_1_q(4 downto 0);
    expR_uid38_fxpToFPTest_b <= expR_uid38_fxpToFPTest_in(4 downto 0);

    -- ovf_uid29_fxpToFPTest(COMPARE,28)@5
    ovf_uid29_fxpToFPTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((8 downto 7 => redist7_expR_uid26_fxpToFPTest_b_1_q(6)) & redist7_expR_uid26_fxpToFPTest_b_1_q));
    ovf_uid29_fxpToFPTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("0000" & expInf_uid28_fxpToFPTest_q));
    ovf_uid29_fxpToFPTest_o <= STD_LOGIC_VECTOR(SIGNED(ovf_uid29_fxpToFPTest_a) - SIGNED(ovf_uid29_fxpToFPTest_b));
    ovf_uid29_fxpToFPTest_n(0) <= not (ovf_uid29_fxpToFPTest_o(8));

    -- inIsZero_uid12_fxpToFPTest(LOGICAL,11)@3 + 1
    inIsZero_uid12_fxpToFPTest_qi <= "1" WHEN vCountFinal_uid79_lzcShifterZ1_uid10_fxpToFPTest_q = maxCount_uid11_fxpToFPTest_q ELSE "0";
    inIsZero_uid12_fxpToFPTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => inIsZero_uid12_fxpToFPTest_qi, xout => inIsZero_uid12_fxpToFPTest_q, clk => clk, aclr => areset );

    -- redist9_inIsZero_uid12_fxpToFPTest_q_2(DELAY,96)
    redist9_inIsZero_uid12_fxpToFPTest_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => inIsZero_uid12_fxpToFPTest_q, xout => redist9_inIsZero_uid12_fxpToFPTest_q_2_q, clk => clk, aclr => areset );

    -- udf_uid27_fxpToFPTest(COMPARE,26)@5
    udf_uid27_fxpToFPTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("00000000" & GND_q));
    udf_uid27_fxpToFPTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((8 downto 7 => redist7_expR_uid26_fxpToFPTest_b_1_q(6)) & redist7_expR_uid26_fxpToFPTest_b_1_q));
    udf_uid27_fxpToFPTest_o <= STD_LOGIC_VECTOR(SIGNED(udf_uid27_fxpToFPTest_a) - SIGNED(udf_uid27_fxpToFPTest_b));
    udf_uid27_fxpToFPTest_n(0) <= not (udf_uid27_fxpToFPTest_o(8));

    -- udfOrInZero_uid33_fxpToFPTest(LOGICAL,32)@5
    udfOrInZero_uid33_fxpToFPTest_q <= udf_uid27_fxpToFPTest_n or redist9_inIsZero_uid12_fxpToFPTest_q_2_q;

    -- excSelector_uid34_fxpToFPTest(BITJOIN,33)@5
    excSelector_uid34_fxpToFPTest_q <= ovf_uid29_fxpToFPTest_n & udfOrInZero_uid33_fxpToFPTest_q;

    -- expRPostExc_uid39_fxpToFPTest(MUX,38)@5
    expRPostExc_uid39_fxpToFPTest_s <= excSelector_uid34_fxpToFPTest_q;
    expRPostExc_uid39_fxpToFPTest_combproc: PROCESS (expRPostExc_uid39_fxpToFPTest_s, expR_uid38_fxpToFPTest_b, expZ_uid37_fxpToFPTest_q, expInf_uid28_fxpToFPTest_q)
    BEGIN
        CASE (expRPostExc_uid39_fxpToFPTest_s) IS
            WHEN "00" => expRPostExc_uid39_fxpToFPTest_q <= expR_uid38_fxpToFPTest_b;
            WHEN "01" => expRPostExc_uid39_fxpToFPTest_q <= expZ_uid37_fxpToFPTest_q;
            WHEN "10" => expRPostExc_uid39_fxpToFPTest_q <= expInf_uid28_fxpToFPTest_q;
            WHEN "11" => expRPostExc_uid39_fxpToFPTest_q <= expInf_uid28_fxpToFPTest_q;
            WHEN OTHERS => expRPostExc_uid39_fxpToFPTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- fracZ_uid31_fxpToFPTest(CONSTANT,30)
    fracZ_uid31_fxpToFPTest_q <= "0000000000";

    -- fracR_uid25_fxpToFPTest(BITSELECT,24)@4
    fracR_uid25_fxpToFPTest_in <= expFracR_uid24_fxpToFPTest_q(10 downto 0);
    fracR_uid25_fxpToFPTest_b <= fracR_uid25_fxpToFPTest_in(10 downto 1);

    -- redist8_fracR_uid25_fxpToFPTest_b_1(DELAY,95)
    redist8_fracR_uid25_fxpToFPTest_b_1 : dspba_delay
    GENERIC MAP ( width => 10, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracR_uid25_fxpToFPTest_b, xout => redist8_fracR_uid25_fxpToFPTest_b_1_q, clk => clk, aclr => areset );

    -- excSelector_uid30_fxpToFPTest(LOGICAL,29)@5
    excSelector_uid30_fxpToFPTest_q <= redist9_inIsZero_uid12_fxpToFPTest_q_2_q or ovf_uid29_fxpToFPTest_n or udf_uid27_fxpToFPTest_n;

    -- fracRPostExc_uid32_fxpToFPTest(MUX,31)@5
    fracRPostExc_uid32_fxpToFPTest_s <= excSelector_uid30_fxpToFPTest_q;
    fracRPostExc_uid32_fxpToFPTest_combproc: PROCESS (fracRPostExc_uid32_fxpToFPTest_s, redist8_fracR_uid25_fxpToFPTest_b_1_q, fracZ_uid31_fxpToFPTest_q)
    BEGIN
        CASE (fracRPostExc_uid32_fxpToFPTest_s) IS
            WHEN "0" => fracRPostExc_uid32_fxpToFPTest_q <= redist8_fracR_uid25_fxpToFPTest_b_1_q;
            WHEN "1" => fracRPostExc_uid32_fxpToFPTest_q <= fracZ_uid31_fxpToFPTest_q;
            WHEN OTHERS => fracRPostExc_uid32_fxpToFPTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- outRes_uid40_fxpToFPTest(BITJOIN,39)@5
    outRes_uid40_fxpToFPTest_q <= redist11_signX_uid6_fxpToFPTest_b_5_q & expRPostExc_uid39_fxpToFPTest_q & fracRPostExc_uid32_fxpToFPTest_q;

    -- xOut(GPOUT,4)@5
    q <= outRes_uid40_fxpToFPTest_q;

END normal;
