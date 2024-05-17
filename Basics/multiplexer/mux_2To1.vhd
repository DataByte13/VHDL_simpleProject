library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity multiplexer is 
  port (
    in0 : in std_logic;
    in1 : in std_logic;
    selector : in std_logic;
    output : out std_logic);
end multiplexer;
architecture if_multi of multiplexer is 
begin 
  process (in0 , in1 , selector)
  begin 
    if (selector = '0') then 
      output <= in0;
    else 
      output <= in1;
    end if ;
  end process ;
end if_multi;
architecture case_multi of multiplexer is 
begin
  process (in0 , in1 , selector)
  begin 
    case selector is 
      when '0' =>
        output <= in0;
      when '1' => 
        output <= in1;
      when others =>
        output <= 'U';
        -- also can set to null wich something like pass  
    end case;
  end process;
end case_multi;
architecture when_multi of multiplexer is 
begin 
    output <= in0 when selector = '0' else in1;
end when_multi;

