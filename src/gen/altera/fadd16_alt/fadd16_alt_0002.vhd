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

-- VHDL created from fadd16_alt_0002
-- VHDL created on Sun Mar  1 23:20:22 2026


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

entity fadd16_alt_0002 is
    port (
        a : in std_logic_vector(15 downto 0);  -- float16_m10
        b : in std_logic_vector(15 downto 0);  -- float16_m10
        q : out std_logic_vector(15 downto 0);  -- float16_m10
        clk : in std_logic;
        areset : in std_logic
    );
end fadd16_alt_0002;

architecture normal of fadd16_alt_0002 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expFracX_uid6_fpAddTest_b : STD_LOGIC_VECTOR (14 downto 0);
    signal expFracY_uid7_fpAddTest_b : STD_LOGIC_VECTOR (14 downto 0);
    signal xGTEy_uid8_fpAddTest_a : STD_LOGIC_VECTOR (16 downto 0);
    signal xGTEy_uid8_fpAddTest_b : STD_LOGIC_VECTOR (16 downto 0);
    signal xGTEy_uid8_fpAddTest_o : STD_LOGIC_VECTOR (16 downto 0);
    signal xGTEy_uid8_fpAddTest_n : STD_LOGIC_VECTOR (0 downto 0);
    signal fracY_uid9_fpAddTest_b : STD_LOGIC_VECTOR (9 downto 0);
    signal expY_uid10_fpAddTest_b : STD_LOGIC_VECTOR (4 downto 0);
    signal sigY_uid11_fpAddTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal ypn_uid12_fpAddTest_q : STD_LOGIC_VECTOR (15 downto 0);
    signal aSig_uid16_fpAddTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aSig_uid16_fpAddTest_q : STD_LOGIC_VECTOR (15 downto 0);
    signal bSig_uid17_fpAddTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal bSig_uid17_fpAddTest_q : STD_LOGIC_VECTOR (15 downto 0);
    signal cstAllOWE_uid18_fpAddTest_q : STD_LOGIC_VECTOR (4 downto 0);
    signal cstZeroWF_uid19_fpAddTest_q : STD_LOGIC_VECTOR (9 downto 0);
    signal cstAllZWE_uid20_fpAddTest_q : STD_LOGIC_VECTOR (4 downto 0);
    signal exp_aSig_uid21_fpAddTest_in : STD_LOGIC_VECTOR (14 downto 0);
    signal exp_aSig_uid21_fpAddTest_b : STD_LOGIC_VECTOR (4 downto 0);
    signal frac_aSig_uid22_fpAddTest_in : STD_LOGIC_VECTOR (9 downto 0);
    signal frac_aSig_uid22_fpAddTest_b : STD_LOGIC_VECTOR (9 downto 0);
    signal excZ_aSig_uid16_uid23_fpAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excZ_aSig_uid16_uid23_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid24_fpAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid24_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid25_fpAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid25_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid26_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_aSig_uid27_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_aSig_uid28_fpAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_aSig_uid28_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExpXIsMax_uid29_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal InvExpXIsZero_uid30_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_aSig_uid31_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal exp_bSig_uid35_fpAddTest_in : STD_LOGIC_VECTOR (14 downto 0);
    signal exp_bSig_uid35_fpAddTest_b : STD_LOGIC_VECTOR (4 downto 0);
    signal frac_bSig_uid36_fpAddTest_in : STD_LOGIC_VECTOR (9 downto 0);
    signal frac_bSig_uid36_fpAddTest_b : STD_LOGIC_VECTOR (9 downto 0);
    signal excZ_bSig_uid17_uid37_fpAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excZ_bSig_uid17_uid37_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid38_fpAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid38_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid39_fpAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid39_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid40_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_bSig_uid41_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_bSig_uid42_fpAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_bSig_uid42_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExpXIsMax_uid43_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal InvExpXIsZero_uid44_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_bSig_uid45_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sigA_uid50_fpAddTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal sigB_uid51_fpAddTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal effSub_uid52_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracBz_uid56_fpAddTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal fracBz_uid56_fpAddTest_q : STD_LOGIC_VECTOR (9 downto 0);
    signal oFracB_uid59_fpAddTest_q : STD_LOGIC_VECTOR (10 downto 0);
    signal expAmExpB_uid60_fpAddTest_a : STD_LOGIC_VECTOR (5 downto 0);
    signal expAmExpB_uid60_fpAddTest_b : STD_LOGIC_VECTOR (5 downto 0);
    signal expAmExpB_uid60_fpAddTest_o : STD_LOGIC_VECTOR (5 downto 0);
    signal expAmExpB_uid60_fpAddTest_q : STD_LOGIC_VECTOR (5 downto 0);
    signal oFracA_uid64_fpAddTest_q : STD_LOGIC_VECTOR (10 downto 0);
    signal oFracAE_uid65_fpAddTest_q : STD_LOGIC_VECTOR (13 downto 0);
    signal oFracBR_uid67_fpAddTest_q : STD_LOGIC_VECTOR (13 downto 0);
    signal oFracBREX_uid68_fpAddTest_b : STD_LOGIC_VECTOR (13 downto 0);
    signal oFracBREX_uid68_fpAddTest_q : STD_LOGIC_VECTOR (13 downto 0);
    signal oFracBREXC2_uid69_fpAddTest_a : STD_LOGIC_VECTOR (14 downto 0);
    signal oFracBREXC2_uid69_fpAddTest_b : STD_LOGIC_VECTOR (14 downto 0);
    signal oFracBREXC2_uid69_fpAddTest_o : STD_LOGIC_VECTOR (14 downto 0);
    signal oFracBREXC2_uid69_fpAddTest_q : STD_LOGIC_VECTOR (14 downto 0);
    signal oFracBREXC2_uid70_fpAddTest_in : STD_LOGIC_VECTOR (13 downto 0);
    signal oFracBREXC2_uid70_fpAddTest_b : STD_LOGIC_VECTOR (13 downto 0);
    signal fracAddResult_uid72_fpAddTest_a : STD_LOGIC_VECTOR (14 downto 0);
    signal fracAddResult_uid72_fpAddTest_b : STD_LOGIC_VECTOR (14 downto 0);
    signal fracAddResult_uid72_fpAddTest_o : STD_LOGIC_VECTOR (14 downto 0);
    signal fracAddResult_uid72_fpAddTest_q : STD_LOGIC_VECTOR (14 downto 0);
    signal fracAddResultNoSignExt_uid73_fpAddTest_in : STD_LOGIC_VECTOR (13 downto 0);
    signal fracAddResultNoSignExt_uid73_fpAddTest_b : STD_LOGIC_VECTOR (13 downto 0);
    signal cAmA_uid76_fpAddTest_q : STD_LOGIC_VECTOR (3 downto 0);
    signal aMinusA_uid77_fpAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal aMinusA_uid77_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expInc_uid78_fpAddTest_a : STD_LOGIC_VECTOR (5 downto 0);
    signal expInc_uid78_fpAddTest_b : STD_LOGIC_VECTOR (5 downto 0);
    signal expInc_uid78_fpAddTest_o : STD_LOGIC_VECTOR (5 downto 0);
    signal expInc_uid78_fpAddTest_q : STD_LOGIC_VECTOR (5 downto 0);
    signal expPostNorm_uid79_fpAddTest_a : STD_LOGIC_VECTOR (6 downto 0);
    signal expPostNorm_uid79_fpAddTest_b : STD_LOGIC_VECTOR (6 downto 0);
    signal expPostNorm_uid79_fpAddTest_o : STD_LOGIC_VECTOR (6 downto 0);
    signal expPostNorm_uid79_fpAddTest_q : STD_LOGIC_VECTOR (6 downto 0);
    signal fracPostNormRndRange_uid80_fpAddTest_in : STD_LOGIC_VECTOR (12 downto 0);
    signal fracPostNormRndRange_uid80_fpAddTest_b : STD_LOGIC_VECTOR (10 downto 0);
    signal expFracR_uid81_fpAddTest_q : STD_LOGIC_VECTOR (17 downto 0);
    signal wEP2AllOwE_uid82_fpAddTest_q : STD_LOGIC_VECTOR (6 downto 0);
    signal rndExp_uid83_fpAddTest_b : STD_LOGIC_VECTOR (6 downto 0);
    signal rOvf_uid84_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal rUdf_uid85_fpAddTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal fracRPreExc_uid86_fpAddTest_in : STD_LOGIC_VECTOR (10 downto 0);
    signal fracRPreExc_uid86_fpAddTest_b : STD_LOGIC_VECTOR (9 downto 0);
    signal expRPreExc_uid87_fpAddTest_in : STD_LOGIC_VECTOR (15 downto 0);
    signal expRPreExc_uid87_fpAddTest_b : STD_LOGIC_VECTOR (4 downto 0);
    signal regInputs_uid88_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRZeroVInC_uid89_fpAddTest_q : STD_LOGIC_VECTOR (4 downto 0);
    signal excRZero_uid90_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal rInfOvf_uid91_fpAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal rInfOvf_uid91_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRInfVInC_uid92_fpAddTest_q : STD_LOGIC_VECTOR (5 downto 0);
    signal excRInf_uid93_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRNaN2_uid94_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excAIBISub_uid95_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRNaN_uid96_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal concExc_uid97_fpAddTest_q : STD_LOGIC_VECTOR (2 downto 0);
    signal excREnc_uid98_fpAddTest_q : STD_LOGIC_VECTOR (1 downto 0);
    signal invAMinusA_uid99_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signRReg_uid100_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sigBBInf_uid101_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sigAAInf_uid102_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signRInf_uid103_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excAZBZSigASigB_uid104_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excBZARSigA_uid105_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signRZero_uid106_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signRInfRZRReg_uid107_fpAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal signRInfRZRReg_uid107_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExcRNaN_uid108_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signRPostExc_uid109_fpAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal signRPostExc_uid109_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal oneFracRPostExc2_uid110_fpAddTest_q : STD_LOGIC_VECTOR (9 downto 0);
    signal fracRPostExc_uid113_fpAddTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal fracRPostExc_uid113_fpAddTest_q : STD_LOGIC_VECTOR (9 downto 0);
    signal expRPostExc_uid117_fpAddTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal expRPostExc_uid117_fpAddTest_q : STD_LOGIC_VECTOR (4 downto 0);
    signal R_uid118_fpAddTest_q : STD_LOGIC_VECTOR (15 downto 0);
    signal zs_uid120_lzCountVal_uid74_fpAddTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal rVStage_uid121_lzCountVal_uid74_fpAddTest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal vCount_uid122_lzCountVal_uid74_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal mO_uid123_lzCountVal_uid74_fpAddTest_q : STD_LOGIC_VECTOR (1 downto 0);
    signal vStage_uid124_lzCountVal_uid74_fpAddTest_in : STD_LOGIC_VECTOR (5 downto 0);
    signal vStage_uid124_lzCountVal_uid74_fpAddTest_b : STD_LOGIC_VECTOR (5 downto 0);
    signal cStage_uid125_lzCountVal_uid74_fpAddTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal vStagei_uid127_lzCountVal_uid74_fpAddTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid127_lzCountVal_uid74_fpAddTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal zs_uid128_lzCountVal_uid74_fpAddTest_q : STD_LOGIC_VECTOR (3 downto 0);
    signal vCount_uid130_lzCountVal_uid74_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid133_lzCountVal_uid74_fpAddTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid133_lzCountVal_uid74_fpAddTest_q : STD_LOGIC_VECTOR (3 downto 0);
    signal zs_uid134_lzCountVal_uid74_fpAddTest_q : STD_LOGIC_VECTOR (1 downto 0);
    signal vCount_uid136_lzCountVal_uid74_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid139_lzCountVal_uid74_fpAddTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid139_lzCountVal_uid74_fpAddTest_q : STD_LOGIC_VECTOR (1 downto 0);
    signal rVStage_uid141_lzCountVal_uid74_fpAddTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal vCount_uid142_lzCountVal_uid74_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal r_uid143_lzCountVal_uid74_fpAddTest_q : STD_LOGIC_VECTOR (3 downto 0);
    signal xMSB_uid145_alignmentShifter_uid71_fpAddTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal shiftedOut_uid148_alignmentShifter_uid71_fpAddTest_a : STD_LOGIC_VECTOR (7 downto 0);
    signal shiftedOut_uid148_alignmentShifter_uid71_fpAddTest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal shiftedOut_uid148_alignmentShifter_uid71_fpAddTest_o : STD_LOGIC_VECTOR (7 downto 0);
    signal shiftedOut_uid148_alignmentShifter_uid71_fpAddTest_n : STD_LOGIC_VECTOR (0 downto 0);
    signal seMsb_to2_uid149_in : STD_LOGIC_VECTOR (1 downto 0);
    signal seMsb_to2_uid149_b : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage0Idx1Rng2_uid150_alignmentShifter_uid71_fpAddTest_b : STD_LOGIC_VECTOR (11 downto 0);
    signal rightShiftStage0Idx1_uid151_alignmentShifter_uid71_fpAddTest_q : STD_LOGIC_VECTOR (13 downto 0);
    signal seMsb_to4_uid152_in : STD_LOGIC_VECTOR (3 downto 0);
    signal seMsb_to4_uid152_b : STD_LOGIC_VECTOR (3 downto 0);
    signal rightShiftStage0Idx2Rng4_uid153_alignmentShifter_uid71_fpAddTest_b : STD_LOGIC_VECTOR (9 downto 0);
    signal rightShiftStage0Idx2_uid154_alignmentShifter_uid71_fpAddTest_q : STD_LOGIC_VECTOR (13 downto 0);
    signal seMsb_to6_uid155_in : STD_LOGIC_VECTOR (5 downto 0);
    signal seMsb_to6_uid155_b : STD_LOGIC_VECTOR (5 downto 0);
    signal rightShiftStage0Idx3Rng6_uid156_alignmentShifter_uid71_fpAddTest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal rightShiftStage0Idx3_uid157_alignmentShifter_uid71_fpAddTest_q : STD_LOGIC_VECTOR (13 downto 0);
    signal seMsb_to8_uid158_in : STD_LOGIC_VECTOR (7 downto 0);
    signal seMsb_to8_uid158_b : STD_LOGIC_VECTOR (7 downto 0);
    signal rightShiftStage0Idx4Rng8_uid159_alignmentShifter_uid71_fpAddTest_b : STD_LOGIC_VECTOR (5 downto 0);
    signal rightShiftStage0Idx4_uid160_alignmentShifter_uid71_fpAddTest_q : STD_LOGIC_VECTOR (13 downto 0);
    signal seMsb_to10_uid161_in : STD_LOGIC_VECTOR (9 downto 0);
    signal seMsb_to10_uid161_b : STD_LOGIC_VECTOR (9 downto 0);
    signal rightShiftStage0Idx5Rng10_uid162_alignmentShifter_uid71_fpAddTest_b : STD_LOGIC_VECTOR (3 downto 0);
    signal rightShiftStage0Idx5_uid163_alignmentShifter_uid71_fpAddTest_q : STD_LOGIC_VECTOR (13 downto 0);
    signal seMsb_to12_uid164_in : STD_LOGIC_VECTOR (11 downto 0);
    signal seMsb_to12_uid164_b : STD_LOGIC_VECTOR (11 downto 0);
    signal rightShiftStage0Idx6Rng12_uid165_alignmentShifter_uid71_fpAddTest_b : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage0Idx6_uid166_alignmentShifter_uid71_fpAddTest_q : STD_LOGIC_VECTOR (13 downto 0);
    signal stageIndexName_to14_uid167_in : STD_LOGIC_VECTOR (13 downto 0);
    signal stageIndexName_to14_uid167_b : STD_LOGIC_VECTOR (13 downto 0);
    signal rightShiftStage1Idx1Rng1_uid171_alignmentShifter_uid71_fpAddTest_b : STD_LOGIC_VECTOR (12 downto 0);
    signal rightShiftStage1Idx1_uid172_alignmentShifter_uid71_fpAddTest_q : STD_LOGIC_VECTOR (13 downto 0);
    signal rightShiftStage1_uid174_alignmentShifter_uid71_fpAddTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage1_uid174_alignmentShifter_uid71_fpAddTest_q : STD_LOGIC_VECTOR (13 downto 0);
    signal r_uid177_alignmentShifter_uid71_fpAddTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal r_uid177_alignmentShifter_uid71_fpAddTest_q : STD_LOGIC_VECTOR (13 downto 0);
    signal leftShiftStage0Idx1Rng2_uid182_fracPostNorm_uid75_fpAddTest_in : STD_LOGIC_VECTOR (11 downto 0);
    signal leftShiftStage0Idx1Rng2_uid182_fracPostNorm_uid75_fpAddTest_b : STD_LOGIC_VECTOR (11 downto 0);
    signal leftShiftStage0Idx1_uid183_fracPostNorm_uid75_fpAddTest_q : STD_LOGIC_VECTOR (13 downto 0);
    signal leftShiftStage0Idx2Rng4_uid185_fracPostNorm_uid75_fpAddTest_in : STD_LOGIC_VECTOR (9 downto 0);
    signal leftShiftStage0Idx2Rng4_uid185_fracPostNorm_uid75_fpAddTest_b : STD_LOGIC_VECTOR (9 downto 0);
    signal leftShiftStage0Idx2_uid186_fracPostNorm_uid75_fpAddTest_q : STD_LOGIC_VECTOR (13 downto 0);
    signal leftShiftStage0Idx3Pad6_uid187_fracPostNorm_uid75_fpAddTest_q : STD_LOGIC_VECTOR (5 downto 0);
    signal leftShiftStage0Idx3Rng6_uid188_fracPostNorm_uid75_fpAddTest_in : STD_LOGIC_VECTOR (7 downto 0);
    signal leftShiftStage0Idx3Rng6_uid188_fracPostNorm_uid75_fpAddTest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal leftShiftStage0Idx3_uid189_fracPostNorm_uid75_fpAddTest_q : STD_LOGIC_VECTOR (13 downto 0);
    signal leftShiftStage0Idx4_uid192_fracPostNorm_uid75_fpAddTest_q : STD_LOGIC_VECTOR (13 downto 0);
    signal leftShiftStage0Idx5Rng10_uid194_fracPostNorm_uid75_fpAddTest_in : STD_LOGIC_VECTOR (3 downto 0);
    signal leftShiftStage0Idx5Rng10_uid194_fracPostNorm_uid75_fpAddTest_b : STD_LOGIC_VECTOR (3 downto 0);
    signal leftShiftStage0Idx5_uid195_fracPostNorm_uid75_fpAddTest_q : STD_LOGIC_VECTOR (13 downto 0);
    signal leftShiftStage0Idx6Pad12_uid196_fracPostNorm_uid75_fpAddTest_q : STD_LOGIC_VECTOR (11 downto 0);
    signal leftShiftStage0Idx6Rng12_uid197_fracPostNorm_uid75_fpAddTest_in : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStage0Idx6Rng12_uid197_fracPostNorm_uid75_fpAddTest_b : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStage0Idx6_uid198_fracPostNorm_uid75_fpAddTest_q : STD_LOGIC_VECTOR (13 downto 0);
    signal leftShiftStage0Idx7_uid199_fracPostNorm_uid75_fpAddTest_q : STD_LOGIC_VECTOR (13 downto 0);
    signal leftShiftStage1Idx1Rng1_uid203_fracPostNorm_uid75_fpAddTest_in : STD_LOGIC_VECTOR (12 downto 0);
    signal leftShiftStage1Idx1Rng1_uid203_fracPostNorm_uid75_fpAddTest_b : STD_LOGIC_VECTOR (12 downto 0);
    signal leftShiftStage1Idx1_uid204_fracPostNorm_uid75_fpAddTest_q : STD_LOGIC_VECTOR (13 downto 0);
    signal leftShiftStage1_uid206_fracPostNorm_uid75_fpAddTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage1_uid206_fracPostNorm_uid75_fpAddTest_q : STD_LOGIC_VECTOR (13 downto 0);
    signal rightShiftStage0_uid170_alignmentShifter_uid71_fpAddTest_msplit_0_s : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage0_uid170_alignmentShifter_uid71_fpAddTest_msplit_0_q : STD_LOGIC_VECTOR (13 downto 0);
    signal rightShiftStage0_uid170_alignmentShifter_uid71_fpAddTest_msplit_1_s : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage0_uid170_alignmentShifter_uid71_fpAddTest_msplit_1_q : STD_LOGIC_VECTOR (13 downto 0);
    signal rightShiftStage0_uid170_alignmentShifter_uid71_fpAddTest_mfinal_s : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage0_uid170_alignmentShifter_uid71_fpAddTest_mfinal_q : STD_LOGIC_VECTOR (13 downto 0);
    signal leftShiftStage0_uid201_fracPostNorm_uid75_fpAddTest_msplit_0_s : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStage0_uid201_fracPostNorm_uid75_fpAddTest_msplit_0_q : STD_LOGIC_VECTOR (13 downto 0);
    signal leftShiftStage0_uid201_fracPostNorm_uid75_fpAddTest_msplit_1_s : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStage0_uid201_fracPostNorm_uid75_fpAddTest_msplit_1_q : STD_LOGIC_VECTOR (13 downto 0);
    signal leftShiftStage0_uid201_fracPostNorm_uid75_fpAddTest_mfinal_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage0_uid201_fracPostNorm_uid75_fpAddTest_mfinal_q : STD_LOGIC_VECTOR (13 downto 0);
    signal rightShiftStageSel3Dto1_uid169_alignmentShifter_uid71_fpAddTest_merged_bit_select_in : STD_LOGIC_VECTOR (3 downto 0);
    signal rightShiftStageSel3Dto1_uid169_alignmentShifter_uid71_fpAddTest_merged_bit_select_b : STD_LOGIC_VECTOR (2 downto 0);
    signal rightShiftStageSel3Dto1_uid169_alignmentShifter_uid71_fpAddTest_merged_bit_select_c : STD_LOGIC_VECTOR (0 downto 0);
    signal rVStage_uid129_lzCountVal_uid74_fpAddTest_merged_bit_select_b : STD_LOGIC_VECTOR (3 downto 0);
    signal rVStage_uid129_lzCountVal_uid74_fpAddTest_merged_bit_select_c : STD_LOGIC_VECTOR (3 downto 0);
    signal rVStage_uid135_lzCountVal_uid74_fpAddTest_merged_bit_select_b : STD_LOGIC_VECTOR (1 downto 0);
    signal rVStage_uid135_lzCountVal_uid74_fpAddTest_merged_bit_select_c : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStageSel3Dto1_uid200_fracPostNorm_uid75_fpAddTest_merged_bit_select_b : STD_LOGIC_VECTOR (2 downto 0);
    signal leftShiftStageSel3Dto1_uid200_fracPostNorm_uid75_fpAddTest_merged_bit_select_c : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage0_uid170_alignmentShifter_uid71_fpAddTest_selLSBs_merged_bit_select_b : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage0_uid170_alignmentShifter_uid71_fpAddTest_selLSBs_merged_bit_select_c : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage0_uid201_fracPostNorm_uid75_fpAddTest_selLSBs_merged_bit_select_b : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStage0_uid201_fracPostNorm_uid75_fpAddTest_selLSBs_merged_bit_select_c : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_leftShiftStageSel3Dto1_uid200_fracPostNorm_uid75_fpAddTest_merged_bit_select_c_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_rightShiftStageSel3Dto1_uid169_alignmentShifter_uid71_fpAddTest_merged_bit_select_b_1_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist2_rightShiftStageSel3Dto1_uid169_alignmentShifter_uid71_fpAddTest_merged_bit_select_c_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_vCount_uid130_lzCountVal_uid74_fpAddTest_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_vStage_uid124_lzCountVal_uid74_fpAddTest_b_1_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist5_vCount_uid122_lzCountVal_uid74_fpAddTest_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_expRPreExc_uid87_fpAddTest_b_2_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist7_fracRPreExc_uid86_fpAddTest_b_2_q : STD_LOGIC_VECTOR (9 downto 0);
    signal redist8_fracAddResultNoSignExt_uid73_fpAddTest_b_1_q : STD_LOGIC_VECTOR (13 downto 0);
    signal redist9_fracAddResultNoSignExt_uid73_fpAddTest_b_2_q : STD_LOGIC_VECTOR (13 downto 0);
    signal redist10_oFracBREXC2_uid70_fpAddTest_b_1_q : STD_LOGIC_VECTOR (13 downto 0);
    signal redist11_effSub_uid52_fpAddTest_q_6_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist12_sigB_uid51_fpAddTest_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist13_sigB_uid51_fpAddTest_b_6_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist14_sigA_uid50_fpAddTest_b_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist15_sigA_uid50_fpAddTest_b_7_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist16_InvExpXIsZero_uid44_fpAddTest_q_5_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist17_excI_bSig_uid41_fpAddTest_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist18_fracXIsZero_uid39_fpAddTest_q_5_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist19_expXIsMax_uid38_fpAddTest_q_5_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist20_excZ_bSig_uid17_uid37_fpAddTest_q_6_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist21_frac_bSig_uid36_fpAddTest_b_1_q : STD_LOGIC_VECTOR (9 downto 0);
    signal redist22_exp_bSig_uid35_fpAddTest_b_1_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist23_excI_aSig_uid27_fpAddTest_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist24_fracXIsZero_uid25_fpAddTest_q_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist25_frac_aSig_uid22_fpAddTest_b_4_q : STD_LOGIC_VECTOR (9 downto 0);
    signal redist26_exp_aSig_uid21_fpAddTest_b_2_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist27_exp_aSig_uid21_fpAddTest_b_6_q : STD_LOGIC_VECTOR (4 downto 0);

