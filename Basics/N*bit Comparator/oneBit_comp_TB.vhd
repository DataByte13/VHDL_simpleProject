library ieee ;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity oneBit_comp_tb is 
end oneBit_comp_tb;

architecture behavioral of oneBit_comp_tb is 
  signal input1 , input2 , e , g , l : std_logic := '0';
begin 
  onebitcomp : entity work.compar_1Bit 
    port map (
      in1 => input1,
      in2 => input2,
      flags_G => g,
      flags_E => e,
      flags_L => l);
    process
    begin 
      input1 <= '0';
      input2 <= '0';
      wait for 10 ns;
      input1 <= '0';
      input2 <= '1';
      wait for 10 ns;
      input1 <= '1';
      input2 <= '0';
      wait for 10 ns;
      input1 <= '1';
      input2 <= '1';
      wait for 10 ns;
      wait; 
    end process ;
end behavioral ; 

