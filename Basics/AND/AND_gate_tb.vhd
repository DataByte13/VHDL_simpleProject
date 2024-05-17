library ieee;
use IEEE.STD_LOGIC_1164.ALL;

entity and_gate_tb is 
end and_gate_tb;
architecture behavior of and_gate_tb is 
  signal a , b , f : std_logic;
begin 
  dut: entity work.AND_gate
    port map (
      a => a, 
      b => b,
      f => f 
    );
  stimulus_process : process 
  begin 
    a <= '1';
    b <= '1';
    wait for 1000 ns;
    a <= '1';
    b <= '0';
    wait for 1000 ns;

  end process stimulus_process;
end architecture behavior;

