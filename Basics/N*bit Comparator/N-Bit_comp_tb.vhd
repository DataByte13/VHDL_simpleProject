library ieee ; 
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity compar_nbit_tb is 
end compar_nbit_tb;

architecture behavoral of compar_nbit_tb is 
  signal input1 , input2  : std_logic_vector(7 downto 0) :="00000000";
  signal g ,e ,l : std_logic := '0';
begin 
 U_comprator : entity work.compar_nbit 
    generic map (
      n => 8
    )
    port map (
      input1 => input1 ,
      input2 => input2 ,
      resultFlag_G => g ,
      resultFlag_E => e ,
      resultFlag_L => l 
    );
    process 
    begin 
      input1 <= "00000000";
      input2 <= "00000000";
      wait for 10 ns ;
    
      input1 <= "10000000";
      input2 <= "00000000";
      wait for 10 ns ;
      input1 <= "00000001";
      input2 <= "00000000";
      wait for 10 ns ;
      input1 <= "00000000";
      input2 <= "00001000";
      wait for 10 ns ;

      input1 <= "11111111";
      input2 <= "11111111";
      wait for 10 ns ;
    end process ;
 end behavoral ;

