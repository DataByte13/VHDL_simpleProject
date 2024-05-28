library ieee ;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity compar_1Bit is 
  port (
    in1 : in std_logic ;
    in2 : in std_logic ;
    flags_G : out std_logic ; 
    flags_E : out std_logic;
    flags_L : out std_logic
       );
end compar_1Bit ;
architecture compar_1Bit_arch of compar_1Bit is
  signal greater , lower , equal : std_logic := '0';
begin 
  process(in1 , in2)
  begin 
    greater <= in1 and (not in2) ;
    lower <= (not in1 ) and in2;
    equal <=   (in1 and (not in2)) nor ((not in1 ) and in2); 
  end process;
  flags_G <= greater;
  flags_L <= lower;
  flags_E <= equal;
end compar_1Bit_arch;
