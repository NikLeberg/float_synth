library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity fadd16_base is
  generic (
    N_STAGES: natural := 8
  );
  port (
    clk: in std_logic;
    a, b: in std_logic_vector (15 downto 0);
    y: out std_logic_vector (15 downto 0)
  );
end entity;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

architecture rtl of fadd16_base is
  signal wrap_clk: std_logic;
  subtype typwrap_a is std_logic_vector (15 downto 0);
  signal wrap_a: typwrap_a;
  subtype typwrap_b is std_logic_vector (15 downto 0);
  signal wrap_b: typwrap_b;
  subtype typwrap_y is std_logic_vector (15 downto 0);
  signal wrap_y: typwrap_y;
  constant n1_o : std_logic_vector (143 downto 0) := "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
  signal ffy : std_logic_vector (143 downto 0);
  signal n76_o : std_logic_vector (4 downto 0);
  signal n77_o : std_logic;
  signal n78_o : std_logic;
  signal n80_o : std_logic_vector (9 downto 0);
  signal n92_o : std_logic;
  signal n93_o : std_logic;
  signal n94_o : std_logic;
  signal n95_o : std_logic;
  signal n98_o : std_logic_vector (3 downto 0);
  signal n99_o : std_logic;
  signal n100_o : std_logic;
  signal n103_o : std_logic_vector (3 downto 0);
  signal n104_o : std_logic_vector (3 downto 0);
  signal n105_o : std_logic;
  signal n106_o : std_logic;
  signal n109_o : std_logic_vector (3 downto 0);
  signal n110_o : std_logic_vector (3 downto 0);
  signal n111_o : std_logic_vector (3 downto 0);
  signal n143_o : std_logic_vector (4 downto 0);
  signal n144_o : std_logic;
  signal n145_o : std_logic;
  signal n147_o : std_logic_vector (9 downto 0);
  signal n159_o : std_logic;
  signal n160_o : std_logic;
  signal n161_o : std_logic;
  signal n162_o : std_logic;
  signal n165_o : std_logic_vector (3 downto 0);
  signal n166_o : std_logic;
  signal n167_o : std_logic;
  signal n170_o : std_logic_vector (3 downto 0);
  signal n171_o : std_logic_vector (3 downto 0);
  signal n172_o : std_logic;
  signal n173_o : std_logic;
  signal n176_o : std_logic_vector (3 downto 0);
  signal n177_o : std_logic_vector (3 downto 0);
  signal n178_o : std_logic_vector (3 downto 0);
  signal n181_o : std_logic;
  signal n183_o : std_logic;
  signal n184_o : std_logic;
  signal n186_o : std_logic;
  signal n188_o : std_logic;
  signal n189_o : std_logic;
  signal n191_o : std_logic;
  signal n192_o : std_logic;
  signal n194_o : std_logic;
  signal n195_o : std_logic;
  signal n197_o : std_logic;
  signal n199_o : std_logic;
  signal n200_o : std_logic;
  signal n201_o : std_logic;
  signal n203_o : std_logic;
  signal n205_o : std_logic;
  signal n206_o : std_logic;
  signal n207_o : std_logic;
  signal n210_o : std_logic;
  signal n212_o : std_logic;
  signal n213_o : std_logic;
  signal n216_o : std_logic;
  signal n218_o : std_logic;
  signal n219_o : std_logic;
  signal n222_o : std_logic;
  signal n224_o : std_logic;
  signal n225_o : std_logic;
  signal n331_o : std_logic_vector (5 downto 0);
  signal n334_o : std_logic_vector (9 downto 0);
  signal n335_o : std_logic_vector (15 downto 0);
  signal n366_o : std_logic_vector (4 downto 0);
  signal n367_o : std_logic;
  signal n368_o : std_logic;
  signal n370_o : std_logic_vector (9 downto 0);
  signal n382_o : std_logic;
  signal n383_o : std_logic;
  signal n384_o : std_logic;
  signal n385_o : std_logic;
  signal n388_o : std_logic_vector (3 downto 0);
  signal n389_o : std_logic;
  signal n390_o : std_logic;
  signal n393_o : std_logic_vector (3 downto 0);
  signal n394_o : std_logic_vector (3 downto 0);
  signal n395_o : std_logic;
  signal n396_o : std_logic;
  signal n399_o : std_logic_vector (3 downto 0);
  signal n400_o : std_logic_vector (3 downto 0);
  signal n401_o : std_logic_vector (3 downto 0);
  signal n506_o : std_logic_vector (5 downto 0);
  signal n509_o : std_logic_vector (9 downto 0);
  signal n510_o : std_logic_vector (15 downto 0);
  signal n541_o : std_logic_vector (4 downto 0);
  signal n542_o : std_logic;
  signal n543_o : std_logic;
  signal n545_o : std_logic_vector (9 downto 0);
  signal n557_o : std_logic;
  signal n558_o : std_logic;
  signal n559_o : std_logic;
  signal n560_o : std_logic;
  signal n563_o : std_logic_vector (3 downto 0);
  signal n564_o : std_logic;
  signal n565_o : std_logic;
  signal n568_o : std_logic_vector (3 downto 0);
  signal n569_o : std_logic_vector (3 downto 0);
  signal n570_o : std_logic;
  signal n571_o : std_logic;
  signal n574_o : std_logic_vector (3 downto 0);
  signal n575_o : std_logic_vector (3 downto 0);
  signal n576_o : std_logic_vector (3 downto 0);
  signal n585_o : std_logic_vector (9 downto 0);
  signal n599_o : std_logic;
  signal n601_o : std_logic;
  signal n602_o : std_logic;
  signal n605_o : std_logic;
  signal n607_o : std_logic;
  signal n608_o : std_logic;
  signal n610_o : std_logic_vector (4 downto 0);
  signal n611_o : std_logic;
  signal n612_o : std_logic;
  signal n613_o : std_logic_vector (3 downto 0);
  signal n615_o : std_logic;
  signal n617_o : std_logic;
  signal n618_o : std_logic;
  signal n620_o : std_logic;
  signal n621_o : std_logic;
  signal n623_o : std_logic;
  signal n624_o : std_logic;
  signal n626_o : std_logic_vector (2 downto 0);
  signal n627_o : std_logic;
  signal n631_o : std_logic_vector (3 downto 0);
  signal n635_o : std_logic;
  signal n638_o : std_logic_vector (4 downto 0);
  signal n639_o : std_logic_vector (10 downto 0);
  constant n640_o : std_logic_vector (13 downto 0) := "00000000000000";
  signal n641_o : std_logic;
  signal n642_o : std_logic_vector (1 downto 0);
  signal n651_o : std_logic_vector (9 downto 0);
  signal n665_o : std_logic;
  signal n667_o : std_logic;
  signal n668_o : std_logic;
  signal n671_o : std_logic;
  signal n673_o : std_logic;
  signal n674_o : std_logic;
  signal n676_o : std_logic_vector (4 downto 0);
  signal n677_o : std_logic;
  signal n678_o : std_logic;
  signal n679_o : std_logic_vector (3 downto 0);
  signal n681_o : std_logic;
  signal n683_o : std_logic;
  signal n684_o : std_logic;
  signal n686_o : std_logic;
  signal n687_o : std_logic;
  signal n689_o : std_logic;
  signal n690_o : std_logic;
  signal n692_o : std_logic_vector (2 downto 0);
  signal n693_o : std_logic;
  signal n697_o : std_logic_vector (3 downto 0);
  signal n701_o : std_logic;
  signal n704_o : std_logic_vector (4 downto 0);
  signal n705_o : std_logic_vector (10 downto 0);
  constant n706_o : std_logic_vector (13 downto 0) := "00000000000000";
  signal n707_o : std_logic;
  signal n708_o : std_logic_vector (1 downto 0);
  signal n709_o : std_logic;
  signal n710_o : std_logic_vector (5 downto 0);
  signal n711_o : std_logic_vector (5 downto 0);
  signal n712_o : std_logic_vector (5 downto 0);
  signal n714_o : std_logic;
  signal n715_o : std_logic;
  signal n716_o : std_logic_vector (5 downto 0);
  signal n717_o : std_logic_vector (13 downto 0);
  signal n718_o : std_logic_vector (13 downto 0);
  signal n719_o : std_logic;
  signal n721_o : std_logic;
  signal n722_o : std_logic_vector (5 downto 0);
  signal n724_o : std_logic_vector (30 downto 0);
  signal n725_o : std_logic_vector (13 downto 0);
  signal n726_o : std_logic_vector (13 downto 0);
  signal n727_o : std_logic_vector (13 downto 0);
  signal n728_o : std_logic;
  signal n729_o : std_logic_vector (5 downto 0);
  signal n732_o : std_logic_vector (30 downto 0);
  signal n738_o : std_logic_vector (3 downto 0);
  signal n740_o : std_logic_vector (13 downto 0);
  signal n743_o : std_logic_vector (31 downto 0);
  signal n745_o : std_logic;
  signal n746_o : std_logic_vector (13 downto 0);
  signal n747_o : std_logic;
  signal n748_o : std_logic;
  signal n749_o : std_logic;
  signal n750_o : std_logic_vector (31 downto 0);
  signal n752_o : std_logic;
  signal n753_o : std_logic_vector (13 downto 0);
  signal n754_o : std_logic;
  signal n755_o : std_logic;
  signal n756_o : std_logic;
  signal n757_o : std_logic_vector (31 downto 0);
  signal n759_o : std_logic;
  signal n760_o : std_logic_vector (13 downto 0);
  signal n761_o : std_logic;
  signal n762_o : std_logic;
  signal n763_o : std_logic;
  signal n764_o : std_logic_vector (31 downto 0);
  signal n766_o : std_logic;
  signal n767_o : std_logic_vector (13 downto 0);
  signal n768_o : std_logic;
  signal n769_o : std_logic;
  signal n770_o : std_logic;
  signal n771_o : std_logic_vector (31 downto 0);
  signal n773_o : std_logic;
  signal n774_o : std_logic_vector (13 downto 0);
  signal n775_o : std_logic;
  signal n776_o : std_logic;
  signal n777_o : std_logic;
  signal n778_o : std_logic_vector (31 downto 0);
  signal n780_o : std_logic;
  signal n781_o : std_logic_vector (13 downto 0);
  signal n782_o : std_logic;
  signal n783_o : std_logic;
  signal n784_o : std_logic;
  signal n785_o : std_logic_vector (31 downto 0);
  signal n787_o : std_logic;
  signal n788_o : std_logic_vector (13 downto 0);
  signal n789_o : std_logic;
  signal n790_o : std_logic;
  signal n791_o : std_logic;
  signal n792_o : std_logic_vector (31 downto 0);
  signal n794_o : std_logic;
  signal n795_o : std_logic_vector (13 downto 0);
  signal n796_o : std_logic;
  signal n797_o : std_logic;
  signal n798_o : std_logic;
  signal n799_o : std_logic_vector (31 downto 0);
  signal n801_o : std_logic;
  signal n802_o : std_logic_vector (13 downto 0);
  signal n803_o : std_logic;
  signal n804_o : std_logic;
  signal n805_o : std_logic;
  signal n806_o : std_logic_vector (31 downto 0);
  signal n808_o : std_logic;
  signal n809_o : std_logic_vector (13 downto 0);
  signal n810_o : std_logic;
  signal n811_o : std_logic;
  signal n812_o : std_logic;
  signal n813_o : std_logic_vector (31 downto 0);
  signal n815_o : std_logic;
  signal n816_o : std_logic_vector (13 downto 0);
  signal n817_o : std_logic;
  signal n818_o : std_logic;
  signal n819_o : std_logic;
  signal n820_o : std_logic_vector (31 downto 0);
  signal n822_o : std_logic;
  signal n823_o : std_logic_vector (13 downto 0);
  signal n824_o : std_logic;
  signal n825_o : std_logic;
  signal n826_o : std_logic;
  signal n827_o : std_logic_vector (31 downto 0);
  signal n829_o : std_logic;
  signal n830_o : std_logic_vector (13 downto 0);
  signal n831_o : std_logic;
  signal n832_o : std_logic;
  signal n833_o : std_logic;
  signal n834_o : std_logic_vector (31 downto 0);
  signal n836_o : std_logic;
  signal n837_o : std_logic_vector (13 downto 0);
  signal n838_o : std_logic;
  signal n839_o : std_logic;
  signal n840_o : std_logic;
  signal n842_o : std_logic;
  signal n843_o : std_logic;
  signal n844_o : std_logic_vector (5 downto 0);
  signal n845_o : std_logic_vector (13 downto 0);
  signal n846_o : std_logic_vector (13 downto 0);
  signal n847_o : std_logic;
  signal n848_o : std_logic_vector (13 downto 0);
  signal n849_o : std_logic_vector (13 downto 0);
  signal n850_o : std_logic_vector (13 downto 0);
  signal n851_o : std_logic_vector (13 downto 0);
  signal n852_o : std_logic_vector (13 downto 0);
  signal n853_o : std_logic_vector (13 downto 0);
  signal n856_o : std_logic;
  signal n858_o : std_logic;
  signal n859_o : std_logic;
  signal n860_o : std_logic_vector (5 downto 0);
  signal n861_o : std_logic_vector (13 downto 0);
  signal n862_o : std_logic_vector (13 downto 0);
  signal n863_o : std_logic;
  signal n865_o : std_logic;
  signal n867_o : std_logic_vector (30 downto 0);
  signal n868_o : std_logic_vector (13 downto 0);
  signal n869_o : std_logic_vector (13 downto 0);
  signal n870_o : std_logic_vector (13 downto 0);
  signal n871_o : std_logic;
  signal n872_o : std_logic_vector (5 downto 0);
  signal n875_o : std_logic_vector (30 downto 0);
  signal n881_o : std_logic_vector (3 downto 0);
  signal n883_o : std_logic_vector (13 downto 0);
  signal n886_o : std_logic_vector (31 downto 0);
  signal n888_o : std_logic;
  signal n889_o : std_logic_vector (13 downto 0);
  signal n890_o : std_logic;
  signal n891_o : std_logic;
  signal n892_o : std_logic;
  signal n893_o : std_logic_vector (31 downto 0);
  signal n895_o : std_logic;
  signal n896_o : std_logic_vector (13 downto 0);
  signal n897_o : std_logic;
  signal n898_o : std_logic;
  signal n899_o : std_logic;
  signal n900_o : std_logic_vector (31 downto 0);
  signal n902_o : std_logic;
  signal n903_o : std_logic_vector (13 downto 0);
  signal n904_o : std_logic;
  signal n905_o : std_logic;
  signal n906_o : std_logic;
  signal n907_o : std_logic_vector (31 downto 0);
  signal n909_o : std_logic;
  signal n910_o : std_logic_vector (13 downto 0);
  signal n911_o : std_logic;
  signal n912_o : std_logic;
  signal n913_o : std_logic;
  signal n914_o : std_logic_vector (31 downto 0);
  signal n916_o : std_logic;
  signal n917_o : std_logic_vector (13 downto 0);
  signal n918_o : std_logic;
  signal n919_o : std_logic;
  signal n920_o : std_logic;
  signal n921_o : std_logic_vector (31 downto 0);
  signal n923_o : std_logic;
  signal n924_o : std_logic_vector (13 downto 0);
  signal n925_o : std_logic;
  signal n926_o : std_logic;
  signal n927_o : std_logic;
  signal n928_o : std_logic_vector (31 downto 0);
  signal n930_o : std_logic;
  signal n931_o : std_logic_vector (13 downto 0);
  signal n932_o : std_logic;
  signal n933_o : std_logic;
  signal n934_o : std_logic;
  signal n935_o : std_logic_vector (31 downto 0);
  signal n937_o : std_logic;
  signal n938_o : std_logic_vector (13 downto 0);
  signal n939_o : std_logic;
  signal n940_o : std_logic;
  signal n941_o : std_logic;
  signal n942_o : std_logic_vector (31 downto 0);
  signal n944_o : std_logic;
  signal n945_o : std_logic_vector (13 downto 0);
  signal n946_o : std_logic;
  signal n947_o : std_logic;
  signal n948_o : std_logic;
  signal n949_o : std_logic_vector (31 downto 0);
  signal n951_o : std_logic;
  signal n952_o : std_logic_vector (13 downto 0);
  signal n953_o : std_logic;
  signal n954_o : std_logic;
  signal n955_o : std_logic;
  signal n956_o : std_logic_vector (31 downto 0);
  signal n958_o : std_logic;
  signal n959_o : std_logic_vector (13 downto 0);
  signal n960_o : std_logic;
  signal n961_o : std_logic;
  signal n962_o : std_logic;
  signal n963_o : std_logic_vector (31 downto 0);
  signal n965_o : std_logic;
  signal n966_o : std_logic_vector (13 downto 0);
  signal n967_o : std_logic;
  signal n968_o : std_logic;
  signal n969_o : std_logic;
  signal n970_o : std_logic_vector (31 downto 0);
  signal n972_o : std_logic;
  signal n973_o : std_logic_vector (13 downto 0);
  signal n974_o : std_logic;
  signal n975_o : std_logic;
  signal n976_o : std_logic;
  signal n977_o : std_logic_vector (31 downto 0);
  signal n979_o : std_logic;
  signal n980_o : std_logic_vector (13 downto 0);
  signal n981_o : std_logic;
  signal n982_o : std_logic;
  signal n983_o : std_logic;
  signal n985_o : std_logic_vector (13 downto 0);
  constant n986_o : std_logic_vector (13 downto 0) := (13 downto 0 => 'X');
  signal n987_o : std_logic_vector (13 downto 0);
  signal n989_o : std_logic_vector (5 downto 0);
  signal n992_o : std_logic;
  signal n994_o : std_logic;
  signal n995_o : std_logic_vector (13 downto 0);
  constant n996_o : std_logic_vector (13 downto 0) := "00000000000000";
  signal n997_o : std_logic_vector (13 downto 0);
  signal n998_o : std_logic_vector (5 downto 0);
  signal n1000_o : std_logic;
  signal n1001_o : std_logic;
  signal n1002_o : std_logic_vector (13 downto 0);
  signal n1003_o : std_logic_vector (13 downto 0);
  signal n1004_o : std_logic_vector (5 downto 0);
  signal n1005_o : std_logic;
  signal n1007_o : std_logic;
  signal n1008_o : std_logic_vector (13 downto 0);
  signal n1009_o : std_logic_vector (13 downto 0);
  signal n1010_o : std_logic_vector (5 downto 0);
  signal n1013_o : std_logic;
  signal n1014_o : std_logic;
  signal n1015_o : std_logic_vector (13 downto 0);
  constant n1016_o : std_logic_vector (13 downto 0) := "00000000000000";
  signal n1017_o : std_logic_vector (13 downto 0);
  signal n1018_o : std_logic_vector (5 downto 0);
  signal n1021_o : std_logic;
  signal n1022_o : std_logic;
  signal n1023_o : std_logic;
  signal n1024_o : std_logic;
  signal n1025_o : std_logic_vector (12 downto 0);
  signal n1026_o : std_logic_vector (12 downto 0);
  signal n1027_o : std_logic_vector (12 downto 0);
  signal n1028_o : std_logic_vector (12 downto 0);
  signal n1029_o : std_logic_vector (12 downto 0);
  signal n1030_o : std_logic_vector (12 downto 0);
  signal n1031_o : std_logic_vector (12 downto 0);
  signal n1032_o : std_logic_vector (12 downto 0);
  signal n1033_o : std_logic_vector (12 downto 0);
  signal n1034_o : std_logic_vector (12 downto 0);
  signal n1035_o : std_logic_vector (12 downto 0);
  signal n1036_o : std_logic_vector (12 downto 0);
  signal n1037_o : std_logic_vector (12 downto 0);
  signal n1038_o : std_logic;
  signal n1039_o : std_logic;
  signal n1040_o : std_logic;
  signal n1041_o : std_logic_vector (13 downto 0);
  signal n1042_o : std_logic_vector (13 downto 0);
  signal n1043_o : std_logic;
  signal n1044_o : std_logic_vector (13 downto 0);
  signal n1045_o : std_logic_vector (13 downto 0);
  signal n1046_o : std_logic;
  signal n1047_o : std_logic;
  signal n1048_o : std_logic;
  signal n1049_o : std_logic_vector (13 downto 0);
  signal n1050_o : std_logic;
  signal n1051_o : std_logic;
  signal n1052_o : std_logic;
  signal n1054_o : std_logic;
  signal n1074_o : std_logic;
  signal n1075_o : std_logic;
  signal n1077_o : std_logic_vector (4 downto 0);
  signal n1078_o : std_logic;
  signal n1079_o : std_logic;
  signal n1081_o : std_logic_vector (4 downto 0);
  signal n1082_o : std_logic;
  signal n1083_o : std_logic;
  signal n1085_o : std_logic_vector (4 downto 0);
  signal n1086_o : std_logic;
  signal n1087_o : std_logic;
  signal n1089_o : std_logic_vector (4 downto 0);
  signal n1090_o : std_logic;
  signal n1091_o : std_logic;
  signal n1093_o : std_logic_vector (4 downto 0);
  signal n1094_o : std_logic;
  signal n1095_o : std_logic;
  signal n1097_o : std_logic_vector (4 downto 0);
  signal n1098_o : std_logic;
  signal n1099_o : std_logic;
  signal n1101_o : std_logic_vector (4 downto 0);
  signal n1102_o : std_logic;
  signal n1103_o : std_logic;
  signal n1105_o : std_logic_vector (4 downto 0);
  signal n1106_o : std_logic;
  signal n1107_o : std_logic;
  signal n1109_o : std_logic_vector (4 downto 0);
  signal n1110_o : std_logic;
  signal n1111_o : std_logic;
  signal n1113_o : std_logic_vector (4 downto 0);
  signal n1114_o : std_logic;
  signal n1115_o : std_logic;
  signal n1117_o : std_logic_vector (4 downto 0);
  signal n1118_o : std_logic;
  signal n1119_o : std_logic;
  signal n1121_o : std_logic_vector (4 downto 0);
  signal n1122_o : std_logic;
  signal n1123_o : std_logic;
  signal n1125_o : std_logic_vector (4 downto 0);
  signal n1126_o : std_logic;
  signal n1127_o : std_logic;
  signal n1129_o : std_logic_vector (4 downto 0);
  signal n1130_o : std_logic_vector (31 downto 0);
  signal n1132_o : std_logic_vector (31 downto 0);
  signal n1134_o : std_logic_vector (31 downto 0);
  signal n1136_o : std_logic_vector (6 downto 0);
  signal n1137_o : std_logic_vector (6 downto 0);
  signal n1138_o : std_logic_vector (6 downto 0);
  signal n1140_o : std_logic;
  signal n1141_o : std_logic;
  signal n1143_o : std_logic;
  signal n1145_o : std_logic;
  signal n1149_o : std_logic;
  signal n1151_o : std_logic;
  signal n1153_o : std_logic;
  signal n1156_o : std_logic_vector (5 downto 0);
  signal n1157_o : std_logic_vector (31 downto 0);
  signal n1158_o : std_logic_vector (31 downto 0);
  constant n1159_o : std_logic_vector (6 downto 0) := "1110000";
  signal n1160_o : std_logic_vector (6 downto 0);
  signal n1161_o : std_logic_vector (31 downto 0);
  signal n1164_o : std_logic;
  signal n1167_o : std_logic;
  signal n1170_o : std_logic;
  signal n1171_o : std_logic;
  signal n1172_o : std_logic;
  signal n1174_o : std_logic;
  signal n1176_o : std_logic;
  signal n1177_o : std_logic_vector (6 downto 0);
  signal n1178_o : std_logic_vector (31 downto 0);
  signal n1180_o : std_logic;
  signal n1183_o : std_logic;
  signal n1187_o : std_logic_vector (13 downto 0);
  signal n1188_o : std_logic_vector (31 downto 0);
  signal n1189_o : std_logic_vector (13 downto 0);
  signal n1190_o : std_logic;
  signal n1191_o : std_logic_vector (13 downto 0);
  signal n1307_o : std_logic_vector (9 downto 0);
  signal n1312_o : std_logic;
  signal n1314_o : std_logic_vector (6 downto 0);
  signal n1316_o : std_logic_vector (9 downto 0);
  signal n1318_o : std_logic_vector (9 downto 0);
  signal n1319_o : std_logic_vector (6 downto 0);
  signal n1320_o : std_logic_vector (9 downto 0);
  signal n1321_o : std_logic_vector (9 downto 0);
  signal n1322_o : std_logic;
  signal n1323_o : std_logic_vector (4 downto 0);
  signal n1324_o : std_logic;
  signal n1325_o : std_logic;
  signal n1326_o : std_logic_vector (3 downto 0);
  signal n1327_o : std_logic_vector (3 downto 0);
  signal n1328_o : std_logic_vector (3 downto 0);
  signal n1329_o : std_logic_vector (3 downto 0);
  signal n1330_o : std_logic_vector (3 downto 0);
  signal n1331_o : std_logic_vector (3 downto 0);
  signal n1332_o : std_logic_vector (3 downto 0);
  signal n1333_o : std_logic_vector (4 downto 0);
  signal n1343_o : std_logic_vector (14 downto 0);
  signal n1345_o : std_logic_vector (14 downto 0);
  signal n1348_o : std_logic;
  signal n1365_o : std_logic_vector (15 downto 0);
  constant n1366_o : std_logic_vector (15 downto 0) := "0000000000000000";
  signal n1375_o : std_logic_vector (14 downto 0);
  signal n1376_o : std_logic_vector (14 downto 0);
  signal n1377_o : std_logic_vector (14 downto 0);
  signal n1378_o : std_logic_vector (15 downto 0);
  signal n1382_o : std_logic_vector (15 downto 0);
  signal n1421_o : std_logic_vector (15 downto 0);
  signal n1457_o : std_logic_vector (15 downto 0);
  signal n1493_o : std_logic_vector (15 downto 0);
  signal n1529_o : std_logic_vector (15 downto 0);
  signal n1580_o : std_logic_vector (127 downto 0);
  signal n1584_o : std_logic_vector (15 downto 0);
  signal n1596_o : std_logic_vector (127 downto 0);
  signal n1597_q : std_logic_vector (127 downto 0) := n1_o (143 downto 16);
  signal n1598_o : std_logic_vector (143 downto 0);
  signal n1599_o : std_logic;
  signal n1600_o : std_logic;
  signal n1601_o : std_logic;
  signal n1602_o : std_logic;
  signal n1603_o : std_logic;
  signal n1604_o : std_logic;
  signal n1605_o : std_logic;
  signal n1606_o : std_logic;
  signal n1607_o : std_logic;
  signal n1608_o : std_logic;
  signal n1609_o : std_logic;
  signal n1610_o : std_logic;
  signal n1611_o : std_logic;
  signal n1612_o : std_logic;
  signal n1613_o : std_logic_vector (1 downto 0);
  signal n1614_o : std_logic;
  signal n1615_o : std_logic_vector (1 downto 0);
  signal n1616_o : std_logic;
  signal n1617_o : std_logic_vector (1 downto 0);
  signal n1618_o : std_logic;
  signal n1619_o : std_logic;
  signal n1620_o : std_logic;
  signal n1621_o : std_logic_vector (1 downto 0);
  signal n1622_o : std_logic;
  signal n1623_o : std_logic;
  signal n1624_o : std_logic;
  signal n1625_o : std_logic;
  signal n1626_o : std_logic;
  signal n1627_o : std_logic;
  signal n1628_o : std_logic;
  signal n1629_o : std_logic;
  signal n1630_o : std_logic;
  signal n1631_o : std_logic;
  signal n1632_o : std_logic;
  signal n1633_o : std_logic;
  signal n1634_o : std_logic;
  signal n1635_o : std_logic;
  signal n1636_o : std_logic;
  signal n1637_o : std_logic_vector (1 downto 0);
  signal n1638_o : std_logic;
  signal n1639_o : std_logic_vector (1 downto 0);
  signal n1640_o : std_logic;
  signal n1641_o : std_logic_vector (1 downto 0);
  signal n1642_o : std_logic;
  signal n1643_o : std_logic;
  signal n1644_o : std_logic;
  signal n1645_o : std_logic_vector (1 downto 0);
  signal n1646_o : std_logic;
