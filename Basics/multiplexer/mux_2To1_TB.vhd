library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity multi_TB is 
end multi_TB;

architecture default_TB of multi_TB is 
  signal in0 : std_logic;
  signal in1 : std_logic;
  signal selector : std_logic;
  signal if_out : std_logic;
  signal case_out : std_logic;
  signal when_out : std_logic;
begin 
  U_test_IF : entity work.multiplexer(if_multi) 
    port map (
      in0 => in0,
      in1 => in1,
      selector => selector,
      output => if_out);
    
  U_test_case : entity work.multiplexer(case_multi) 
    port map (
      in0 => in0,
      in1 => in1,
      selector => selector,
      output => case_out);
    
  U_test_when : entity work.multiplexer(when_multi) 
    port map (
      in0 => in0,
      in1 => in1,
      selector => selector,
      output => when_out);

    process
	    variable tmp : std_logic_vector(2 downto 0);
    begin 
      for i in 0 to 7 loop 
        tmp := std_logic_vector(to_unsigned(i , 3));
        in0 <= tmp(2);
        in1 <= tmp(1);
        selector <= tmp(0);
        wait for 10 ns ;
		  
		end loop ;
	 end process ;
end default_TB;
