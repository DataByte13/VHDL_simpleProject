library library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity gp is 
  port (
    input : in std_logic_vector(7 downto 0);
    result : out std_logic
    );
end gp ;
architecture gp of gp is 
  signal temp : std_logic;
begin 
  process(input)
  temp <= '0';
  begin 
    for i in 0 to 7 loop 
      temp <= temp xor input(i);
    end loop;
    result <= temp;
  end process ;
end gp;