begin
  wrap_clk <= clk;
  wrap_a <= typwrap_a(a);
  wrap_b <= typwrap_b(b);
  y <= std_logic_vector(wrap_y);
  wrap_y <= n1584_o;
  -- ../src/fadd16.vhd:30:10
  ffy <= n1598_o; -- (isignal)
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:606:37
  n76_o <= wrap_a (14 downto 10);
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:606:11
  n77_o <= '1' when n76_o /= (4 downto 0 => '0') else '0';
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:607:7
  n78_o <= not n77_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:608:26
  n80_o <= wrap_a (9 downto 0);
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:608:10
  n92_o <= '1' when n80_o /= (9 downto 0 => '0') else '0';
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:609:9
  n93_o <= not n92_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:610:15
  n94_o <= wrap_a (15);
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:610:32
  n95_o <= not n94_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:610:9
  n98_o <= "0101" when n95_o = '0' else "0110";
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:616:15
  n99_o <= wrap_a (15);
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:616:32
  n100_o <= not n99_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:616:9
  n103_o <= "0100" when n100_o = '0' else "0111";
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:608:7
  n104_o <= n103_o when n93_o = '0' else n98_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:623:13
  n105_o <= wrap_a (15);
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:623:30
  n106_o <= not n105_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:623:7
  n109_o <= "0011" when n106_o = '0' else "1000";
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:606:5
  n110_o <= n109_o when n78_o = '0' else n104_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:586:5
  n111_o <= n110_o when std_logic'('Z') = '0' else "1010";
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:606:37
  n143_o <= wrap_b (14 downto 10);
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:606:11
  n144_o <= '1' when n143_o /= (4 downto 0 => '0') else '0';
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:607:7
  n145_o <= not n144_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:608:26
  n147_o <= wrap_b (9 downto 0);
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:608:10
  n159_o <= '1' when n147_o /= (9 downto 0 => '0') else '0';
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:609:9
  n160_o <= not n159_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:610:15
  n161_o <= wrap_b (15);
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:610:32
  n162_o <= not n161_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:610:9
  n165_o <= "0101" when n162_o = '0' else "0110";
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:616:15
  n166_o <= wrap_b (15);
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:616:32
  n167_o <= not n166_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:616:9
  n170_o <= "0100" when n167_o = '0' else "0111";
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:608:7
  n171_o <= n170_o when n160_o = '0' else n165_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:623:13
  n172_o <= wrap_b (15);
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:623:30
  n173_o <= not n172_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:623:7
  n176_o <= "0011" when n173_o = '0' else "1000";
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:606:5
  n177_o <= n176_o when n145_o = '0' else n171_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:586:5
  n178_o <= n177_o when std_logic'('Z') = '0' else "1010";
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:736:17
  n181_o <= '1' when n111_o = "1010" else '0';
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:736:34
  n183_o <= '1' when n178_o = "1010" else '0';
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:736:23
  n184_o <= n181_o or n183_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:738:20
  n186_o <= '1' when n111_o = "0000" else '0';
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:738:37
  n188_o <= '1' when n111_o = "0001" else '0';
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:738:26
  n189_o <= n186_o or n188_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:739:20
  n191_o <= '1' when n178_o = "0000" else '0';
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:738:49
  n192_o <= n189_o or n191_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:739:37
  n194_o <= '1' when n178_o = "0001" else '0';
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:739:26
  n195_o <= n192_o or n194_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:741:19
  n197_o <= '1' when n111_o = "1001" else '0';
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:741:41
  n199_o <= '1' when n178_o = "0010" else '0';
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:741:29
  n200_o <= n199_o and n197_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:741:7
  n201_o <= n195_o or n200_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:742:19
  n203_o <= '1' when n111_o = "0010" else '0';
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:742:41
  n205_o <= '1' when n178_o = "1001" else '0';
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:742:29
  n206_o <= n205_o and n203_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:742:7
  n207_o <= n201_o or n206_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:746:20
  n210_o <= '1' when n111_o = "1001" else '0';
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:746:41
  n212_o <= '1' when n178_o = "1001" else '0';
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:746:30
  n213_o <= n210_o or n212_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:749:20
  n216_o <= '1' when n111_o = "0010" else '0';
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:749:41
  n218_o <= '1' when n178_o = "0010" else '0';
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:749:30
  n219_o <= n216_o or n218_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:752:20
  n222_o <= '1' when n111_o = "0101" else '0';
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:752:43
  n224_o <= '1' when n178_o = "0101" else '0';
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:752:31
  n225_o <= n224_o and n222_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:2459:49
  n331_o <= wrap_a (15 downto 10);
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:2467:15
  n334_o <= wrap_a (9 downto 0);
  n335_o <= n331_o & n334_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:606:37
  n366_o <= n335_o (14 downto 10);
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:606:11
  n367_o <= '1' when n366_o /= (4 downto 0 => '0') else '0';
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:607:7
  n368_o <= not n367_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:608:26
  n370_o <= n335_o (9 downto 0);
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:608:10
  n382_o <= '1' when n370_o /= (9 downto 0 => '0') else '0';
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:609:9
  n383_o <= not n382_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:610:15
  n384_o <= n335_o (15);
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:610:32
  n385_o <= not n384_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:610:9
  n388_o <= "0101" when n385_o = '0' else "0110";
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:616:15
  n389_o <= n335_o (15);
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:616:32
  n390_o <= not n389_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:616:9
  n393_o <= "0100" when n390_o = '0' else "0111";
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:608:7
  n394_o <= n393_o when n383_o = '0' else n388_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:623:13
  n395_o <= n335_o (15);
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:623:30
  n396_o <= not n395_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:623:7
  n399_o <= "0011" when n396_o = '0' else "1000";
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:606:5
  n400_o <= n399_o when n368_o = '0' else n394_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:586:5
  n401_o <= n400_o when std_logic'('Z') = '0' else "1010";
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:2459:49
  n506_o <= wrap_b (15 downto 10);
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:2467:15
  n509_o <= wrap_b (9 downto 0);
  n510_o <= n506_o & n509_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:606:37
  n541_o <= n510_o (14 downto 10);
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:606:11
  n542_o <= '1' when n541_o /= (4 downto 0 => '0') else '0';
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:607:7
  n543_o <= not n542_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:608:26
  n545_o <= n510_o (9 downto 0);
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:608:10
  n557_o <= '1' when n545_o /= (9 downto 0 => '0') else '0';
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:609:9
  n558_o <= not n557_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:610:15
  n559_o <= n510_o (15);
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:610:32
  n560_o <= not n559_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:610:9
  n563_o <= "0101" when n560_o = '0' else "0110";
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:616:15
  n564_o <= n510_o (15);
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:616:32
  n565_o <= not n564_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:616:9
  n568_o <= "0100" when n565_o = '0' else "0111";
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:608:7
  n569_o <= n568_o when n558_o = '0' else n563_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:623:13
  n570_o <= n510_o (15);
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:623:30
  n571_o <= not n570_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:623:7
  n574_o <= "0011" when n571_o = '0' else "1000";
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:606:5
  n575_o <= n574_o when n543_o = '0' else n569_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:586:5
  n576_o <= n575_o when std_logic'('Z') = '0' else "1010";
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:254:27
  n585_o <= n335_o (9 downto 0);
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:256:7
  n599_o <= '1' when n401_o = "0110" else '0';
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:256:21
  n601_o <= '1' when n401_o = "0101" else '0';
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:256:21
  n602_o <= n599_o or n601_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:259:7
  n605_o <= '1' when n401_o = "0111" else '0';
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:259:25
  n607_o <= '1' when n401_o = "0100" else '0';
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:259:25
  n608_o <= n605_o or n607_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:269:45
  n610_o <= n335_o (14 downto 10);
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:270:42
  n611_o <= n610_o (4);
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:270:35
  n612_o <= not n611_o;
  n613_o <= n335_o (13 downto 10);
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:267:7
  n615_o <= '1' when n401_o = "1000" else '0';
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:267:23
  n617_o <= '1' when n401_o = "0011" else '0';
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:267:23
  n618_o <= n615_o or n617_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:267:36
  n620_o <= '1' when n401_o = "1001" else '0';
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:267:36
  n621_o <= n618_o or n620_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:267:46
  n623_o <= '1' when n401_o = "0010" else '0';
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:267:46
  n624_o <= n621_o or n623_o;
  n626_o <= n624_o & n608_o & n602_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:255:5
  with n626_o select n627_o <=
    '1' when "100",
    '0' when "010",
    '0' when "001",
    '1' when others;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:255:5
  with n626_o select n631_o <=
    n613_o when "100",
    "0001" when "010",
    "0001" when "001",
    "1111" when others;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:255:5
  with n626_o select n635_o <=
    n612_o when "100",
    '1' when "010",
    '1' when "001",
    '1' when others;
  n638_o <= n635_o & n631_o;
  n639_o <= n627_o & n585_o;
  n641_o <= n640_o (13);
  n642_o <= n640_o (1 downto 0);
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:254:27
  n651_o <= n510_o (9 downto 0);
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:256:7
  n665_o <= '1' when n576_o = "0110" else '0';
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:256:21
  n667_o <= '1' when n576_o = "0101" else '0';
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:256:21
  n668_o <= n665_o or n667_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:259:7
  n671_o <= '1' when n576_o = "0111" else '0';
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:259:25
  n673_o <= '1' when n576_o = "0100" else '0';
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:259:25
  n674_o <= n671_o or n673_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:269:45
  n676_o <= n510_o (14 downto 10);
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:270:42
  n677_o <= n676_o (4);
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:270:35
  n678_o <= not n677_o;
  n679_o <= n510_o (13 downto 10);
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:267:7
  n681_o <= '1' when n576_o = "1000" else '0';
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:267:23
  n683_o <= '1' when n576_o = "0011" else '0';
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:267:23
  n684_o <= n681_o or n683_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:267:36
  n686_o <= '1' when n576_o = "1001" else '0';
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:267:36
  n687_o <= n684_o or n686_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:267:46
  n689_o <= '1' when n576_o = "0010" else '0';
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:267:46
  n690_o <= n687_o or n689_o;
  n692_o <= n690_o & n674_o & n668_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:255:5
  with n692_o select n693_o <=
    '1' when "100",
    '0' when "010",
    '0' when "001",
    '1' when others;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:255:5
  with n692_o select n697_o <=
    n679_o when "100",
    "0001" when "010",
    "0001" when "001",
    "1111" when others;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:255:5
  with n692_o select n701_o <=
    n678_o when "100",
    '1' when "010",
    '1' when "001",
    '1' when others;
  n704_o <= n701_o & n697_o;
  n705_o <= n693_o & n651_o;
  n707_o <= n706_o (13);
  n708_o <= n706_o (1 downto 0);
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:784:24
  n709_o <= n638_o (4);
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:784:43
  n710_o <= n709_o & n638_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:784:53
  n711_o <= std_logic_vector (resize (signed (n704_o), 6));  --  sext
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:784:53
  n712_o <= std_logic_vector (unsigned (n710_o) - unsigned (n711_o));
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:785:17
  n714_o <= '1' when signed (n712_o) < signed'("110011") else '0';
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:786:28
  n715_o <= n704_o (4);
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:786:47
  n716_o <= n715_o & n704_o;
  n717_o <= n707_o & n705_o & n708_o;
  n718_o <= n641_o & n639_o & n642_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:790:22
  n719_o <= '1' when n718_o /= (13 downto 0 => '0') else '0';
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:791:20
  n721_o <= '1' when signed (n712_o) < signed'("000000") else '0';
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:792:22
  n722_o <= std_logic_vector(-signed (n712_o));
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:793:43
  n724_o <= std_logic_vector (resize (signed (n722_o), 31));  --  sext
  n725_o <= n641_o & n639_o & n642_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:793:22
  n726_o <= std_logic_vector (shift_right (unsigned (n725_o), to_integer(unsigned (n724_o))));
  n727_o <= n707_o & n705_o & n708_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:795:28
  n728_o <= n704_o (4);
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:795:47
  n729_o <= n728_o & n704_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:798:42
  n732_o <= std_logic_vector (resize (signed (n722_o), 31));  --  sext
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:358:16
  n738_o <= n722_o (3 downto 0);  --  trunc
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:358:15
  n740_o <= n641_o & n639_o & n642_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:360:12
  n743_o <= "0" & n732_o;  --  uext
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:360:12
  n745_o <= '1' when signed'("00000000000000000000000000001101") < signed (n743_o) else '0';
  n746_o <= n641_o & n639_o & n642_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:361:19
  n747_o <= n746_o (13);
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:361:23
  n748_o <= n747_o or n1622_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:360:7
  n749_o <= n1622_o when n745_o = '0' else n748_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:360:12
  n750_o <= "0" & n732_o;  --  uext
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:360:12
  n752_o <= '1' when signed'("00000000000000000000000000001100") < signed (n750_o) else '0';
  n753_o <= n641_o & n639_o & n642_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:361:19
  n754_o <= n753_o (12);
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:361:23
  n755_o <= n754_o or n749_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:360:7
  n756_o <= n749_o when n752_o = '0' else n755_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:360:12
  n757_o <= "0" & n732_o;  --  uext
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:360:12
  n759_o <= '1' when signed'("00000000000000000000000000001011") < signed (n757_o) else '0';
  n760_o <= n641_o & n639_o & n642_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:361:19
  n761_o <= n760_o (11);
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:361:23
  n762_o <= n761_o or n756_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:360:7
  n763_o <= n756_o when n759_o = '0' else n762_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:360:12
  n764_o <= "0" & n732_o;  --  uext
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:360:12
  n766_o <= '1' when signed'("00000000000000000000000000001010") < signed (n764_o) else '0';
  n767_o <= n641_o & n639_o & n642_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:361:19
  n768_o <= n767_o (10);
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:361:23
  n769_o <= n768_o or n763_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:360:7
  n770_o <= n763_o when n766_o = '0' else n769_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:360:12
  n771_o <= "0" & n732_o;  --  uext
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:360:12
  n773_o <= '1' when signed'("00000000000000000000000000001001") < signed (n771_o) else '0';
  n774_o <= n641_o & n639_o & n642_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:361:19
  n775_o <= n774_o (9);
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:361:23
  n776_o <= n775_o or n770_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:360:7
  n777_o <= n770_o when n773_o = '0' else n776_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:360:12
  n778_o <= "0" & n732_o;  --  uext
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:360:12
  n780_o <= '1' when signed'("00000000000000000000000000001000") < signed (n778_o) else '0';
  n781_o <= n641_o & n639_o & n642_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:361:19
  n782_o <= n781_o (8);
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:361:23
  n783_o <= n782_o or n777_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:360:7
  n784_o <= n777_o when n780_o = '0' else n783_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:360:12
  n785_o <= "0" & n732_o;  --  uext
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:360:12
  n787_o <= '1' when signed'("00000000000000000000000000000111") < signed (n785_o) else '0';
  n788_o <= n641_o & n639_o & n642_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:361:19
  n789_o <= n788_o (7);
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:361:23
  n790_o <= n789_o or n784_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:360:7
  n791_o <= n784_o when n787_o = '0' else n790_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:360:12
  n792_o <= "0" & n732_o;  --  uext
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:360:12
  n794_o <= '1' when signed'("00000000000000000000000000000110") < signed (n792_o) else '0';
  n795_o <= n641_o & n639_o & n642_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:361:19
  n796_o <= n795_o (6);
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:361:23
  n797_o <= n796_o or n791_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:360:7
  n798_o <= n791_o when n794_o = '0' else n797_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:360:12
  n799_o <= "0" & n732_o;  --  uext
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:360:12
  n801_o <= '1' when signed'("00000000000000000000000000000101") < signed (n799_o) else '0';
  n802_o <= n641_o & n639_o & n642_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:361:19
  n803_o <= n802_o (5);
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:361:23
  n804_o <= n803_o or n798_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:360:7
  n805_o <= n798_o when n801_o = '0' else n804_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:360:12
  n806_o <= "0" & n732_o;  --  uext
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:360:12
  n808_o <= '1' when signed'("00000000000000000000000000000100") < signed (n806_o) else '0';
  n809_o <= n641_o & n639_o & n642_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:361:19
  n810_o <= n809_o (4);
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:361:23
  n811_o <= n810_o or n805_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:360:7
  n812_o <= n805_o when n808_o = '0' else n811_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:360:12
  n813_o <= "0" & n732_o;  --  uext
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:360:12
  n815_o <= '1' when signed'("00000000000000000000000000000011") < signed (n813_o) else '0';
  n816_o <= n641_o & n639_o & n642_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:361:19
  n817_o <= n816_o (3);
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:361:23
  n818_o <= n817_o or n812_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:360:7
  n819_o <= n812_o when n815_o = '0' else n818_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:360:12
  n820_o <= "0" & n732_o;  --  uext
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:360:12
  n822_o <= '1' when signed'("00000000000000000000000000000010") < signed (n820_o) else '0';
  n823_o <= n641_o & n639_o & n642_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:361:19
  n824_o <= n823_o (2);
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:361:23
  n825_o <= n824_o or n819_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:360:7
  n826_o <= n819_o when n822_o = '0' else n825_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:360:12
  n827_o <= "0" & n732_o;  --  uext
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:360:12
  n829_o <= '1' when signed'("00000000000000000000000000000001") < signed (n827_o) else '0';
  n830_o <= n641_o & n639_o & n642_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:361:19
  n831_o <= n830_o (1);
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:361:23
  n832_o <= n831_o or n826_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:360:7
  n833_o <= n826_o when n829_o = '0' else n832_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:360:12
  n834_o <= "0" & n732_o;  --  uext
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:360:12
  n836_o <= '1' when signed'("00000000000000000000000000000000") < signed (n834_o) else '0';
  n837_o <= n641_o & n639_o & n642_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:361:19
  n838_o <= n837_o (0);
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:361:23
  n839_o <= n838_o or n833_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:360:7
  n840_o <= n833_o when n836_o = '0' else n839_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:799:20
  n842_o <= '1' when n712_o = "000000" else '0';
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:800:25
  n843_o <= n638_o (4);
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:800:44
  n844_o <= n843_o & n638_o;
  n845_o <= n707_o & n705_o & n708_o;
  n846_o <= n641_o & n639_o & n642_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:802:19
  n847_o <= '1' when unsigned (n845_o) > unsigned (n846_o) else '0';
  n848_o <= n707_o & n705_o & n708_o;
  n849_o <= n641_o & n639_o & n642_o;
  n850_o <= n641_o & n639_o & n642_o;
  n851_o <= n707_o & n705_o & n708_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:802:9
  n852_o <= n850_o when n847_o = '0' else n848_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:802:9
  n853_o <= n851_o when n847_o = '0' else n849_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:802:9
  n856_o <= '1' when n847_o = '0' else '0';
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:811:20
  n858_o <= '1' when signed (n712_o) > signed'("001101") else '0';
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:812:28
  n859_o <= n638_o (4);
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:812:47
  n860_o <= n859_o & n638_o;
  n861_o <= n641_o & n639_o & n642_o;
  n862_o <= n707_o & n705_o & n708_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:816:22
  n863_o <= '1' when n862_o /= (13 downto 0 => '0') else '0';
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:817:20
  n865_o <= '1' when signed (n712_o) > signed'("000000") else '0';
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:818:43
  n867_o <= std_logic_vector (resize (signed (n712_o), 31));  --  sext
  n868_o <= n707_o & n705_o & n708_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:818:22
  n869_o <= std_logic_vector (shift_right (unsigned (n868_o), to_integer(unsigned (n867_o))));
  n870_o <= n641_o & n639_o & n642_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:820:28
  n871_o <= n638_o (4);
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:820:47
  n872_o <= n871_o & n638_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:823:42
  n875_o <= std_logic_vector (resize (signed (n712_o), 31));  --  sext
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:358:16
  n881_o <= n712_o (3 downto 0);  --  trunc
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:358:15
  n883_o <= n707_o & n705_o & n708_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:360:12
  n886_o <= "0" & n875_o;  --  uext
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:360:12
  n888_o <= '1' when signed'("00000000000000000000000000001101") < signed (n886_o) else '0';
  n889_o <= n707_o & n705_o & n708_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:361:19
  n890_o <= n889_o (13);
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:361:23
  n891_o <= n890_o or n1646_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:360:7
  n892_o <= n1646_o when n888_o = '0' else n891_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:360:12
  n893_o <= "0" & n875_o;  --  uext
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:360:12
  n895_o <= '1' when signed'("00000000000000000000000000001100") < signed (n893_o) else '0';
  n896_o <= n707_o & n705_o & n708_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:361:19
  n897_o <= n896_o (12);
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:361:23
  n898_o <= n897_o or n892_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:360:7
  n899_o <= n892_o when n895_o = '0' else n898_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:360:12
  n900_o <= "0" & n875_o;  --  uext
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:360:12
  n902_o <= '1' when signed'("00000000000000000000000000001011") < signed (n900_o) else '0';
  n903_o <= n707_o & n705_o & n708_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:361:19
  n904_o <= n903_o (11);
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:361:23
  n905_o <= n904_o or n899_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:360:7
  n906_o <= n899_o when n902_o = '0' else n905_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:360:12
  n907_o <= "0" & n875_o;  --  uext
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:360:12
  n909_o <= '1' when signed'("00000000000000000000000000001010") < signed (n907_o) else '0';
  n910_o <= n707_o & n705_o & n708_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:361:19
  n911_o <= n910_o (10);
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:361:23
  n912_o <= n911_o or n906_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:360:7
  n913_o <= n906_o when n909_o = '0' else n912_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:360:12
  n914_o <= "0" & n875_o;  --  uext
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:360:12
  n916_o <= '1' when signed'("00000000000000000000000000001001") < signed (n914_o) else '0';
  n917_o <= n707_o & n705_o & n708_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:361:19
  n918_o <= n917_o (9);
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:361:23
  n919_o <= n918_o or n913_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:360:7
  n920_o <= n913_o when n916_o = '0' else n919_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:360:12
  n921_o <= "0" & n875_o;  --  uext
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:360:12
  n923_o <= '1' when signed'("00000000000000000000000000001000") < signed (n921_o) else '0';
  n924_o <= n707_o & n705_o & n708_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:361:19
  n925_o <= n924_o (8);
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:361:23
  n926_o <= n925_o or n920_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:360:7
  n927_o <= n920_o when n923_o = '0' else n926_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:360:12
  n928_o <= "0" & n875_o;  --  uext
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:360:12
  n930_o <= '1' when signed'("00000000000000000000000000000111") < signed (n928_o) else '0';
  n931_o <= n707_o & n705_o & n708_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:361:19
  n932_o <= n931_o (7);
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:361:23
  n933_o <= n932_o or n927_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:360:7
  n934_o <= n927_o when n930_o = '0' else n933_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:360:12
  n935_o <= "0" & n875_o;  --  uext
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:360:12
  n937_o <= '1' when signed'("00000000000000000000000000000110") < signed (n935_o) else '0';
  n938_o <= n707_o & n705_o & n708_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:361:19
  n939_o <= n938_o (6);
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:361:23
  n940_o <= n939_o or n934_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:360:7
  n941_o <= n934_o when n937_o = '0' else n940_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:360:12
  n942_o <= "0" & n875_o;  --  uext
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:360:12
  n944_o <= '1' when signed'("00000000000000000000000000000101") < signed (n942_o) else '0';
  n945_o <= n707_o & n705_o & n708_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:361:19
  n946_o <= n945_o (5);
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:361:23
  n947_o <= n946_o or n941_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:360:7
  n948_o <= n941_o when n944_o = '0' else n947_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:360:12
  n949_o <= "0" & n875_o;  --  uext
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:360:12
  n951_o <= '1' when signed'("00000000000000000000000000000100") < signed (n949_o) else '0';
  n952_o <= n707_o & n705_o & n708_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:361:19
  n953_o <= n952_o (4);
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:361:23
  n954_o <= n953_o or n948_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:360:7
  n955_o <= n948_o when n951_o = '0' else n954_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:360:12
  n956_o <= "0" & n875_o;  --  uext
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:360:12
  n958_o <= '1' when signed'("00000000000000000000000000000011") < signed (n956_o) else '0';
  n959_o <= n707_o & n705_o & n708_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:361:19
  n960_o <= n959_o (3);
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:361:23
  n961_o <= n960_o or n955_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:360:7
  n962_o <= n955_o when n958_o = '0' else n961_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:360:12
  n963_o <= "0" & n875_o;  --  uext
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:360:12
  n965_o <= '1' when signed'("00000000000000000000000000000010") < signed (n963_o) else '0';
  n966_o <= n707_o & n705_o & n708_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:361:19
  n967_o <= n966_o (2);
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:361:23
  n968_o <= n967_o or n962_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:360:7
  n969_o <= n962_o when n965_o = '0' else n968_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:360:12
  n970_o <= "0" & n875_o;  --  uext
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:360:12
  n972_o <= '1' when signed'("00000000000000000000000000000001") < signed (n970_o) else '0';
  n973_o <= n707_o & n705_o & n708_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:361:19
  n974_o <= n973_o (1);
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:361:23
  n975_o <= n974_o or n969_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:360:7
  n976_o <= n969_o when n972_o = '0' else n975_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:360:12
  n977_o <= "0" & n875_o;  --  uext
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:360:12
  n979_o <= '1' when signed'("00000000000000000000000000000000") < signed (n977_o) else '0';
  n980_o <= n707_o & n705_o & n708_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:361:19
  n981_o <= n980_o (0);
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:361:23
  n982_o <= n981_o or n976_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:360:7
  n983_o <= n976_o when n979_o = '0' else n982_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:817:7
  n985_o <= (13 downto 0 => 'X') when n865_o = '0' else n870_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:817:7
  n987_o <= (13 downto 0 => 'X') when n865_o = '0' else n869_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:817:7
  n989_o <= "XXXXXX" when n865_o = '0' else n872_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:817:7
  n992_o <= '0' when n865_o = '0' else '1';
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:817:7
  n994_o <= 'X' when n865_o = '0' else n983_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:811:7
  n995_o <= n985_o when n858_o = '0' else n861_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:811:7
  n997_o <= n987_o when n858_o = '0' else "00000000000000";
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:811:7
  n998_o <= n989_o when n858_o = '0' else n860_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:811:7
  n1000_o <= n992_o when n858_o = '0' else '1';
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:811:7
  n1001_o <= n994_o when n858_o = '0' else n863_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:799:7
  n1002_o <= n995_o when n842_o = '0' else n852_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:799:7
  n1003_o <= n997_o when n842_o = '0' else n853_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:799:7
  n1004_o <= n998_o when n842_o = '0' else n844_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:799:7
  n1005_o <= n1000_o when n842_o = '0' else n856_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:799:7
  n1007_o <= n1001_o when n842_o = '0' else '0';
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:791:7
  n1008_o <= n1002_o when n721_o = '0' else n727_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:791:7
  n1009_o <= n1003_o when n721_o = '0' else n726_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:791:7
  n1010_o <= n1004_o when n721_o = '0' else n729_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:791:7
  n1013_o <= n1005_o when n721_o = '0' else '0';
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:791:7
  n1014_o <= n1007_o when n721_o = '0' else n840_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:785:7
  n1015_o <= n1008_o when n714_o = '0' else n717_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:785:7
  n1017_o <= n1009_o when n714_o = '0' else "00000000000000";
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:785:7
  n1018_o <= n1010_o when n714_o = '0' else n716_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:785:7
  n1021_o <= n1013_o when n714_o = '0' else '0';
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:785:7
  n1022_o <= n1014_o when n714_o = '0' else n719_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:826:28
  n1023_o <= n1017_o (0);
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:826:32
  n1024_o <= n1023_o or n1022_o;
  n1025_o <= n1016_o (13 downto 1);
  n1026_o <= n726_o (13 downto 1);
  n1027_o <= n849_o (13 downto 1);
  n1028_o <= n851_o (13 downto 1);
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:802:9
  n1029_o <= n1028_o when n847_o = '0' else n1027_o;
  n1030_o <= n996_o (13 downto 1);
  n1031_o <= n869_o (13 downto 1);
  n1032_o <= n986_o (13 downto 1);
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:817:7
  n1033_o <= n1032_o when n865_o = '0' else n1031_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:811:7
  n1034_o <= n1033_o when n858_o = '0' else n1030_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:799:7
  n1035_o <= n1034_o when n842_o = '0' else n1029_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:791:7
  n1036_o <= n1035_o when n721_o = '0' else n1026_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:785:7
  n1037_o <= n1036_o when n714_o = '0' else n1025_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:827:11
  n1038_o <= wrap_a (15);
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:827:23
  n1039_o <= wrap_b (15);
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:827:20
  n1040_o <= '1' when n1038_o = n1039_o else '0';
  n1041_o <= n1037_o & n1024_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:828:26
  n1042_o <= std_logic_vector (unsigned (n1015_o) + unsigned (n1041_o));
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:829:20
  n1043_o <= wrap_a (15);
  n1044_o <= n1037_o & n1024_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:831:26
  n1045_o <= std_logic_vector (unsigned (n1015_o) - unsigned (n1044_o));
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:833:20
  n1046_o <= wrap_a (15);
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:835:20
  n1047_o <= wrap_b (15);
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:832:9
  n1048_o <= n1047_o when n1021_o = '0' else n1046_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:827:7
  n1049_o <= n1045_o when n1040_o = '0' else n1042_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:827:7
  n1050_o <= n1048_o when n1040_o = '0' else n1043_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:838:10
  n1051_o <= '1' when n1049_o /= (13 downto 0 => '0') else '0';
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:838:22
  n1052_o <= not n1051_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:838:7
  n1054_o <= n1050_o when n1052_o = '0' else '0';
  n1074_o <= n1049_o (0);
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:420:16
  n1075_o <= '1' when n1074_o = '1' else '0';
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:420:16
  n1077_o <= "11111" when n1075_o = '0' else "00000";
  n1078_o <= n1049_o (1);
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:420:16
  n1079_o <= '1' when n1078_o = '1' else '0';
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:420:16
  n1081_o <= n1077_o when n1079_o = '0' else "00001";
  n1082_o <= n1049_o (2);
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:420:16
  n1083_o <= '1' when n1082_o = '1' else '0';
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:420:16
  n1085_o <= n1081_o when n1083_o = '0' else "00010";
  n1086_o <= n1049_o (3);
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:420:16
  n1087_o <= '1' when n1086_o = '1' else '0';
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:420:16
  n1089_o <= n1085_o when n1087_o = '0' else "00011";
  n1090_o <= n1049_o (4);
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:420:16
  n1091_o <= '1' when n1090_o = '1' else '0';
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:420:16
  n1093_o <= n1089_o when n1091_o = '0' else "00100";
  n1094_o <= n1049_o (5);
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:420:16
  n1095_o <= '1' when n1094_o = '1' else '0';
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:420:16
  n1097_o <= n1093_o when n1095_o = '0' else "00101";
  n1098_o <= n1049_o (6);
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:420:16
  n1099_o <= '1' when n1098_o = '1' else '0';
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:420:16
  n1101_o <= n1097_o when n1099_o = '0' else "00110";
  n1102_o <= n1049_o (7);
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:420:16
  n1103_o <= '1' when n1102_o = '1' else '0';
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:420:16
  n1105_o <= n1101_o when n1103_o = '0' else "00111";
  n1106_o <= n1049_o (8);
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:420:16
  n1107_o <= '1' when n1106_o = '1' else '0';
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:420:16
  n1109_o <= n1105_o when n1107_o = '0' else "01000";
  n1110_o <= n1049_o (9);
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:420:16
  n1111_o <= '1' when n1110_o = '1' else '0';
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:420:16
  n1113_o <= n1109_o when n1111_o = '0' else "01001";
  n1114_o <= n1049_o (10);
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:420:16
  n1115_o <= '1' when n1114_o = '1' else '0';
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:420:16
  n1117_o <= n1113_o when n1115_o = '0' else "01010";
  n1118_o <= n1049_o (11);
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:420:16
  n1119_o <= '1' when n1118_o = '1' else '0';
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:420:16
  n1121_o <= n1117_o when n1119_o = '0' else "01011";
  n1122_o <= n1049_o (12);
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:420:16
  n1123_o <= '1' when n1122_o = '1' else '0';
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:420:16
  n1125_o <= n1121_o when n1123_o = '0' else "01100";
  n1126_o <= n1049_o (13);
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:420:16
  n1127_o <= '1' when n1126_o = '1' else '0';
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:420:16
  n1129_o <= n1125_o when n1127_o = '0' else "01101";
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:420:16
  n1130_o <= std_logic_vector (resize (signed (n1129_o), 32));  --  sext
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:421:16
  n1132_o <= std_logic_vector (unsigned (n1130_o) - unsigned'("00000000000000000000000000001010"));
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:421:33
  n1134_o <= std_logic_vector (unsigned (n1132_o) - unsigned'("00000000000000000000000000000010"));
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:422:12
  n1136_o <= std_logic_vector (resize (signed (n1018_o), 7));  --  sext
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:422:39
  n1137_o <= n1134_o (6 downto 0);  --  trunc
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:422:39
  n1138_o <= std_logic_vector (unsigned (n1136_o) + unsigned (n1137_o));
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:423:9
  n1140_o <= '1' when n1049_o /= (13 downto 0 => '0') else '0';
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:423:20
  n1141_o <= not n1140_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:425:17
  n1143_o <= '1' when signed (n1138_o) <= signed'("1110000") else '0';
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:425:55
  n1145_o <= '1' and n1143_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:426:7
  n1149_o <= n1145_o or '0';
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:427:15
  n1151_o <= '1' when signed (n1138_o) >= signed'("1100110") else '0';
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:428:9
  n1153_o <= '1' and n1151_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:430:38
  n1156_o <= std_logic_vector (unsigned (n1018_o) + unsigned'("001111"));
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:430:20
  n1157_o <= std_logic_vector (resize (signed (n1156_o), 32));  --  sext
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:430:19
  n1158_o <= std_logic_vector(-signed (n1157_o));
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:425:5
  n1160_o <= n1138_o when n1171_o = '0' else "1110000";
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:425:5
  n1161_o <= n1134_o when n1172_o = '0' else n1158_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:427:7
  n1164_o <= '1' when n1153_o = '0' else '0';
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:434:16
  n1167_o <= '1' when signed (n1138_o) > signed'("0001110") else '0';
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:434:5
  n1170_o <= '0' when n1167_o = '0' else '1';
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:425:5
  n1171_o <= n1153_o and n1149_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:425:5
  n1172_o <= n1153_o and n1149_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:425:5
  n1174_o <= '0' when n1149_o = '0' else n1164_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:425:5
  n1176_o <= n1170_o when n1149_o = '0' else '0';
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:423:5
  n1177_o <= n1160_o when n1141_o = '0' else n1138_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:423:5
  n1178_o <= n1161_o when n1141_o = '0' else n1134_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:423:5
  n1180_o <= n1174_o when n1141_o = '0' else '1';
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:423:5
  n1183_o <= n1176_o when n1141_o = '0' else '0';
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:444:23
  n1187_o <= std_logic_vector (shift_right (unsigned (n1049_o), to_integer(unsigned (n1178_o))));
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:444:23
  n1188_o <= std_logic_vector(-signed (n1178_o));
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:444:23
  n1189_o <= std_logic_vector (shift_left (unsigned (n1049_o), to_integer (unsigned (n1188_o))));
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:444:23
  n1190_o <= n1178_o (31);
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:444:23
  n1191_o <= n1187_o when n1190_o = '0' else n1189_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:460:38
  n1307_o <= n1191_o (11 downto 2);
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:231:8
  n1312_o <= '1' when n1307_o = (9 downto 0 => '1') else '0';
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:232:29
  n1314_o <= std_logic_vector (unsigned (n1177_o) + unsigned'("0000001"));
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:236:29
  n1316_o <= std_logic_vector (unsigned (n1307_o) + unsigned'("0000000001"));
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:231:5
  n1318_o <= n1316_o when n1312_o = '0' else "0000000000";
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:459:7
  n1319_o <= n1177_o when n1322_o = '0' else n1314_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:465:26
  n1320_o <= n1191_o (11 downto 2);
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:459:7
  n1321_o <= n1320_o when std_logic'('0') = '0' else n1318_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:459:7
  n1322_o <= n1312_o and '0';
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:469:31
  n1323_o <= n1319_o (4 downto 0);
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:470:55
  n1324_o <= n1323_o (4);
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:470:45
  n1325_o <= not n1324_o;
  n1326_o <= n1314_o (3 downto 0);
  n1327_o <= n1138_o (3 downto 0);
  n1328_o <= n1159_o (3 downto 0);
  n1329_o <= n1138_o (3 downto 0);
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:425:5
  n1330_o <= n1329_o when n1171_o = '0' else n1328_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:423:5
  n1331_o <= n1330_o when n1141_o = '0' else n1327_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:459:7
  n1332_o <= n1331_o when n1322_o = '0' else n1326_o;
  n1333_o <= n1325_o & n1332_o;
  n1343_o <= n1333_o & n1321_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:440:5
  n1345_o <= n1343_o when n1183_o = '0' else "111110000000000";
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:440:5
  n1348_o <= 'X' when n1183_o = '0' else '0';
  n1365_o <= n1348_o & n1345_o;
  n1375_o <= n1366_o (14 downto 0);
  n1376_o <= n1365_o (14 downto 0);
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:437:5
  n1377_o <= n1376_o when n1180_o = '0' else n1375_o;
  n1378_o <= n1054_o & n1377_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:752:5
  n1382_o <= n1378_o when n225_o = '0' else "1000000000000000";
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:749:5
  n1421_o <= n1382_o when n219_o = '0' else "1111110000000000";
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:746:5
  n1457_o <= n1421_o when n213_o = '0' else "0111110000000000";
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:738:5
  n1493_o <= n1457_o when n207_o = '0' else "0111110000000001";
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:736:5
  n1529_o <= n1493_o when n184_o = '0' else (15 downto 0 => 'X');
  -- ../src/fadd16.vhd:35:32
  n1580_o <= ffy (127 downto 0);
  -- ../src/fadd16.vhd:36:18
  n1584_o <= ffy (143 downto 128);
  n1596_o <= n1_o (143 downto 16);
  -- ../src/fadd16.vhd:35:3
  process (wrap_clk)
  begin
    if rising_edge (wrap_clk) then
      n1597_q <= n1580_o;
    end if;
  end process;
  -- ../src/fadd16.vhd:35:3
  n1598_o <= n1597_q & n1529_o;
  -- ../src/fadd16.vhd:22:5
  n1599_o <= n740_o (0);
  n1600_o <= n740_o (1);
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:376:14
  n1601_o <= n740_o (2);
  n1602_o <= n740_o (3);
  -- ../../src/ieee2008/float_generic_pkg.vhdl:380:12
  n1603_o <= n740_o (4);
  -- ../../src/ieee2008/float_generic_pkg.vhdl:380:12
  n1604_o <= n740_o (5);
  n1605_o <= n740_o (6);
  -- ../../src/ieee2008/float_generic_pkg.vhdl:380:12
  n1606_o <= n740_o (7);
  -- ../../src/ieee2008/float_generic_pkg.vhdl:375:12
  n1607_o <= n740_o (8);
  -- ../../src/ieee2008/float_generic_pkg.vhdl:375:12
  n1608_o <= n740_o (9);
  n1609_o <= n740_o (10);
  -- ../../src/ieee2008/float_generic_pkg.vhdl:375:12
  n1610_o <= n740_o (11);
  n1611_o <= n740_o (12);
  n1612_o <= n740_o (13);
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:358:15
  n1613_o <= n738_o (1 downto 0);
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:358:15
  with n1613_o select n1614_o <=
    n1599_o when "00",
    n1600_o when "01",
    n1601_o when "10",
    n1602_o when "11",
    'X' when others;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:358:15
  n1615_o <= n738_o (1 downto 0);
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:358:15
  with n1615_o select n1616_o <=
    n1603_o when "00",
    n1604_o when "01",
    n1605_o when "10",
    n1606_o when "11",
    'X' when others;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:358:15
  n1617_o <= n738_o (1 downto 0);
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:358:15
  with n1617_o select n1618_o <=
    n1607_o when "00",
    n1608_o when "01",
    n1609_o when "10",
    n1610_o when "11",
    'X' when others;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:736:5
  n1619_o <= n738_o (0);
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:358:15
  n1620_o <= n1611_o when n1619_o = '0' else n1612_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:358:15
  n1621_o <= n738_o (3 downto 2);
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:358:15
  with n1621_o select n1622_o <=
    n1614_o when "00",
    n1616_o when "01",
    n1618_o when "10",
    n1620_o when "11",
    'X' when others;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:358:15
  n1623_o <= n883_o (0);
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:358:16
  n1624_o <= n883_o (1);
  n1625_o <= n883_o (2);
  n1626_o <= n883_o (3);
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:736:5
  n1627_o <= n883_o (4);
  n1628_o <= n883_o (5);
  n1629_o <= n883_o (6);
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:736:5
  n1630_o <= n883_o (7);
  n1631_o <= n883_o (8);
  n1632_o <= n883_o (9);
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:736:5
  n1633_o <= n883_o (10);
  n1634_o <= n883_o (11);
  n1635_o <= n883_o (12);
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:736:5
  n1636_o <= n883_o (13);
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:358:15
  n1637_o <= n881_o (1 downto 0);
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:358:15
  with n1637_o select n1638_o <=
    n1623_o when "00",
    n1624_o when "01",
    n1625_o when "10",
    n1626_o when "11",
    'X' when others;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:358:15
  n1639_o <= n881_o (1 downto 0);
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:358:15
  with n1639_o select n1640_o <=
    n1627_o when "00",
    n1628_o when "01",
    n1629_o when "10",
    n1630_o when "11",
    'X' when others;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:358:15
  n1641_o <= n881_o (1 downto 0);
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:358:15
  with n1641_o select n1642_o <=
    n1631_o when "00",
    n1632_o when "01",
    n1633_o when "10",
    n1634_o when "11",
    'X' when others;
  n1643_o <= n881_o (0);
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:358:15
  n1644_o <= n1635_o when n1643_o = '0' else n1636_o;
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:358:15
  n1645_o <= n881_o (3 downto 2);
  -- ../../src/ieee2008/float_generic_pkg-body.vhdl:358:15
  with n1645_o select n1646_o <=
    n1638_o when "00",
    n1640_o when "01",
    n1642_o when "10",
    n1644_o when "11",
    'X' when others;
end rtl;