begin


    -- cAmA_uid76_fpAddTest(CONSTANT,75)
    cAmA_uid76_fpAddTest_q <= "1110";

    -- zs_uid120_lzCountVal_uid74_fpAddTest(CONSTANT,119)
    zs_uid120_lzCountVal_uid74_fpAddTest_q <= "00000000";

    -- sigY_uid11_fpAddTest(BITSELECT,10)@0
    sigY_uid11_fpAddTest_b <= STD_LOGIC_VECTOR(b(15 downto 15));

    -- expY_uid10_fpAddTest(BITSELECT,9)@0
    expY_uid10_fpAddTest_b <= b(14 downto 10);

    -- fracY_uid9_fpAddTest(BITSELECT,8)@0
    fracY_uid9_fpAddTest_b <= b(9 downto 0);

    -- ypn_uid12_fpAddTest(BITJOIN,11)@0
    ypn_uid12_fpAddTest_q <= sigY_uid11_fpAddTest_b & expY_uid10_fpAddTest_b & fracY_uid9_fpAddTest_b;

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- expFracY_uid7_fpAddTest(BITSELECT,6)@0
    expFracY_uid7_fpAddTest_b <= b(14 downto 0);

    -- expFracX_uid6_fpAddTest(BITSELECT,5)@0
    expFracX_uid6_fpAddTest_b <= a(14 downto 0);

    -- xGTEy_uid8_fpAddTest(COMPARE,7)@0
    xGTEy_uid8_fpAddTest_a <= STD_LOGIC_VECTOR("00" & expFracX_uid6_fpAddTest_b);
    xGTEy_uid8_fpAddTest_b <= STD_LOGIC_VECTOR("00" & expFracY_uid7_fpAddTest_b);
    xGTEy_uid8_fpAddTest_o <= STD_LOGIC_VECTOR(UNSIGNED(xGTEy_uid8_fpAddTest_a) - UNSIGNED(xGTEy_uid8_fpAddTest_b));
    xGTEy_uid8_fpAddTest_n(0) <= not (xGTEy_uid8_fpAddTest_o(16));

    -- bSig_uid17_fpAddTest(MUX,16)@0 + 1
    bSig_uid17_fpAddTest_s <= xGTEy_uid8_fpAddTest_n;
    bSig_uid17_fpAddTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            bSig_uid17_fpAddTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (bSig_uid17_fpAddTest_s) IS
                WHEN "0" => bSig_uid17_fpAddTest_q <= a;
                WHEN "1" => bSig_uid17_fpAddTest_q <= ypn_uid12_fpAddTest_q;
                WHEN OTHERS => bSig_uid17_fpAddTest_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- sigB_uid51_fpAddTest(BITSELECT,50)@1
    sigB_uid51_fpAddTest_b <= STD_LOGIC_VECTOR(bSig_uid17_fpAddTest_q(15 downto 15));

    -- redist12_sigB_uid51_fpAddTest_b_1(DELAY,235)
    redist12_sigB_uid51_fpAddTest_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => sigB_uid51_fpAddTest_b, xout => redist12_sigB_uid51_fpAddTest_b_1_q, clk => clk, aclr => areset );

    -- aSig_uid16_fpAddTest(MUX,15)@0
    aSig_uid16_fpAddTest_s <= xGTEy_uid8_fpAddTest_n;
    aSig_uid16_fpAddTest_combproc: PROCESS (aSig_uid16_fpAddTest_s, ypn_uid12_fpAddTest_q, a)
    BEGIN
        CASE (aSig_uid16_fpAddTest_s) IS
            WHEN "0" => aSig_uid16_fpAddTest_q <= ypn_uid12_fpAddTest_q;
            WHEN "1" => aSig_uid16_fpAddTest_q <= a;
            WHEN OTHERS => aSig_uid16_fpAddTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- sigA_uid50_fpAddTest(BITSELECT,49)@0
    sigA_uid50_fpAddTest_b <= STD_LOGIC_VECTOR(aSig_uid16_fpAddTest_q(15 downto 15));

    -- redist14_sigA_uid50_fpAddTest_b_2(DELAY,237)
    redist14_sigA_uid50_fpAddTest_b_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => sigA_uid50_fpAddTest_b, xout => redist14_sigA_uid50_fpAddTest_b_2_q, clk => clk, aclr => areset );

    -- effSub_uid52_fpAddTest(LOGICAL,51)@2
    effSub_uid52_fpAddTest_q <= redist14_sigA_uid50_fpAddTest_b_2_q xor redist12_sigB_uid51_fpAddTest_b_1_q;

    -- cstAllZWE_uid20_fpAddTest(CONSTANT,19)
    cstAllZWE_uid20_fpAddTest_q <= "00000";

    -- exp_bSig_uid35_fpAddTest(BITSELECT,34)@1
    exp_bSig_uid35_fpAddTest_in <= bSig_uid17_fpAddTest_q(14 downto 0);
    exp_bSig_uid35_fpAddTest_b <= exp_bSig_uid35_fpAddTest_in(14 downto 10);

    -- excZ_bSig_uid17_uid37_fpAddTest(LOGICAL,36)@1 + 1
    excZ_bSig_uid17_uid37_fpAddTest_qi <= "1" WHEN exp_bSig_uid35_fpAddTest_b = cstAllZWE_uid20_fpAddTest_q ELSE "0";
    excZ_bSig_uid17_uid37_fpAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excZ_bSig_uid17_uid37_fpAddTest_qi, xout => excZ_bSig_uid17_uid37_fpAddTest_q, clk => clk, aclr => areset );

    -- InvExpXIsZero_uid44_fpAddTest(LOGICAL,43)@2
    InvExpXIsZero_uid44_fpAddTest_q <= not (excZ_bSig_uid17_uid37_fpAddTest_q);

    -- cstZeroWF_uid19_fpAddTest(CONSTANT,18)
    cstZeroWF_uid19_fpAddTest_q <= "0000000000";

    -- frac_bSig_uid36_fpAddTest(BITSELECT,35)@1
    frac_bSig_uid36_fpAddTest_in <= bSig_uid17_fpAddTest_q(9 downto 0);
    frac_bSig_uid36_fpAddTest_b <= frac_bSig_uid36_fpAddTest_in(9 downto 0);

    -- redist21_frac_bSig_uid36_fpAddTest_b_1(DELAY,244)
    redist21_frac_bSig_uid36_fpAddTest_b_1 : dspba_delay
    GENERIC MAP ( width => 10, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => frac_bSig_uid36_fpAddTest_b, xout => redist21_frac_bSig_uid36_fpAddTest_b_1_q, clk => clk, aclr => areset );

    -- fracBz_uid56_fpAddTest(MUX,55)@2
    fracBz_uid56_fpAddTest_s <= excZ_bSig_uid17_uid37_fpAddTest_q;
    fracBz_uid56_fpAddTest_combproc: PROCESS (fracBz_uid56_fpAddTest_s, redist21_frac_bSig_uid36_fpAddTest_b_1_q, cstZeroWF_uid19_fpAddTest_q)
    BEGIN
        CASE (fracBz_uid56_fpAddTest_s) IS
            WHEN "0" => fracBz_uid56_fpAddTest_q <= redist21_frac_bSig_uid36_fpAddTest_b_1_q;
            WHEN "1" => fracBz_uid56_fpAddTest_q <= cstZeroWF_uid19_fpAddTest_q;
            WHEN OTHERS => fracBz_uid56_fpAddTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- oFracB_uid59_fpAddTest(BITJOIN,58)@2
    oFracB_uid59_fpAddTest_q <= InvExpXIsZero_uid44_fpAddTest_q & fracBz_uid56_fpAddTest_q;

    -- oFracBR_uid67_fpAddTest(BITJOIN,66)@2
    oFracBR_uid67_fpAddTest_q <= GND_q & oFracB_uid59_fpAddTest_q & GND_q & GND_q;

    -- oFracBREX_uid68_fpAddTest(LOGICAL,67)@2
    oFracBREX_uid68_fpAddTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((13 downto 1 => effSub_uid52_fpAddTest_q(0)) & effSub_uid52_fpAddTest_q));
    oFracBREX_uid68_fpAddTest_q <= oFracBR_uid67_fpAddTest_q xor oFracBREX_uid68_fpAddTest_b;

    -- oFracBREXC2_uid69_fpAddTest(ADD,68)@2
    oFracBREXC2_uid69_fpAddTest_a <= STD_LOGIC_VECTOR("0" & oFracBREX_uid68_fpAddTest_q);
    oFracBREXC2_uid69_fpAddTest_b <= STD_LOGIC_VECTOR("00000000000000" & effSub_uid52_fpAddTest_q);
    oFracBREXC2_uid69_fpAddTest_o <= STD_LOGIC_VECTOR(UNSIGNED(oFracBREXC2_uid69_fpAddTest_a) + UNSIGNED(oFracBREXC2_uid69_fpAddTest_b));
    oFracBREXC2_uid69_fpAddTest_q <= oFracBREXC2_uid69_fpAddTest_o(14 downto 0);

    -- oFracBREXC2_uid70_fpAddTest(BITSELECT,69)@2
    oFracBREXC2_uid70_fpAddTest_in <= STD_LOGIC_VECTOR(oFracBREXC2_uid69_fpAddTest_q(13 downto 0));
    oFracBREXC2_uid70_fpAddTest_b <= STD_LOGIC_VECTOR(oFracBREXC2_uid70_fpAddTest_in(13 downto 0));

    -- redist10_oFracBREXC2_uid70_fpAddTest_b_1(DELAY,233)
    redist10_oFracBREXC2_uid70_fpAddTest_b_1 : dspba_delay
    GENERIC MAP ( width => 14, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => oFracBREXC2_uid70_fpAddTest_b, xout => redist10_oFracBREXC2_uid70_fpAddTest_b_1_q, clk => clk, aclr => areset );

    -- xMSB_uid145_alignmentShifter_uid71_fpAddTest(BITSELECT,144)@3
    xMSB_uid145_alignmentShifter_uid71_fpAddTest_b <= STD_LOGIC_VECTOR(redist10_oFracBREXC2_uid70_fpAddTest_b_1_q(13 downto 13));

    -- stageIndexName_to14_uid167(BITSELECT,166)@3
    stageIndexName_to14_uid167_in <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((13 downto 1 => xMSB_uid145_alignmentShifter_uid71_fpAddTest_b(0)) & xMSB_uid145_alignmentShifter_uid71_fpAddTest_b));
    stageIndexName_to14_uid167_b <= STD_LOGIC_VECTOR(stageIndexName_to14_uid167_in(13 downto 0));

    -- rightShiftStage1Idx1Rng1_uid171_alignmentShifter_uid71_fpAddTest(BITSELECT,170)@3
    rightShiftStage1Idx1Rng1_uid171_alignmentShifter_uid71_fpAddTest_b <= rightShiftStage0_uid170_alignmentShifter_uid71_fpAddTest_mfinal_q(13 downto 1);

    -- rightShiftStage1Idx1_uid172_alignmentShifter_uid71_fpAddTest(BITJOIN,171)@3
    rightShiftStage1Idx1_uid172_alignmentShifter_uid71_fpAddTest_q <= xMSB_uid145_alignmentShifter_uid71_fpAddTest_b & rightShiftStage1Idx1Rng1_uid171_alignmentShifter_uid71_fpAddTest_b;

    -- seMsb_to12_uid164(BITSELECT,163)@3
    seMsb_to12_uid164_in <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((11 downto 1 => xMSB_uid145_alignmentShifter_uid71_fpAddTest_b(0)) & xMSB_uid145_alignmentShifter_uid71_fpAddTest_b));
    seMsb_to12_uid164_b <= STD_LOGIC_VECTOR(seMsb_to12_uid164_in(11 downto 0));

    -- rightShiftStage0Idx6Rng12_uid165_alignmentShifter_uid71_fpAddTest(BITSELECT,164)@3
    rightShiftStage0Idx6Rng12_uid165_alignmentShifter_uid71_fpAddTest_b <= redist10_oFracBREXC2_uid70_fpAddTest_b_1_q(13 downto 12);

    -- rightShiftStage0Idx6_uid166_alignmentShifter_uid71_fpAddTest(BITJOIN,165)@3
    rightShiftStage0Idx6_uid166_alignmentShifter_uid71_fpAddTest_q <= seMsb_to12_uid164_b & rightShiftStage0Idx6Rng12_uid165_alignmentShifter_uid71_fpAddTest_b;

    -- seMsb_to10_uid161(BITSELECT,160)@3
    seMsb_to10_uid161_in <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((9 downto 1 => xMSB_uid145_alignmentShifter_uid71_fpAddTest_b(0)) & xMSB_uid145_alignmentShifter_uid71_fpAddTest_b));
    seMsb_to10_uid161_b <= STD_LOGIC_VECTOR(seMsb_to10_uid161_in(9 downto 0));

    -- rightShiftStage0Idx5Rng10_uid162_alignmentShifter_uid71_fpAddTest(BITSELECT,161)@3
    rightShiftStage0Idx5Rng10_uid162_alignmentShifter_uid71_fpAddTest_b <= redist10_oFracBREXC2_uid70_fpAddTest_b_1_q(13 downto 10);

    -- rightShiftStage0Idx5_uid163_alignmentShifter_uid71_fpAddTest(BITJOIN,162)@3
    rightShiftStage0Idx5_uid163_alignmentShifter_uid71_fpAddTest_q <= seMsb_to10_uid161_b & rightShiftStage0Idx5Rng10_uid162_alignmentShifter_uid71_fpAddTest_b;

    -- seMsb_to8_uid158(BITSELECT,157)@3
    seMsb_to8_uid158_in <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((7 downto 1 => xMSB_uid145_alignmentShifter_uid71_fpAddTest_b(0)) & xMSB_uid145_alignmentShifter_uid71_fpAddTest_b));
    seMsb_to8_uid158_b <= STD_LOGIC_VECTOR(seMsb_to8_uid158_in(7 downto 0));

    -- rightShiftStage0Idx4Rng8_uid159_alignmentShifter_uid71_fpAddTest(BITSELECT,158)@3
    rightShiftStage0Idx4Rng8_uid159_alignmentShifter_uid71_fpAddTest_b <= redist10_oFracBREXC2_uid70_fpAddTest_b_1_q(13 downto 8);

    -- rightShiftStage0Idx4_uid160_alignmentShifter_uid71_fpAddTest(BITJOIN,159)@3
    rightShiftStage0Idx4_uid160_alignmentShifter_uid71_fpAddTest_q <= seMsb_to8_uid158_b & rightShiftStage0Idx4Rng8_uid159_alignmentShifter_uid71_fpAddTest_b;

    -- rightShiftStage0_uid170_alignmentShifter_uid71_fpAddTest_msplit_1(MUX,210)@3
    rightShiftStage0_uid170_alignmentShifter_uid71_fpAddTest_msplit_1_s <= rightShiftStage0_uid170_alignmentShifter_uid71_fpAddTest_selLSBs_merged_bit_select_b;
    rightShiftStage0_uid170_alignmentShifter_uid71_fpAddTest_msplit_1_combproc: PROCESS (rightShiftStage0_uid170_alignmentShifter_uid71_fpAddTest_msplit_1_s, rightShiftStage0Idx4_uid160_alignmentShifter_uid71_fpAddTest_q, rightShiftStage0Idx5_uid163_alignmentShifter_uid71_fpAddTest_q, rightShiftStage0Idx6_uid166_alignmentShifter_uid71_fpAddTest_q, stageIndexName_to14_uid167_b)
    BEGIN
        CASE (rightShiftStage0_uid170_alignmentShifter_uid71_fpAddTest_msplit_1_s) IS
            WHEN "00" => rightShiftStage0_uid170_alignmentShifter_uid71_fpAddTest_msplit_1_q <= rightShiftStage0Idx4_uid160_alignmentShifter_uid71_fpAddTest_q;
            WHEN "01" => rightShiftStage0_uid170_alignmentShifter_uid71_fpAddTest_msplit_1_q <= rightShiftStage0Idx5_uid163_alignmentShifter_uid71_fpAddTest_q;
            WHEN "10" => rightShiftStage0_uid170_alignmentShifter_uid71_fpAddTest_msplit_1_q <= rightShiftStage0Idx6_uid166_alignmentShifter_uid71_fpAddTest_q;
            WHEN "11" => rightShiftStage0_uid170_alignmentShifter_uid71_fpAddTest_msplit_1_q <= stageIndexName_to14_uid167_b;
            WHEN OTHERS => rightShiftStage0_uid170_alignmentShifter_uid71_fpAddTest_msplit_1_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- seMsb_to6_uid155(BITSELECT,154)@3
    seMsb_to6_uid155_in <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((5 downto 1 => xMSB_uid145_alignmentShifter_uid71_fpAddTest_b(0)) & xMSB_uid145_alignmentShifter_uid71_fpAddTest_b));
    seMsb_to6_uid155_b <= STD_LOGIC_VECTOR(seMsb_to6_uid155_in(5 downto 0));

    -- rightShiftStage0Idx3Rng6_uid156_alignmentShifter_uid71_fpAddTest(BITSELECT,155)@3
    rightShiftStage0Idx3Rng6_uid156_alignmentShifter_uid71_fpAddTest_b <= redist10_oFracBREXC2_uid70_fpAddTest_b_1_q(13 downto 6);

    -- rightShiftStage0Idx3_uid157_alignmentShifter_uid71_fpAddTest(BITJOIN,156)@3
    rightShiftStage0Idx3_uid157_alignmentShifter_uid71_fpAddTest_q <= seMsb_to6_uid155_b & rightShiftStage0Idx3Rng6_uid156_alignmentShifter_uid71_fpAddTest_b;

    -- seMsb_to4_uid152(BITSELECT,151)@3
    seMsb_to4_uid152_in <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((3 downto 1 => xMSB_uid145_alignmentShifter_uid71_fpAddTest_b(0)) & xMSB_uid145_alignmentShifter_uid71_fpAddTest_b));
    seMsb_to4_uid152_b <= STD_LOGIC_VECTOR(seMsb_to4_uid152_in(3 downto 0));

    -- rightShiftStage0Idx2Rng4_uid153_alignmentShifter_uid71_fpAddTest(BITSELECT,152)@3
    rightShiftStage0Idx2Rng4_uid153_alignmentShifter_uid71_fpAddTest_b <= redist10_oFracBREXC2_uid70_fpAddTest_b_1_q(13 downto 4);

    -- rightShiftStage0Idx2_uid154_alignmentShifter_uid71_fpAddTest(BITJOIN,153)@3
    rightShiftStage0Idx2_uid154_alignmentShifter_uid71_fpAddTest_q <= seMsb_to4_uid152_b & rightShiftStage0Idx2Rng4_uid153_alignmentShifter_uid71_fpAddTest_b;

    -- seMsb_to2_uid149(BITSELECT,148)@3
    seMsb_to2_uid149_in <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((1 downto 1 => xMSB_uid145_alignmentShifter_uid71_fpAddTest_b(0)) & xMSB_uid145_alignmentShifter_uid71_fpAddTest_b));
    seMsb_to2_uid149_b <= STD_LOGIC_VECTOR(seMsb_to2_uid149_in(1 downto 0));

    -- rightShiftStage0Idx1Rng2_uid150_alignmentShifter_uid71_fpAddTest(BITSELECT,149)@3
    rightShiftStage0Idx1Rng2_uid150_alignmentShifter_uid71_fpAddTest_b <= redist10_oFracBREXC2_uid70_fpAddTest_b_1_q(13 downto 2);

    -- rightShiftStage0Idx1_uid151_alignmentShifter_uid71_fpAddTest(BITJOIN,150)@3
    rightShiftStage0Idx1_uid151_alignmentShifter_uid71_fpAddTest_q <= seMsb_to2_uid149_b & rightShiftStage0Idx1Rng2_uid150_alignmentShifter_uid71_fpAddTest_b;

    -- rightShiftStage0_uid170_alignmentShifter_uid71_fpAddTest_msplit_0(MUX,209)@3
    rightShiftStage0_uid170_alignmentShifter_uid71_fpAddTest_msplit_0_s <= rightShiftStage0_uid170_alignmentShifter_uid71_fpAddTest_selLSBs_merged_bit_select_b;
    rightShiftStage0_uid170_alignmentShifter_uid71_fpAddTest_msplit_0_combproc: PROCESS (rightShiftStage0_uid170_alignmentShifter_uid71_fpAddTest_msplit_0_s, redist10_oFracBREXC2_uid70_fpAddTest_b_1_q, rightShiftStage0Idx1_uid151_alignmentShifter_uid71_fpAddTest_q, rightShiftStage0Idx2_uid154_alignmentShifter_uid71_fpAddTest_q, rightShiftStage0Idx3_uid157_alignmentShifter_uid71_fpAddTest_q)
    BEGIN
        CASE (rightShiftStage0_uid170_alignmentShifter_uid71_fpAddTest_msplit_0_s) IS
            WHEN "00" => rightShiftStage0_uid170_alignmentShifter_uid71_fpAddTest_msplit_0_q <= redist10_oFracBREXC2_uid70_fpAddTest_b_1_q;
            WHEN "01" => rightShiftStage0_uid170_alignmentShifter_uid71_fpAddTest_msplit_0_q <= rightShiftStage0Idx1_uid151_alignmentShifter_uid71_fpAddTest_q;
            WHEN "10" => rightShiftStage0_uid170_alignmentShifter_uid71_fpAddTest_msplit_0_q <= rightShiftStage0Idx2_uid154_alignmentShifter_uid71_fpAddTest_q;
            WHEN "11" => rightShiftStage0_uid170_alignmentShifter_uid71_fpAddTest_msplit_0_q <= rightShiftStage0Idx3_uid157_alignmentShifter_uid71_fpAddTest_q;
            WHEN OTHERS => rightShiftStage0_uid170_alignmentShifter_uid71_fpAddTest_msplit_0_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- redist22_exp_bSig_uid35_fpAddTest_b_1(DELAY,245)
    redist22_exp_bSig_uid35_fpAddTest_b_1 : dspba_delay
    GENERIC MAP ( width => 5, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => exp_bSig_uid35_fpAddTest_b, xout => redist22_exp_bSig_uid35_fpAddTest_b_1_q, clk => clk, aclr => areset );

    -- exp_aSig_uid21_fpAddTest(BITSELECT,20)@0
    exp_aSig_uid21_fpAddTest_in <= aSig_uid16_fpAddTest_q(14 downto 0);
    exp_aSig_uid21_fpAddTest_b <= exp_aSig_uid21_fpAddTest_in(14 downto 10);

    -- redist26_exp_aSig_uid21_fpAddTest_b_2(DELAY,249)
    redist26_exp_aSig_uid21_fpAddTest_b_2 : dspba_delay
    GENERIC MAP ( width => 5, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => exp_aSig_uid21_fpAddTest_b, xout => redist26_exp_aSig_uid21_fpAddTest_b_2_q, clk => clk, aclr => areset );

    -- expAmExpB_uid60_fpAddTest(SUB,59)@2
    expAmExpB_uid60_fpAddTest_a <= STD_LOGIC_VECTOR("0" & redist26_exp_aSig_uid21_fpAddTest_b_2_q);
    expAmExpB_uid60_fpAddTest_b <= STD_LOGIC_VECTOR("0" & redist22_exp_bSig_uid35_fpAddTest_b_1_q);
    expAmExpB_uid60_fpAddTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expAmExpB_uid60_fpAddTest_a) - UNSIGNED(expAmExpB_uid60_fpAddTest_b));
    expAmExpB_uid60_fpAddTest_q <= expAmExpB_uid60_fpAddTest_o(5 downto 0);

    -- rightShiftStageSel3Dto1_uid169_alignmentShifter_uid71_fpAddTest_merged_bit_select(BITSELECT,217)@2
    rightShiftStageSel3Dto1_uid169_alignmentShifter_uid71_fpAddTest_merged_bit_select_in <= expAmExpB_uid60_fpAddTest_q(3 downto 0);
    rightShiftStageSel3Dto1_uid169_alignmentShifter_uid71_fpAddTest_merged_bit_select_b <= rightShiftStageSel3Dto1_uid169_alignmentShifter_uid71_fpAddTest_merged_bit_select_in(3 downto 1);
    rightShiftStageSel3Dto1_uid169_alignmentShifter_uid71_fpAddTest_merged_bit_select_c <= rightShiftStageSel3Dto1_uid169_alignmentShifter_uid71_fpAddTest_merged_bit_select_in(0 downto 0);

    -- redist1_rightShiftStageSel3Dto1_uid169_alignmentShifter_uid71_fpAddTest_merged_bit_select_b_1(DELAY,224)
    redist1_rightShiftStageSel3Dto1_uid169_alignmentShifter_uid71_fpAddTest_merged_bit_select_b_1 : dspba_delay
    GENERIC MAP ( width => 3, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => rightShiftStageSel3Dto1_uid169_alignmentShifter_uid71_fpAddTest_merged_bit_select_b, xout => redist1_rightShiftStageSel3Dto1_uid169_alignmentShifter_uid71_fpAddTest_merged_bit_select_b_1_q, clk => clk, aclr => areset );

    -- rightShiftStage0_uid170_alignmentShifter_uid71_fpAddTest_selLSBs_merged_bit_select(BITSELECT,221)@3
    rightShiftStage0_uid170_alignmentShifter_uid71_fpAddTest_selLSBs_merged_bit_select_b <= redist1_rightShiftStageSel3Dto1_uid169_alignmentShifter_uid71_fpAddTest_merged_bit_select_b_1_q(1 downto 0);
    rightShiftStage0_uid170_alignmentShifter_uid71_fpAddTest_selLSBs_merged_bit_select_c <= redist1_rightShiftStageSel3Dto1_uid169_alignmentShifter_uid71_fpAddTest_merged_bit_select_b_1_q(2 downto 2);

    -- rightShiftStage0_uid170_alignmentShifter_uid71_fpAddTest_mfinal(MUX,211)@3
    rightShiftStage0_uid170_alignmentShifter_uid71_fpAddTest_mfinal_s <= rightShiftStage0_uid170_alignmentShifter_uid71_fpAddTest_selLSBs_merged_bit_select_c;
    rightShiftStage0_uid170_alignmentShifter_uid71_fpAddTest_mfinal_combproc: PROCESS (rightShiftStage0_uid170_alignmentShifter_uid71_fpAddTest_mfinal_s, rightShiftStage0_uid170_alignmentShifter_uid71_fpAddTest_msplit_0_q, rightShiftStage0_uid170_alignmentShifter_uid71_fpAddTest_msplit_1_q)
    BEGIN
        CASE (rightShiftStage0_uid170_alignmentShifter_uid71_fpAddTest_mfinal_s) IS
            WHEN "0" => rightShiftStage0_uid170_alignmentShifter_uid71_fpAddTest_mfinal_q <= rightShiftStage0_uid170_alignmentShifter_uid71_fpAddTest_msplit_0_q;
            WHEN "1" => rightShiftStage0_uid170_alignmentShifter_uid71_fpAddTest_mfinal_q <= rightShiftStage0_uid170_alignmentShifter_uid71_fpAddTest_msplit_1_q;
            WHEN OTHERS => rightShiftStage0_uid170_alignmentShifter_uid71_fpAddTest_mfinal_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- redist2_rightShiftStageSel3Dto1_uid169_alignmentShifter_uid71_fpAddTest_merged_bit_select_c_1(DELAY,225)
    redist2_rightShiftStageSel3Dto1_uid169_alignmentShifter_uid71_fpAddTest_merged_bit_select_c_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => rightShiftStageSel3Dto1_uid169_alignmentShifter_uid71_fpAddTest_merged_bit_select_c, xout => redist2_rightShiftStageSel3Dto1_uid169_alignmentShifter_uid71_fpAddTest_merged_bit_select_c_1_q, clk => clk, aclr => areset );

    -- rightShiftStage1_uid174_alignmentShifter_uid71_fpAddTest(MUX,173)@3
    rightShiftStage1_uid174_alignmentShifter_uid71_fpAddTest_s <= redist2_rightShiftStageSel3Dto1_uid169_alignmentShifter_uid71_fpAddTest_merged_bit_select_c_1_q;
    rightShiftStage1_uid174_alignmentShifter_uid71_fpAddTest_combproc: PROCESS (rightShiftStage1_uid174_alignmentShifter_uid71_fpAddTest_s, rightShiftStage0_uid170_alignmentShifter_uid71_fpAddTest_mfinal_q, rightShiftStage1Idx1_uid172_alignmentShifter_uid71_fpAddTest_q)
    BEGIN
        CASE (rightShiftStage1_uid174_alignmentShifter_uid71_fpAddTest_s) IS
            WHEN "0" => rightShiftStage1_uid174_alignmentShifter_uid71_fpAddTest_q <= rightShiftStage0_uid170_alignmentShifter_uid71_fpAddTest_mfinal_q;
            WHEN "1" => rightShiftStage1_uid174_alignmentShifter_uid71_fpAddTest_q <= rightShiftStage1Idx1_uid172_alignmentShifter_uid71_fpAddTest_q;
            WHEN OTHERS => rightShiftStage1_uid174_alignmentShifter_uid71_fpAddTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- shiftedOut_uid148_alignmentShifter_uid71_fpAddTest(COMPARE,147)@2 + 1
    shiftedOut_uid148_alignmentShifter_uid71_fpAddTest_a <= STD_LOGIC_VECTOR("00" & expAmExpB_uid60_fpAddTest_q);
    shiftedOut_uid148_alignmentShifter_uid71_fpAddTest_b <= STD_LOGIC_VECTOR("0000" & cAmA_uid76_fpAddTest_q);
    shiftedOut_uid148_alignmentShifter_uid71_fpAddTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            shiftedOut_uid148_alignmentShifter_uid71_fpAddTest_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            shiftedOut_uid148_alignmentShifter_uid71_fpAddTest_o <= STD_LOGIC_VECTOR(UNSIGNED(shiftedOut_uid148_alignmentShifter_uid71_fpAddTest_a) - UNSIGNED(shiftedOut_uid148_alignmentShifter_uid71_fpAddTest_b));
        END IF;
    END PROCESS;
    shiftedOut_uid148_alignmentShifter_uid71_fpAddTest_n(0) <= not (shiftedOut_uid148_alignmentShifter_uid71_fpAddTest_o(7));

    -- r_uid177_alignmentShifter_uid71_fpAddTest(MUX,176)@3 + 1
    r_uid177_alignmentShifter_uid71_fpAddTest_s <= shiftedOut_uid148_alignmentShifter_uid71_fpAddTest_n;
    r_uid177_alignmentShifter_uid71_fpAddTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            r_uid177_alignmentShifter_uid71_fpAddTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (r_uid177_alignmentShifter_uid71_fpAddTest_s) IS
                WHEN "0" => r_uid177_alignmentShifter_uid71_fpAddTest_q <= rightShiftStage1_uid174_alignmentShifter_uid71_fpAddTest_q;
                WHEN "1" => r_uid177_alignmentShifter_uid71_fpAddTest_q <= stageIndexName_to14_uid167_b;
                WHEN OTHERS => r_uid177_alignmentShifter_uid71_fpAddTest_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- frac_aSig_uid22_fpAddTest(BITSELECT,21)@0
    frac_aSig_uid22_fpAddTest_in <= aSig_uid16_fpAddTest_q(9 downto 0);
    frac_aSig_uid22_fpAddTest_b <= frac_aSig_uid22_fpAddTest_in(9 downto 0);

    -- redist25_frac_aSig_uid22_fpAddTest_b_4(DELAY,248)
    redist25_frac_aSig_uid22_fpAddTest_b_4 : dspba_delay
    GENERIC MAP ( width => 10, depth => 4, reset_kind => "ASYNC" )
    PORT MAP ( xin => frac_aSig_uid22_fpAddTest_b, xout => redist25_frac_aSig_uid22_fpAddTest_b_4_q, clk => clk, aclr => areset );

    -- oFracA_uid64_fpAddTest(BITJOIN,63)@4
    oFracA_uid64_fpAddTest_q <= VCC_q & redist25_frac_aSig_uid22_fpAddTest_b_4_q;

    -- oFracAE_uid65_fpAddTest(BITJOIN,64)@4
    oFracAE_uid65_fpAddTest_q <= GND_q & oFracA_uid64_fpAddTest_q & GND_q & GND_q;

    -- fracAddResult_uid72_fpAddTest(ADD,71)@4
    fracAddResult_uid72_fpAddTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => oFracAE_uid65_fpAddTest_q(13)) & oFracAE_uid65_fpAddTest_q));
    fracAddResult_uid72_fpAddTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => r_uid177_alignmentShifter_uid71_fpAddTest_q(13)) & r_uid177_alignmentShifter_uid71_fpAddTest_q));
    fracAddResult_uid72_fpAddTest_o <= STD_LOGIC_VECTOR(SIGNED(fracAddResult_uid72_fpAddTest_a) + SIGNED(fracAddResult_uid72_fpAddTest_b));
    fracAddResult_uid72_fpAddTest_q <= fracAddResult_uid72_fpAddTest_o(14 downto 0);

    -- fracAddResultNoSignExt_uid73_fpAddTest(BITSELECT,72)@4
    fracAddResultNoSignExt_uid73_fpAddTest_in <= fracAddResult_uid72_fpAddTest_q(13 downto 0);
    fracAddResultNoSignExt_uid73_fpAddTest_b <= fracAddResultNoSignExt_uid73_fpAddTest_in(13 downto 0);

    -- redist8_fracAddResultNoSignExt_uid73_fpAddTest_b_1(DELAY,231)
    redist8_fracAddResultNoSignExt_uid73_fpAddTest_b_1 : dspba_delay
    GENERIC MAP ( width => 14, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracAddResultNoSignExt_uid73_fpAddTest_b, xout => redist8_fracAddResultNoSignExt_uid73_fpAddTest_b_1_q, clk => clk, aclr => areset );

    -- rVStage_uid121_lzCountVal_uid74_fpAddTest(BITSELECT,120)@5
    rVStage_uid121_lzCountVal_uid74_fpAddTest_b <= redist8_fracAddResultNoSignExt_uid73_fpAddTest_b_1_q(13 downto 6);

    -- vCount_uid122_lzCountVal_uid74_fpAddTest(LOGICAL,121)@5
    vCount_uid122_lzCountVal_uid74_fpAddTest_q <= "1" WHEN rVStage_uid121_lzCountVal_uid74_fpAddTest_b = zs_uid120_lzCountVal_uid74_fpAddTest_q ELSE "0";

    -- redist5_vCount_uid122_lzCountVal_uid74_fpAddTest_q_1(DELAY,228)
    redist5_vCount_uid122_lzCountVal_uid74_fpAddTest_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => vCount_uid122_lzCountVal_uid74_fpAddTest_q, xout => redist5_vCount_uid122_lzCountVal_uid74_fpAddTest_q_1_q, clk => clk, aclr => areset );

    -- zs_uid128_lzCountVal_uid74_fpAddTest(CONSTANT,127)
    zs_uid128_lzCountVal_uid74_fpAddTest_q <= "0000";

    -- vStage_uid124_lzCountVal_uid74_fpAddTest(BITSELECT,123)@5
    vStage_uid124_lzCountVal_uid74_fpAddTest_in <= redist8_fracAddResultNoSignExt_uid73_fpAddTest_b_1_q(5 downto 0);
    vStage_uid124_lzCountVal_uid74_fpAddTest_b <= vStage_uid124_lzCountVal_uid74_fpAddTest_in(5 downto 0);

    -- mO_uid123_lzCountVal_uid74_fpAddTest(CONSTANT,122)
    mO_uid123_lzCountVal_uid74_fpAddTest_q <= "11";

    -- cStage_uid125_lzCountVal_uid74_fpAddTest(BITJOIN,124)@5
    cStage_uid125_lzCountVal_uid74_fpAddTest_q <= vStage_uid124_lzCountVal_uid74_fpAddTest_b & mO_uid123_lzCountVal_uid74_fpAddTest_q;

    -- vStagei_uid127_lzCountVal_uid74_fpAddTest(MUX,126)@5
    vStagei_uid127_lzCountVal_uid74_fpAddTest_s <= vCount_uid122_lzCountVal_uid74_fpAddTest_q;
    vStagei_uid127_lzCountVal_uid74_fpAddTest_combproc: PROCESS (vStagei_uid127_lzCountVal_uid74_fpAddTest_s, rVStage_uid121_lzCountVal_uid74_fpAddTest_b, cStage_uid125_lzCountVal_uid74_fpAddTest_q)
    BEGIN
        CASE (vStagei_uid127_lzCountVal_uid74_fpAddTest_s) IS
            WHEN "0" => vStagei_uid127_lzCountVal_uid74_fpAddTest_q <= rVStage_uid121_lzCountVal_uid74_fpAddTest_b;
            WHEN "1" => vStagei_uid127_lzCountVal_uid74_fpAddTest_q <= cStage_uid125_lzCountVal_uid74_fpAddTest_q;
            WHEN OTHERS => vStagei_uid127_lzCountVal_uid74_fpAddTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rVStage_uid129_lzCountVal_uid74_fpAddTest_merged_bit_select(BITSELECT,218)@5
    rVStage_uid129_lzCountVal_uid74_fpAddTest_merged_bit_select_b <= vStagei_uid127_lzCountVal_uid74_fpAddTest_q(7 downto 4);
    rVStage_uid129_lzCountVal_uid74_fpAddTest_merged_bit_select_c <= vStagei_uid127_lzCountVal_uid74_fpAddTest_q(3 downto 0);

    -- vCount_uid130_lzCountVal_uid74_fpAddTest(LOGICAL,129)@5
    vCount_uid130_lzCountVal_uid74_fpAddTest_q <= "1" WHEN rVStage_uid129_lzCountVal_uid74_fpAddTest_merged_bit_select_b = zs_uid128_lzCountVal_uid74_fpAddTest_q ELSE "0";

    -- redist3_vCount_uid130_lzCountVal_uid74_fpAddTest_q_1(DELAY,226)
    redist3_vCount_uid130_lzCountVal_uid74_fpAddTest_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => vCount_uid130_lzCountVal_uid74_fpAddTest_q, xout => redist3_vCount_uid130_lzCountVal_uid74_fpAddTest_q_1_q, clk => clk, aclr => areset );

    -- zs_uid134_lzCountVal_uid74_fpAddTest(CONSTANT,133)
    zs_uid134_lzCountVal_uid74_fpAddTest_q <= "00";

    -- vStagei_uid133_lzCountVal_uid74_fpAddTest(MUX,132)@5 + 1
    vStagei_uid133_lzCountVal_uid74_fpAddTest_s <= vCount_uid130_lzCountVal_uid74_fpAddTest_q;
    vStagei_uid133_lzCountVal_uid74_fpAddTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            vStagei_uid133_lzCountVal_uid74_fpAddTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (vStagei_uid133_lzCountVal_uid74_fpAddTest_s) IS
                WHEN "0" => vStagei_uid133_lzCountVal_uid74_fpAddTest_q <= rVStage_uid129_lzCountVal_uid74_fpAddTest_merged_bit_select_b;
                WHEN "1" => vStagei_uid133_lzCountVal_uid74_fpAddTest_q <= rVStage_uid129_lzCountVal_uid74_fpAddTest_merged_bit_select_c;
                WHEN OTHERS => vStagei_uid133_lzCountVal_uid74_fpAddTest_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- rVStage_uid135_lzCountVal_uid74_fpAddTest_merged_bit_select(BITSELECT,219)@6
    rVStage_uid135_lzCountVal_uid74_fpAddTest_merged_bit_select_b <= vStagei_uid133_lzCountVal_uid74_fpAddTest_q(3 downto 2);
    rVStage_uid135_lzCountVal_uid74_fpAddTest_merged_bit_select_c <= vStagei_uid133_lzCountVal_uid74_fpAddTest_q(1 downto 0);

    -- vCount_uid136_lzCountVal_uid74_fpAddTest(LOGICAL,135)@6
    vCount_uid136_lzCountVal_uid74_fpAddTest_q <= "1" WHEN rVStage_uid135_lzCountVal_uid74_fpAddTest_merged_bit_select_b = zs_uid134_lzCountVal_uid74_fpAddTest_q ELSE "0";

    -- vStagei_uid139_lzCountVal_uid74_fpAddTest(MUX,138)@6
    vStagei_uid139_lzCountVal_uid74_fpAddTest_s <= vCount_uid136_lzCountVal_uid74_fpAddTest_q;
    vStagei_uid139_lzCountVal_uid74_fpAddTest_combproc: PROCESS (vStagei_uid139_lzCountVal_uid74_fpAddTest_s, rVStage_uid135_lzCountVal_uid74_fpAddTest_merged_bit_select_b, rVStage_uid135_lzCountVal_uid74_fpAddTest_merged_bit_select_c)
    BEGIN
        CASE (vStagei_uid139_lzCountVal_uid74_fpAddTest_s) IS
            WHEN "0" => vStagei_uid139_lzCountVal_uid74_fpAddTest_q <= rVStage_uid135_lzCountVal_uid74_fpAddTest_merged_bit_select_b;
            WHEN "1" => vStagei_uid139_lzCountVal_uid74_fpAddTest_q <= rVStage_uid135_lzCountVal_uid74_fpAddTest_merged_bit_select_c;
            WHEN OTHERS => vStagei_uid139_lzCountVal_uid74_fpAddTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rVStage_uid141_lzCountVal_uid74_fpAddTest(BITSELECT,140)@6
    rVStage_uid141_lzCountVal_uid74_fpAddTest_b <= vStagei_uid139_lzCountVal_uid74_fpAddTest_q(1 downto 1);

    -- vCount_uid142_lzCountVal_uid74_fpAddTest(LOGICAL,141)@6
    vCount_uid142_lzCountVal_uid74_fpAddTest_q <= "1" WHEN rVStage_uid141_lzCountVal_uid74_fpAddTest_b = GND_q ELSE "0";

    -- r_uid143_lzCountVal_uid74_fpAddTest(BITJOIN,142)@6
    r_uid143_lzCountVal_uid74_fpAddTest_q <= redist5_vCount_uid122_lzCountVal_uid74_fpAddTest_q_1_q & redist3_vCount_uid130_lzCountVal_uid74_fpAddTest_q_1_q & vCount_uid136_lzCountVal_uid74_fpAddTest_q & vCount_uid142_lzCountVal_uid74_fpAddTest_q;

    -- aMinusA_uid77_fpAddTest(LOGICAL,76)@6 + 1
    aMinusA_uid77_fpAddTest_qi <= "1" WHEN r_uid143_lzCountVal_uid74_fpAddTest_q = cAmA_uid76_fpAddTest_q ELSE "0";
    aMinusA_uid77_fpAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => aMinusA_uid77_fpAddTest_qi, xout => aMinusA_uid77_fpAddTest_q, clk => clk, aclr => areset );

    -- invAMinusA_uid99_fpAddTest(LOGICAL,98)@7
    invAMinusA_uid99_fpAddTest_q <= not (aMinusA_uid77_fpAddTest_q);

    -- redist15_sigA_uid50_fpAddTest_b_7(DELAY,238)
    redist15_sigA_uid50_fpAddTest_b_7 : dspba_delay
    GENERIC MAP ( width => 1, depth => 5, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist14_sigA_uid50_fpAddTest_b_2_q, xout => redist15_sigA_uid50_fpAddTest_b_7_q, clk => clk, aclr => areset );

    -- cstAllOWE_uid18_fpAddTest(CONSTANT,17)
    cstAllOWE_uid18_fpAddTest_q <= "11111";

    -- expXIsMax_uid38_fpAddTest(LOGICAL,37)@2 + 1
    expXIsMax_uid38_fpAddTest_qi <= "1" WHEN redist22_exp_bSig_uid35_fpAddTest_b_1_q = cstAllOWE_uid18_fpAddTest_q ELSE "0";
    expXIsMax_uid38_fpAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expXIsMax_uid38_fpAddTest_qi, xout => expXIsMax_uid38_fpAddTest_q, clk => clk, aclr => areset );

    -- redist19_expXIsMax_uid38_fpAddTest_q_5(DELAY,242)
    redist19_expXIsMax_uid38_fpAddTest_q_5 : dspba_delay
    GENERIC MAP ( width => 1, depth => 4, reset_kind => "ASYNC" )
    PORT MAP ( xin => expXIsMax_uid38_fpAddTest_q, xout => redist19_expXIsMax_uid38_fpAddTest_q_5_q, clk => clk, aclr => areset );

    -- invExpXIsMax_uid43_fpAddTest(LOGICAL,42)@7
    invExpXIsMax_uid43_fpAddTest_q <= not (redist19_expXIsMax_uid38_fpAddTest_q_5_q);

    -- redist16_InvExpXIsZero_uid44_fpAddTest_q_5(DELAY,239)
    redist16_InvExpXIsZero_uid44_fpAddTest_q_5 : dspba_delay
    GENERIC MAP ( width => 1, depth => 5, reset_kind => "ASYNC" )
    PORT MAP ( xin => InvExpXIsZero_uid44_fpAddTest_q, xout => redist16_InvExpXIsZero_uid44_fpAddTest_q_5_q, clk => clk, aclr => areset );

    -- excR_bSig_uid45_fpAddTest(LOGICAL,44)@7
    excR_bSig_uid45_fpAddTest_q <= redist16_InvExpXIsZero_uid44_fpAddTest_q_5_q and invExpXIsMax_uid43_fpAddTest_q;

    -- redist27_exp_aSig_uid21_fpAddTest_b_6(DELAY,250)
    redist27_exp_aSig_uid21_fpAddTest_b_6 : dspba_delay
    GENERIC MAP ( width => 5, depth => 4, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist26_exp_aSig_uid21_fpAddTest_b_2_q, xout => redist27_exp_aSig_uid21_fpAddTest_b_6_q, clk => clk, aclr => areset );

    -- expXIsMax_uid24_fpAddTest(LOGICAL,23)@6 + 1
    expXIsMax_uid24_fpAddTest_qi <= "1" WHEN redist27_exp_aSig_uid21_fpAddTest_b_6_q = cstAllOWE_uid18_fpAddTest_q ELSE "0";
    expXIsMax_uid24_fpAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expXIsMax_uid24_fpAddTest_qi, xout => expXIsMax_uid24_fpAddTest_q, clk => clk, aclr => areset );

    -- invExpXIsMax_uid29_fpAddTest(LOGICAL,28)@7
    invExpXIsMax_uid29_fpAddTest_q <= not (expXIsMax_uid24_fpAddTest_q);

    -- excZ_aSig_uid16_uid23_fpAddTest(LOGICAL,22)@6 + 1
    excZ_aSig_uid16_uid23_fpAddTest_qi <= "1" WHEN redist27_exp_aSig_uid21_fpAddTest_b_6_q = cstAllZWE_uid20_fpAddTest_q ELSE "0";
    excZ_aSig_uid16_uid23_fpAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excZ_aSig_uid16_uid23_fpAddTest_qi, xout => excZ_aSig_uid16_uid23_fpAddTest_q, clk => clk, aclr => areset );

    -- InvExpXIsZero_uid30_fpAddTest(LOGICAL,29)@7
    InvExpXIsZero_uid30_fpAddTest_q <= not (excZ_aSig_uid16_uid23_fpAddTest_q);

    -- excR_aSig_uid31_fpAddTest(LOGICAL,30)@7
    excR_aSig_uid31_fpAddTest_q <= InvExpXIsZero_uid30_fpAddTest_q and invExpXIsMax_uid29_fpAddTest_q;

    -- signRReg_uid100_fpAddTest(LOGICAL,99)@7
    signRReg_uid100_fpAddTest_q <= excR_aSig_uid31_fpAddTest_q and excR_bSig_uid45_fpAddTest_q and redist15_sigA_uid50_fpAddTest_b_7_q and invAMinusA_uid99_fpAddTest_q;

    -- redist13_sigB_uid51_fpAddTest_b_6(DELAY,236)
    redist13_sigB_uid51_fpAddTest_b_6 : dspba_delay
    GENERIC MAP ( width => 1, depth => 5, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist12_sigB_uid51_fpAddTest_b_1_q, xout => redist13_sigB_uid51_fpAddTest_b_6_q, clk => clk, aclr => areset );

    -- redist20_excZ_bSig_uid17_uid37_fpAddTest_q_6(DELAY,243)
    redist20_excZ_bSig_uid17_uid37_fpAddTest_q_6 : dspba_delay
    GENERIC MAP ( width => 1, depth => 5, reset_kind => "ASYNC" )
    PORT MAP ( xin => excZ_bSig_uid17_uid37_fpAddTest_q, xout => redist20_excZ_bSig_uid17_uid37_fpAddTest_q_6_q, clk => clk, aclr => areset );

    -- excAZBZSigASigB_uid104_fpAddTest(LOGICAL,103)@7
    excAZBZSigASigB_uid104_fpAddTest_q <= excZ_aSig_uid16_uid23_fpAddTest_q and redist20_excZ_bSig_uid17_uid37_fpAddTest_q_6_q and redist15_sigA_uid50_fpAddTest_b_7_q and redist13_sigB_uid51_fpAddTest_b_6_q;

    -- excBZARSigA_uid105_fpAddTest(LOGICAL,104)@7
    excBZARSigA_uid105_fpAddTest_q <= redist20_excZ_bSig_uid17_uid37_fpAddTest_q_6_q and excR_aSig_uid31_fpAddTest_q and redist15_sigA_uid50_fpAddTest_b_7_q;

    -- signRZero_uid106_fpAddTest(LOGICAL,105)@7
    signRZero_uid106_fpAddTest_q <= excBZARSigA_uid105_fpAddTest_q or excAZBZSigASigB_uid104_fpAddTest_q;

    -- fracXIsZero_uid39_fpAddTest(LOGICAL,38)@2 + 1
    fracXIsZero_uid39_fpAddTest_qi <= "1" WHEN cstZeroWF_uid19_fpAddTest_q = redist21_frac_bSig_uid36_fpAddTest_b_1_q ELSE "0";
    fracXIsZero_uid39_fpAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracXIsZero_uid39_fpAddTest_qi, xout => fracXIsZero_uid39_fpAddTest_q, clk => clk, aclr => areset );

    -- redist18_fracXIsZero_uid39_fpAddTest_q_5(DELAY,241)
    redist18_fracXIsZero_uid39_fpAddTest_q_5 : dspba_delay
    GENERIC MAP ( width => 1, depth => 4, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracXIsZero_uid39_fpAddTest_q, xout => redist18_fracXIsZero_uid39_fpAddTest_q_5_q, clk => clk, aclr => areset );

    -- excI_bSig_uid41_fpAddTest(LOGICAL,40)@7
    excI_bSig_uid41_fpAddTest_q <= redist19_expXIsMax_uid38_fpAddTest_q_5_q and redist18_fracXIsZero_uid39_fpAddTest_q_5_q;

    -- sigBBInf_uid101_fpAddTest(LOGICAL,100)@7
    sigBBInf_uid101_fpAddTest_q <= redist13_sigB_uid51_fpAddTest_b_6_q and excI_bSig_uid41_fpAddTest_q;

    -- fracXIsZero_uid25_fpAddTest(LOGICAL,24)@4 + 1
    fracXIsZero_uid25_fpAddTest_qi <= "1" WHEN cstZeroWF_uid19_fpAddTest_q = redist25_frac_aSig_uid22_fpAddTest_b_4_q ELSE "0";
    fracXIsZero_uid25_fpAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracXIsZero_uid25_fpAddTest_qi, xout => fracXIsZero_uid25_fpAddTest_q, clk => clk, aclr => areset );

    -- redist24_fracXIsZero_uid25_fpAddTest_q_3(DELAY,247)
    redist24_fracXIsZero_uid25_fpAddTest_q_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracXIsZero_uid25_fpAddTest_q, xout => redist24_fracXIsZero_uid25_fpAddTest_q_3_q, clk => clk, aclr => areset );

    -- excI_aSig_uid27_fpAddTest(LOGICAL,26)@7
    excI_aSig_uid27_fpAddTest_q <= expXIsMax_uid24_fpAddTest_q and redist24_fracXIsZero_uid25_fpAddTest_q_3_q;

    -- sigAAInf_uid102_fpAddTest(LOGICAL,101)@7
    sigAAInf_uid102_fpAddTest_q <= redist15_sigA_uid50_fpAddTest_b_7_q and excI_aSig_uid27_fpAddTest_q;

    -- signRInf_uid103_fpAddTest(LOGICAL,102)@7
    signRInf_uid103_fpAddTest_q <= sigAAInf_uid102_fpAddTest_q or sigBBInf_uid101_fpAddTest_q;

    -- signRInfRZRReg_uid107_fpAddTest(LOGICAL,106)@7 + 1
    signRInfRZRReg_uid107_fpAddTest_qi <= signRInf_uid103_fpAddTest_q or signRZero_uid106_fpAddTest_q or signRReg_uid100_fpAddTest_q;
    signRInfRZRReg_uid107_fpAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => signRInfRZRReg_uid107_fpAddTest_qi, xout => signRInfRZRReg_uid107_fpAddTest_q, clk => clk, aclr => areset );

    -- fracXIsNotZero_uid40_fpAddTest(LOGICAL,39)@7
    fracXIsNotZero_uid40_fpAddTest_q <= not (redist18_fracXIsZero_uid39_fpAddTest_q_5_q);

    -- excN_bSig_uid42_fpAddTest(LOGICAL,41)@7 + 1
    excN_bSig_uid42_fpAddTest_qi <= redist19_expXIsMax_uid38_fpAddTest_q_5_q and fracXIsNotZero_uid40_fpAddTest_q;
    excN_bSig_uid42_fpAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excN_bSig_uid42_fpAddTest_qi, xout => excN_bSig_uid42_fpAddTest_q, clk => clk, aclr => areset );

    -- fracXIsNotZero_uid26_fpAddTest(LOGICAL,25)@7
    fracXIsNotZero_uid26_fpAddTest_q <= not (redist24_fracXIsZero_uid25_fpAddTest_q_3_q);

    -- excN_aSig_uid28_fpAddTest(LOGICAL,27)@7 + 1
    excN_aSig_uid28_fpAddTest_qi <= expXIsMax_uid24_fpAddTest_q and fracXIsNotZero_uid26_fpAddTest_q;
    excN_aSig_uid28_fpAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excN_aSig_uid28_fpAddTest_qi, xout => excN_aSig_uid28_fpAddTest_q, clk => clk, aclr => areset );

    -- excRNaN2_uid94_fpAddTest(LOGICAL,93)@8
    excRNaN2_uid94_fpAddTest_q <= excN_aSig_uid28_fpAddTest_q or excN_bSig_uid42_fpAddTest_q;

    -- redist11_effSub_uid52_fpAddTest_q_6(DELAY,234)
    redist11_effSub_uid52_fpAddTest_q_6 : dspba_delay
    GENERIC MAP ( width => 1, depth => 6, reset_kind => "ASYNC" )
    PORT MAP ( xin => effSub_uid52_fpAddTest_q, xout => redist11_effSub_uid52_fpAddTest_q_6_q, clk => clk, aclr => areset );

    -- redist17_excI_bSig_uid41_fpAddTest_q_1(DELAY,240)
    redist17_excI_bSig_uid41_fpAddTest_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excI_bSig_uid41_fpAddTest_q, xout => redist17_excI_bSig_uid41_fpAddTest_q_1_q, clk => clk, aclr => areset );

    -- redist23_excI_aSig_uid27_fpAddTest_q_1(DELAY,246)
    redist23_excI_aSig_uid27_fpAddTest_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excI_aSig_uid27_fpAddTest_q, xout => redist23_excI_aSig_uid27_fpAddTest_q_1_q, clk => clk, aclr => areset );

    -- excAIBISub_uid95_fpAddTest(LOGICAL,94)@8
    excAIBISub_uid95_fpAddTest_q <= redist23_excI_aSig_uid27_fpAddTest_q_1_q and redist17_excI_bSig_uid41_fpAddTest_q_1_q and redist11_effSub_uid52_fpAddTest_q_6_q;

    -- excRNaN_uid96_fpAddTest(LOGICAL,95)@8
    excRNaN_uid96_fpAddTest_q <= excAIBISub_uid95_fpAddTest_q or excRNaN2_uid94_fpAddTest_q;

    -- invExcRNaN_uid108_fpAddTest(LOGICAL,107)@8
    invExcRNaN_uid108_fpAddTest_q <= not (excRNaN_uid96_fpAddTest_q);

    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- signRPostExc_uid109_fpAddTest(LOGICAL,108)@8 + 1
    signRPostExc_uid109_fpAddTest_qi <= invExcRNaN_uid108_fpAddTest_q and signRInfRZRReg_uid107_fpAddTest_q;
    signRPostExc_uid109_fpAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => signRPostExc_uid109_fpAddTest_qi, xout => signRPostExc_uid109_fpAddTest_q, clk => clk, aclr => areset );

    -- expInc_uid78_fpAddTest(ADD,77)@6
    expInc_uid78_fpAddTest_a <= STD_LOGIC_VECTOR("0" & redist27_exp_aSig_uid21_fpAddTest_b_6_q);
    expInc_uid78_fpAddTest_b <= STD_LOGIC_VECTOR("00000" & VCC_q);
    expInc_uid78_fpAddTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expInc_uid78_fpAddTest_a) + UNSIGNED(expInc_uid78_fpAddTest_b));
    expInc_uid78_fpAddTest_q <= expInc_uid78_fpAddTest_o(5 downto 0);

    -- expPostNorm_uid79_fpAddTest(SUB,78)@6 + 1
    expPostNorm_uid79_fpAddTest_a <= STD_LOGIC_VECTOR("0" & expInc_uid78_fpAddTest_q);
    expPostNorm_uid79_fpAddTest_b <= STD_LOGIC_VECTOR("000" & r_uid143_lzCountVal_uid74_fpAddTest_q);
    expPostNorm_uid79_fpAddTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expPostNorm_uid79_fpAddTest_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            expPostNorm_uid79_fpAddTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expPostNorm_uid79_fpAddTest_a) - UNSIGNED(expPostNorm_uid79_fpAddTest_b));
        END IF;
    END PROCESS;
    expPostNorm_uid79_fpAddTest_q <= expPostNorm_uid79_fpAddTest_o(6 downto 0);

    -- leftShiftStage1Idx1Rng1_uid203_fracPostNorm_uid75_fpAddTest(BITSELECT,202)@7
    leftShiftStage1Idx1Rng1_uid203_fracPostNorm_uid75_fpAddTest_in <= leftShiftStage0_uid201_fracPostNorm_uid75_fpAddTest_mfinal_q(12 downto 0);
    leftShiftStage1Idx1Rng1_uid203_fracPostNorm_uid75_fpAddTest_b <= leftShiftStage1Idx1Rng1_uid203_fracPostNorm_uid75_fpAddTest_in(12 downto 0);

    -- leftShiftStage1Idx1_uid204_fracPostNorm_uid75_fpAddTest(BITJOIN,203)@7
    leftShiftStage1Idx1_uid204_fracPostNorm_uid75_fpAddTest_q <= leftShiftStage1Idx1Rng1_uid203_fracPostNorm_uid75_fpAddTest_b & GND_q;

    -- leftShiftStage0Idx7_uid199_fracPostNorm_uid75_fpAddTest(CONSTANT,198)
    leftShiftStage0Idx7_uid199_fracPostNorm_uid75_fpAddTest_q <= "00000000000000";

    -- redist9_fracAddResultNoSignExt_uid73_fpAddTest_b_2(DELAY,232)
    redist9_fracAddResultNoSignExt_uid73_fpAddTest_b_2 : dspba_delay
    GENERIC MAP ( width => 14, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist8_fracAddResultNoSignExt_uid73_fpAddTest_b_1_q, xout => redist9_fracAddResultNoSignExt_uid73_fpAddTest_b_2_q, clk => clk, aclr => areset );

    -- leftShiftStage0Idx6Rng12_uid197_fracPostNorm_uid75_fpAddTest(BITSELECT,196)@6
    leftShiftStage0Idx6Rng12_uid197_fracPostNorm_uid75_fpAddTest_in <= redist9_fracAddResultNoSignExt_uid73_fpAddTest_b_2_q(1 downto 0);
    leftShiftStage0Idx6Rng12_uid197_fracPostNorm_uid75_fpAddTest_b <= leftShiftStage0Idx6Rng12_uid197_fracPostNorm_uid75_fpAddTest_in(1 downto 0);

    -- leftShiftStage0Idx6Pad12_uid196_fracPostNorm_uid75_fpAddTest(CONSTANT,195)
    leftShiftStage0Idx6Pad12_uid196_fracPostNorm_uid75_fpAddTest_q <= "000000000000";

    -- leftShiftStage0Idx6_uid198_fracPostNorm_uid75_fpAddTest(BITJOIN,197)@6
    leftShiftStage0Idx6_uid198_fracPostNorm_uid75_fpAddTest_q <= leftShiftStage0Idx6Rng12_uid197_fracPostNorm_uid75_fpAddTest_b & leftShiftStage0Idx6Pad12_uid196_fracPostNorm_uid75_fpAddTest_q;

    -- leftShiftStage0Idx5Rng10_uid194_fracPostNorm_uid75_fpAddTest(BITSELECT,193)@6
    leftShiftStage0Idx5Rng10_uid194_fracPostNorm_uid75_fpAddTest_in <= redist9_fracAddResultNoSignExt_uid73_fpAddTest_b_2_q(3 downto 0);
    leftShiftStage0Idx5Rng10_uid194_fracPostNorm_uid75_fpAddTest_b <= leftShiftStage0Idx5Rng10_uid194_fracPostNorm_uid75_fpAddTest_in(3 downto 0);

    -- leftShiftStage0Idx5_uid195_fracPostNorm_uid75_fpAddTest(BITJOIN,194)@6
    leftShiftStage0Idx5_uid195_fracPostNorm_uid75_fpAddTest_q <= leftShiftStage0Idx5Rng10_uid194_fracPostNorm_uid75_fpAddTest_b & cstZeroWF_uid19_fpAddTest_q;

    -- redist4_vStage_uid124_lzCountVal_uid74_fpAddTest_b_1(DELAY,227)
    redist4_vStage_uid124_lzCountVal_uid74_fpAddTest_b_1 : dspba_delay
    GENERIC MAP ( width => 6, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => vStage_uid124_lzCountVal_uid74_fpAddTest_b, xout => redist4_vStage_uid124_lzCountVal_uid74_fpAddTest_b_1_q, clk => clk, aclr => areset );

    -- leftShiftStage0Idx4_uid192_fracPostNorm_uid75_fpAddTest(BITJOIN,191)@6
    leftShiftStage0Idx4_uid192_fracPostNorm_uid75_fpAddTest_q <= redist4_vStage_uid124_lzCountVal_uid74_fpAddTest_b_1_q & zs_uid120_lzCountVal_uid74_fpAddTest_q;

    -- leftShiftStage0_uid201_fracPostNorm_uid75_fpAddTest_msplit_1(MUX,215)@6
    leftShiftStage0_uid201_fracPostNorm_uid75_fpAddTest_msplit_1_s <= leftShiftStage0_uid201_fracPostNorm_uid75_fpAddTest_selLSBs_merged_bit_select_b;
    leftShiftStage0_uid201_fracPostNorm_uid75_fpAddTest_msplit_1_combproc: PROCESS (leftShiftStage0_uid201_fracPostNorm_uid75_fpAddTest_msplit_1_s, leftShiftStage0Idx4_uid192_fracPostNorm_uid75_fpAddTest_q, leftShiftStage0Idx5_uid195_fracPostNorm_uid75_fpAddTest_q, leftShiftStage0Idx6_uid198_fracPostNorm_uid75_fpAddTest_q, leftShiftStage0Idx7_uid199_fracPostNorm_uid75_fpAddTest_q)
    BEGIN
        CASE (leftShiftStage0_uid201_fracPostNorm_uid75_fpAddTest_msplit_1_s) IS
            WHEN "00" => leftShiftStage0_uid201_fracPostNorm_uid75_fpAddTest_msplit_1_q <= leftShiftStage0Idx4_uid192_fracPostNorm_uid75_fpAddTest_q;
            WHEN "01" => leftShiftStage0_uid201_fracPostNorm_uid75_fpAddTest_msplit_1_q <= leftShiftStage0Idx5_uid195_fracPostNorm_uid75_fpAddTest_q;
            WHEN "10" => leftShiftStage0_uid201_fracPostNorm_uid75_fpAddTest_msplit_1_q <= leftShiftStage0Idx6_uid198_fracPostNorm_uid75_fpAddTest_q;
            WHEN "11" => leftShiftStage0_uid201_fracPostNorm_uid75_fpAddTest_msplit_1_q <= leftShiftStage0Idx7_uid199_fracPostNorm_uid75_fpAddTest_q;
            WHEN OTHERS => leftShiftStage0_uid201_fracPostNorm_uid75_fpAddTest_msplit_1_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- leftShiftStage0Idx3Rng6_uid188_fracPostNorm_uid75_fpAddTest(BITSELECT,187)@6
    leftShiftStage0Idx3Rng6_uid188_fracPostNorm_uid75_fpAddTest_in <= redist9_fracAddResultNoSignExt_uid73_fpAddTest_b_2_q(7 downto 0);
    leftShiftStage0Idx3Rng6_uid188_fracPostNorm_uid75_fpAddTest_b <= leftShiftStage0Idx3Rng6_uid188_fracPostNorm_uid75_fpAddTest_in(7 downto 0);

    -- leftShiftStage0Idx3Pad6_uid187_fracPostNorm_uid75_fpAddTest(CONSTANT,186)
    leftShiftStage0Idx3Pad6_uid187_fracPostNorm_uid75_fpAddTest_q <= "000000";

    -- leftShiftStage0Idx3_uid189_fracPostNorm_uid75_fpAddTest(BITJOIN,188)@6
    leftShiftStage0Idx3_uid189_fracPostNorm_uid75_fpAddTest_q <= leftShiftStage0Idx3Rng6_uid188_fracPostNorm_uid75_fpAddTest_b & leftShiftStage0Idx3Pad6_uid187_fracPostNorm_uid75_fpAddTest_q;

    -- leftShiftStage0Idx2Rng4_uid185_fracPostNorm_uid75_fpAddTest(BITSELECT,184)@6
    leftShiftStage0Idx2Rng4_uid185_fracPostNorm_uid75_fpAddTest_in <= redist9_fracAddResultNoSignExt_uid73_fpAddTest_b_2_q(9 downto 0);
    leftShiftStage0Idx2Rng4_uid185_fracPostNorm_uid75_fpAddTest_b <= leftShiftStage0Idx2Rng4_uid185_fracPostNorm_uid75_fpAddTest_in(9 downto 0);

    -- leftShiftStage0Idx2_uid186_fracPostNorm_uid75_fpAddTest(BITJOIN,185)@6
    leftShiftStage0Idx2_uid186_fracPostNorm_uid75_fpAddTest_q <= leftShiftStage0Idx2Rng4_uid185_fracPostNorm_uid75_fpAddTest_b & zs_uid128_lzCountVal_uid74_fpAddTest_q;

    -- leftShiftStage0Idx1Rng2_uid182_fracPostNorm_uid75_fpAddTest(BITSELECT,181)@6
    leftShiftStage0Idx1Rng2_uid182_fracPostNorm_uid75_fpAddTest_in <= redist9_fracAddResultNoSignExt_uid73_fpAddTest_b_2_q(11 downto 0);
    leftShiftStage0Idx1Rng2_uid182_fracPostNorm_uid75_fpAddTest_b <= leftShiftStage0Idx1Rng2_uid182_fracPostNorm_uid75_fpAddTest_in(11 downto 0);

    -- leftShiftStage0Idx1_uid183_fracPostNorm_uid75_fpAddTest(BITJOIN,182)@6
    leftShiftStage0Idx1_uid183_fracPostNorm_uid75_fpAddTest_q <= leftShiftStage0Idx1Rng2_uid182_fracPostNorm_uid75_fpAddTest_b & zs_uid134_lzCountVal_uid74_fpAddTest_q;

    -- leftShiftStage0_uid201_fracPostNorm_uid75_fpAddTest_msplit_0(MUX,214)@6
    leftShiftStage0_uid201_fracPostNorm_uid75_fpAddTest_msplit_0_s <= leftShiftStage0_uid201_fracPostNorm_uid75_fpAddTest_selLSBs_merged_bit_select_b;
    leftShiftStage0_uid201_fracPostNorm_uid75_fpAddTest_msplit_0_combproc: PROCESS (leftShiftStage0_uid201_fracPostNorm_uid75_fpAddTest_msplit_0_s, redist9_fracAddResultNoSignExt_uid73_fpAddTest_b_2_q, leftShiftStage0Idx1_uid183_fracPostNorm_uid75_fpAddTest_q, leftShiftStage0Idx2_uid186_fracPostNorm_uid75_fpAddTest_q, leftShiftStage0Idx3_uid189_fracPostNorm_uid75_fpAddTest_q)
    BEGIN
        CASE (leftShiftStage0_uid201_fracPostNorm_uid75_fpAddTest_msplit_0_s) IS
            WHEN "00" => leftShiftStage0_uid201_fracPostNorm_uid75_fpAddTest_msplit_0_q <= redist9_fracAddResultNoSignExt_uid73_fpAddTest_b_2_q;
            WHEN "01" => leftShiftStage0_uid201_fracPostNorm_uid75_fpAddTest_msplit_0_q <= leftShiftStage0Idx1_uid183_fracPostNorm_uid75_fpAddTest_q;
            WHEN "10" => leftShiftStage0_uid201_fracPostNorm_uid75_fpAddTest_msplit_0_q <= leftShiftStage0Idx2_uid186_fracPostNorm_uid75_fpAddTest_q;
            WHEN "11" => leftShiftStage0_uid201_fracPostNorm_uid75_fpAddTest_msplit_0_q <= leftShiftStage0Idx3_uid189_fracPostNorm_uid75_fpAddTest_q;
            WHEN OTHERS => leftShiftStage0_uid201_fracPostNorm_uid75_fpAddTest_msplit_0_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- leftShiftStageSel3Dto1_uid200_fracPostNorm_uid75_fpAddTest_merged_bit_select(BITSELECT,220)@6
    leftShiftStageSel3Dto1_uid200_fracPostNorm_uid75_fpAddTest_merged_bit_select_b <= r_uid143_lzCountVal_uid74_fpAddTest_q(3 downto 1);
    leftShiftStageSel3Dto1_uid200_fracPostNorm_uid75_fpAddTest_merged_bit_select_c <= r_uid143_lzCountVal_uid74_fpAddTest_q(0 downto 0);

    -- leftShiftStage0_uid201_fracPostNorm_uid75_fpAddTest_selLSBs_merged_bit_select(BITSELECT,222)@6
    leftShiftStage0_uid201_fracPostNorm_uid75_fpAddTest_selLSBs_merged_bit_select_b <= leftShiftStageSel3Dto1_uid200_fracPostNorm_uid75_fpAddTest_merged_bit_select_b(1 downto 0);
    leftShiftStage0_uid201_fracPostNorm_uid75_fpAddTest_selLSBs_merged_bit_select_c <= leftShiftStageSel3Dto1_uid200_fracPostNorm_uid75_fpAddTest_merged_bit_select_b(2 downto 2);

    -- leftShiftStage0_uid201_fracPostNorm_uid75_fpAddTest_mfinal(MUX,216)@6 + 1
    leftShiftStage0_uid201_fracPostNorm_uid75_fpAddTest_mfinal_s <= leftShiftStage0_uid201_fracPostNorm_uid75_fpAddTest_selLSBs_merged_bit_select_c;
    leftShiftStage0_uid201_fracPostNorm_uid75_fpAddTest_mfinal_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            leftShiftStage0_uid201_fracPostNorm_uid75_fpAddTest_mfinal_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (leftShiftStage0_uid201_fracPostNorm_uid75_fpAddTest_mfinal_s) IS
                WHEN "0" => leftShiftStage0_uid201_fracPostNorm_uid75_fpAddTest_mfinal_q <= leftShiftStage0_uid201_fracPostNorm_uid75_fpAddTest_msplit_0_q;
                WHEN "1" => leftShiftStage0_uid201_fracPostNorm_uid75_fpAddTest_mfinal_q <= leftShiftStage0_uid201_fracPostNorm_uid75_fpAddTest_msplit_1_q;
                WHEN OTHERS => leftShiftStage0_uid201_fracPostNorm_uid75_fpAddTest_mfinal_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- redist0_leftShiftStageSel3Dto1_uid200_fracPostNorm_uid75_fpAddTest_merged_bit_select_c_1(DELAY,223)
    redist0_leftShiftStageSel3Dto1_uid200_fracPostNorm_uid75_fpAddTest_merged_bit_select_c_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => leftShiftStageSel3Dto1_uid200_fracPostNorm_uid75_fpAddTest_merged_bit_select_c, xout => redist0_leftShiftStageSel3Dto1_uid200_fracPostNorm_uid75_fpAddTest_merged_bit_select_c_1_q, clk => clk, aclr => areset );

    -- leftShiftStage1_uid206_fracPostNorm_uid75_fpAddTest(MUX,205)@7
    leftShiftStage1_uid206_fracPostNorm_uid75_fpAddTest_s <= redist0_leftShiftStageSel3Dto1_uid200_fracPostNorm_uid75_fpAddTest_merged_bit_select_c_1_q;
    leftShiftStage1_uid206_fracPostNorm_uid75_fpAddTest_combproc: PROCESS (leftShiftStage1_uid206_fracPostNorm_uid75_fpAddTest_s, leftShiftStage0_uid201_fracPostNorm_uid75_fpAddTest_mfinal_q, leftShiftStage1Idx1_uid204_fracPostNorm_uid75_fpAddTest_q)
    BEGIN
        CASE (leftShiftStage1_uid206_fracPostNorm_uid75_fpAddTest_s) IS
            WHEN "0" => leftShiftStage1_uid206_fracPostNorm_uid75_fpAddTest_q <= leftShiftStage0_uid201_fracPostNorm_uid75_fpAddTest_mfinal_q;
            WHEN "1" => leftShiftStage1_uid206_fracPostNorm_uid75_fpAddTest_q <= leftShiftStage1Idx1_uid204_fracPostNorm_uid75_fpAddTest_q;
            WHEN OTHERS => leftShiftStage1_uid206_fracPostNorm_uid75_fpAddTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- fracPostNormRndRange_uid80_fpAddTest(BITSELECT,79)@7
    fracPostNormRndRange_uid80_fpAddTest_in <= leftShiftStage1_uid206_fracPostNorm_uid75_fpAddTest_q(12 downto 0);
    fracPostNormRndRange_uid80_fpAddTest_b <= fracPostNormRndRange_uid80_fpAddTest_in(12 downto 2);

    -- expFracR_uid81_fpAddTest(BITJOIN,80)@7
    expFracR_uid81_fpAddTest_q <= expPostNorm_uid79_fpAddTest_q & fracPostNormRndRange_uid80_fpAddTest_b;

    -- expRPreExc_uid87_fpAddTest(BITSELECT,86)@7
    expRPreExc_uid87_fpAddTest_in <= expFracR_uid81_fpAddTest_q(15 downto 0);
    expRPreExc_uid87_fpAddTest_b <= expRPreExc_uid87_fpAddTest_in(15 downto 11);

    -- redist6_expRPreExc_uid87_fpAddTest_b_2(DELAY,229)
    redist6_expRPreExc_uid87_fpAddTest_b_2 : dspba_delay
    GENERIC MAP ( width => 5, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => expRPreExc_uid87_fpAddTest_b, xout => redist6_expRPreExc_uid87_fpAddTest_b_2_q, clk => clk, aclr => areset );

    -- wEP2AllOwE_uid82_fpAddTest(CONSTANT,81)
    wEP2AllOwE_uid82_fpAddTest_q <= "0011111";

    -- rndExp_uid83_fpAddTest(BITSELECT,82)@7
    rndExp_uid83_fpAddTest_b <= expFracR_uid81_fpAddTest_q(17 downto 11);

    -- rOvf_uid84_fpAddTest(LOGICAL,83)@7
    rOvf_uid84_fpAddTest_q <= "1" WHEN rndExp_uid83_fpAddTest_b = wEP2AllOwE_uid82_fpAddTest_q ELSE "0";

    -- regInputs_uid88_fpAddTest(LOGICAL,87)@7
    regInputs_uid88_fpAddTest_q <= excR_aSig_uid31_fpAddTest_q and excR_bSig_uid45_fpAddTest_q;

    -- rInfOvf_uid91_fpAddTest(LOGICAL,90)@7 + 1
    rInfOvf_uid91_fpAddTest_qi <= regInputs_uid88_fpAddTest_q and rOvf_uid84_fpAddTest_q;
    rInfOvf_uid91_fpAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => rInfOvf_uid91_fpAddTest_qi, xout => rInfOvf_uid91_fpAddTest_q, clk => clk, aclr => areset );

    -- excRInfVInC_uid92_fpAddTest(BITJOIN,91)@8
    excRInfVInC_uid92_fpAddTest_q <= rInfOvf_uid91_fpAddTest_q & excN_bSig_uid42_fpAddTest_q & excN_aSig_uid28_fpAddTest_q & redist17_excI_bSig_uid41_fpAddTest_q_1_q & redist23_excI_aSig_uid27_fpAddTest_q_1_q & redist11_effSub_uid52_fpAddTest_q_6_q;

    -- excRInf_uid93_fpAddTest(LOOKUP,92)@8
    excRInf_uid93_fpAddTest_combproc: PROCESS (excRInfVInC_uid92_fpAddTest_q)
    BEGIN
        -- Begin reserved scope level
        CASE (excRInfVInC_uid92_fpAddTest_q) IS
            WHEN "000000" => excRInf_uid93_fpAddTest_q <= "0";
            WHEN "000001" => excRInf_uid93_fpAddTest_q <= "0";
            WHEN "000010" => excRInf_uid93_fpAddTest_q <= "1";
            WHEN "000011" => excRInf_uid93_fpAddTest_q <= "1";
            WHEN "000100" => excRInf_uid93_fpAddTest_q <= "1";
            WHEN "000101" => excRInf_uid93_fpAddTest_q <= "1";
            WHEN "000110" => excRInf_uid93_fpAddTest_q <= "1";
            WHEN "000111" => excRInf_uid93_fpAddTest_q <= "0";
            WHEN "001000" => excRInf_uid93_fpAddTest_q <= "0";
            WHEN "001001" => excRInf_uid93_fpAddTest_q <= "0";
            WHEN "001010" => excRInf_uid93_fpAddTest_q <= "0";
            WHEN "001011" => excRInf_uid93_fpAddTest_q <= "0";
            WHEN "001100" => excRInf_uid93_fpAddTest_q <= "0";
            WHEN "001101" => excRInf_uid93_fpAddTest_q <= "0";
            WHEN "001110" => excRInf_uid93_fpAddTest_q <= "0";
            WHEN "001111" => excRInf_uid93_fpAddTest_q <= "0";
            WHEN "010000" => excRInf_uid93_fpAddTest_q <= "0";
            WHEN "010001" => excRInf_uid93_fpAddTest_q <= "0";
            WHEN "010010" => excRInf_uid93_fpAddTest_q <= "0";
            WHEN "010011" => excRInf_uid93_fpAddTest_q <= "0";
            WHEN "010100" => excRInf_uid93_fpAddTest_q <= "0";
            WHEN "010101" => excRInf_uid93_fpAddTest_q <= "0";
            WHEN "010110" => excRInf_uid93_fpAddTest_q <= "0";
            WHEN "010111" => excRInf_uid93_fpAddTest_q <= "0";
            WHEN "011000" => excRInf_uid93_fpAddTest_q <= "0";
            WHEN "011001" => excRInf_uid93_fpAddTest_q <= "0";
            WHEN "011010" => excRInf_uid93_fpAddTest_q <= "0";
            WHEN "011011" => excRInf_uid93_fpAddTest_q <= "0";
            WHEN "011100" => excRInf_uid93_fpAddTest_q <= "0";
            WHEN "011101" => excRInf_uid93_fpAddTest_q <= "0";
            WHEN "011110" => excRInf_uid93_fpAddTest_q <= "0";
            WHEN "011111" => excRInf_uid93_fpAddTest_q <= "0";
            WHEN "100000" => excRInf_uid93_fpAddTest_q <= "1";
            WHEN "100001" => excRInf_uid93_fpAddTest_q <= "0";
            WHEN "100010" => excRInf_uid93_fpAddTest_q <= "0";
            WHEN "100011" => excRInf_uid93_fpAddTest_q <= "0";
            WHEN "100100" => excRInf_uid93_fpAddTest_q <= "0";
            WHEN "100101" => excRInf_uid93_fpAddTest_q <= "0";
            WHEN "100110" => excRInf_uid93_fpAddTest_q <= "0";
            WHEN "100111" => excRInf_uid93_fpAddTest_q <= "0";
            WHEN "101000" => excRInf_uid93_fpAddTest_q <= "0";
            WHEN "101001" => excRInf_uid93_fpAddTest_q <= "0";
            WHEN "101010" => excRInf_uid93_fpAddTest_q <= "0";
            WHEN "101011" => excRInf_uid93_fpAddTest_q <= "0";
            WHEN "101100" => excRInf_uid93_fpAddTest_q <= "0";
            WHEN "101101" => excRInf_uid93_fpAddTest_q <= "0";
            WHEN "101110" => excRInf_uid93_fpAddTest_q <= "0";
            WHEN "101111" => excRInf_uid93_fpAddTest_q <= "0";
            WHEN "110000" => excRInf_uid93_fpAddTest_q <= "0";
            WHEN "110001" => excRInf_uid93_fpAddTest_q <= "0";
            WHEN "110010" => excRInf_uid93_fpAddTest_q <= "0";
            WHEN "110011" => excRInf_uid93_fpAddTest_q <= "0";
            WHEN "110100" => excRInf_uid93_fpAddTest_q <= "0";
            WHEN "110101" => excRInf_uid93_fpAddTest_q <= "0";
            WHEN "110110" => excRInf_uid93_fpAddTest_q <= "0";
            WHEN "110111" => excRInf_uid93_fpAddTest_q <= "0";
            WHEN "111000" => excRInf_uid93_fpAddTest_q <= "0";
            WHEN "111001" => excRInf_uid93_fpAddTest_q <= "0";
            WHEN "111010" => excRInf_uid93_fpAddTest_q <= "0";
            WHEN "111011" => excRInf_uid93_fpAddTest_q <= "0";
            WHEN "111100" => excRInf_uid93_fpAddTest_q <= "0";
            WHEN "111101" => excRInf_uid93_fpAddTest_q <= "0";
            WHEN "111110" => excRInf_uid93_fpAddTest_q <= "0";
            WHEN "111111" => excRInf_uid93_fpAddTest_q <= "0";
            WHEN OTHERS => -- unreachable
                           excRInf_uid93_fpAddTest_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- rUdf_uid85_fpAddTest(BITSELECT,84)@7
    rUdf_uid85_fpAddTest_b <= STD_LOGIC_VECTOR(expFracR_uid81_fpAddTest_q(17 downto 17));

    -- excRZeroVInC_uid89_fpAddTest(BITJOIN,88)@7
    excRZeroVInC_uid89_fpAddTest_q <= aMinusA_uid77_fpAddTest_q & rUdf_uid85_fpAddTest_b & regInputs_uid88_fpAddTest_q & redist20_excZ_bSig_uid17_uid37_fpAddTest_q_6_q & excZ_aSig_uid16_uid23_fpAddTest_q;

    -- excRZero_uid90_fpAddTest(LOOKUP,89)@7 + 1
    excRZero_uid90_fpAddTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            excRZero_uid90_fpAddTest_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (excRZeroVInC_uid89_fpAddTest_q) IS
                WHEN "00000" => excRZero_uid90_fpAddTest_q <= "0";
                WHEN "00001" => excRZero_uid90_fpAddTest_q <= "0";
                WHEN "00010" => excRZero_uid90_fpAddTest_q <= "0";
                WHEN "00011" => excRZero_uid90_fpAddTest_q <= "1";
                WHEN "00100" => excRZero_uid90_fpAddTest_q <= "0";
                WHEN "00101" => excRZero_uid90_fpAddTest_q <= "0";
                WHEN "00110" => excRZero_uid90_fpAddTest_q <= "0";
                WHEN "00111" => excRZero_uid90_fpAddTest_q <= "0";
                WHEN "01000" => excRZero_uid90_fpAddTest_q <= "0";
                WHEN "01001" => excRZero_uid90_fpAddTest_q <= "0";
                WHEN "01010" => excRZero_uid90_fpAddTest_q <= "0";
                WHEN "01011" => excRZero_uid90_fpAddTest_q <= "1";
                WHEN "01100" => excRZero_uid90_fpAddTest_q <= "1";
                WHEN "01101" => excRZero_uid90_fpAddTest_q <= "0";
                WHEN "01110" => excRZero_uid90_fpAddTest_q <= "0";
                WHEN "01111" => excRZero_uid90_fpAddTest_q <= "0";
                WHEN "10000" => excRZero_uid90_fpAddTest_q <= "0";
                WHEN "10001" => excRZero_uid90_fpAddTest_q <= "0";
                WHEN "10010" => excRZero_uid90_fpAddTest_q <= "0";
                WHEN "10011" => excRZero_uid90_fpAddTest_q <= "1";
                WHEN "10100" => excRZero_uid90_fpAddTest_q <= "1";
                WHEN "10101" => excRZero_uid90_fpAddTest_q <= "0";
                WHEN "10110" => excRZero_uid90_fpAddTest_q <= "0";
                WHEN "10111" => excRZero_uid90_fpAddTest_q <= "0";
                WHEN "11000" => excRZero_uid90_fpAddTest_q <= "0";
                WHEN "11001" => excRZero_uid90_fpAddTest_q <= "0";
                WHEN "11010" => excRZero_uid90_fpAddTest_q <= "0";
                WHEN "11011" => excRZero_uid90_fpAddTest_q <= "1";
                WHEN "11100" => excRZero_uid90_fpAddTest_q <= "1";
                WHEN "11101" => excRZero_uid90_fpAddTest_q <= "0";
                WHEN "11110" => excRZero_uid90_fpAddTest_q <= "0";
                WHEN "11111" => excRZero_uid90_fpAddTest_q <= "0";
                WHEN OTHERS => -- unreachable
                               excRZero_uid90_fpAddTest_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;

    -- concExc_uid97_fpAddTest(BITJOIN,96)@8
    concExc_uid97_fpAddTest_q <= excRNaN_uid96_fpAddTest_q & excRInf_uid93_fpAddTest_q & excRZero_uid90_fpAddTest_q;

    -- excREnc_uid98_fpAddTest(LOOKUP,97)@8 + 1
    excREnc_uid98_fpAddTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            excREnc_uid98_fpAddTest_q <= "01";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (concExc_uid97_fpAddTest_q) IS
                WHEN "000" => excREnc_uid98_fpAddTest_q <= "01";
                WHEN "001" => excREnc_uid98_fpAddTest_q <= "00";
                WHEN "010" => excREnc_uid98_fpAddTest_q <= "10";
                WHEN "011" => excREnc_uid98_fpAddTest_q <= "10";
                WHEN "100" => excREnc_uid98_fpAddTest_q <= "11";
                WHEN "101" => excREnc_uid98_fpAddTest_q <= "11";
                WHEN "110" => excREnc_uid98_fpAddTest_q <= "11";
                WHEN "111" => excREnc_uid98_fpAddTest_q <= "11";
                WHEN OTHERS => -- unreachable
                               excREnc_uid98_fpAddTest_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;

    -- expRPostExc_uid117_fpAddTest(MUX,116)@9
    expRPostExc_uid117_fpAddTest_s <= excREnc_uid98_fpAddTest_q;
    expRPostExc_uid117_fpAddTest_combproc: PROCESS (expRPostExc_uid117_fpAddTest_s, cstAllZWE_uid20_fpAddTest_q, redist6_expRPreExc_uid87_fpAddTest_b_2_q, cstAllOWE_uid18_fpAddTest_q)
    BEGIN
        CASE (expRPostExc_uid117_fpAddTest_s) IS
            WHEN "00" => expRPostExc_uid117_fpAddTest_q <= cstAllZWE_uid20_fpAddTest_q;
            WHEN "01" => expRPostExc_uid117_fpAddTest_q <= redist6_expRPreExc_uid87_fpAddTest_b_2_q;
            WHEN "10" => expRPostExc_uid117_fpAddTest_q <= cstAllOWE_uid18_fpAddTest_q;
            WHEN "11" => expRPostExc_uid117_fpAddTest_q <= cstAllOWE_uid18_fpAddTest_q;
            WHEN OTHERS => expRPostExc_uid117_fpAddTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- oneFracRPostExc2_uid110_fpAddTest(CONSTANT,109)
    oneFracRPostExc2_uid110_fpAddTest_q <= "0000000001";

    -- fracRPreExc_uid86_fpAddTest(BITSELECT,85)@7
    fracRPreExc_uid86_fpAddTest_in <= expFracR_uid81_fpAddTest_q(10 downto 0);
    fracRPreExc_uid86_fpAddTest_b <= fracRPreExc_uid86_fpAddTest_in(10 downto 1);

    -- redist7_fracRPreExc_uid86_fpAddTest_b_2(DELAY,230)
    redist7_fracRPreExc_uid86_fpAddTest_b_2 : dspba_delay
    GENERIC MAP ( width => 10, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracRPreExc_uid86_fpAddTest_b, xout => redist7_fracRPreExc_uid86_fpAddTest_b_2_q, clk => clk, aclr => areset );

    -- fracRPostExc_uid113_fpAddTest(MUX,112)@9
    fracRPostExc_uid113_fpAddTest_s <= excREnc_uid98_fpAddTest_q;
    fracRPostExc_uid113_fpAddTest_combproc: PROCESS (fracRPostExc_uid113_fpAddTest_s, cstZeroWF_uid19_fpAddTest_q, redist7_fracRPreExc_uid86_fpAddTest_b_2_q, oneFracRPostExc2_uid110_fpAddTest_q)
    BEGIN
        CASE (fracRPostExc_uid113_fpAddTest_s) IS
            WHEN "00" => fracRPostExc_uid113_fpAddTest_q <= cstZeroWF_uid19_fpAddTest_q;
            WHEN "01" => fracRPostExc_uid113_fpAddTest_q <= redist7_fracRPreExc_uid86_fpAddTest_b_2_q;
            WHEN "10" => fracRPostExc_uid113_fpAddTest_q <= cstZeroWF_uid19_fpAddTest_q;
            WHEN "11" => fracRPostExc_uid113_fpAddTest_q <= oneFracRPostExc2_uid110_fpAddTest_q;
            WHEN OTHERS => fracRPostExc_uid113_fpAddTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- R_uid118_fpAddTest(BITJOIN,117)@9
    R_uid118_fpAddTest_q <= signRPostExc_uid109_fpAddTest_q & expRPostExc_uid117_fpAddTest_q & fracRPostExc_uid113_fpAddTest_q;

    -- xOut(GPOUT,4)@9
    q <= R_uid118_fpAddTest_q;

END normal;
