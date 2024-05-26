library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity gp is 
  port (
    input : in std_logic_vector(7 downto 0);
    result : out std_logic 
    );
end gp ;
architecture gp_arch of gp is 
  signal temp : std_logic_vector(8 downto 0) := "000000001";
begin 
  process(input)
  begin 
    for i in 0 to 7 loop
      temp(i+1) <= temp(i) xor input(i);
      result <= temp(8);
    end loop;
  end process ;
end gp_arch;
