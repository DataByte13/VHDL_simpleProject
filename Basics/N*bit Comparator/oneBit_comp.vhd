library ieee ;
use ieee.std_logic_1164.all
use ieee.numeric_std.all
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
begin 
  process(in1 , in2)
  begin 
    if (in1 and (not in2)) then 
      flags_G <= '1';
      flags_E <= '0';
      flags_L <= '0';
    elsif ((not in1 ) and in2) then 
      flags_G <= '0';
      flags_E <= '0';
      flags_L <= '1';
    else 
      flags_G <= '0';
      flags_E <= '1';
      flags_L <= '0';
    end if 
  end process 
