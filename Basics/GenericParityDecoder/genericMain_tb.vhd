library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity gp_tb is
end gp_tb;
architecture test of gp_tb is
  signal tb_input : std_logic_vector(7 downto 0);
  signal tb_result : std_logic;
begin
  UUT: entity work.gp
    port map (
      input => tb_input,
      result => tb_result 
    );
  process
  begin
    tb_input <= "01001000";
    wait for 10 ns; 
  end process;
end test;

