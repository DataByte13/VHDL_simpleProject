library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity n_bit_adder_tb is
end n_bit_adder_tb;

architecture behavior of n_bit_adder_tb is

  -- Component declaration for the n_bit_adder
  component n_bit_adder is
    generic (Number_Of_Inputs : positive := 4);
    port (
      A_Inputs : in std_logic_vector(Number_Of_Inputs-1 downto 0);
      B_Inputs : in std_logic_vector(Number_Of_Inputs-1 downto 0);
      cout : out std_logic;
      Sum : out std_logic_vector(Number_Of_Inputs-1 downto 0);
      tmp : out std_logic
    );
  end component;

  signal A_Inputs : std_logic_vector(3 downto 0); -- 4-bit input
  signal B_Inputs : std_logic_vector(3 downto 0); -- 4-bit input
  signal Cout : std_logic;
  signal Sum : std_logic_vector(3 downto 0);
  signal tmp : std_logic;

begin
  UUT: n_bit_adder
    generic map (Number_Of_Inputs => 4)
    port map (
      A_inputs => A_inputs , 
      B_inputs => B_inputs ,
      cout => Cout,
      sum => Sum,
      tmp => tmp
    );

  stim_proc: process
  begin
    A_Inputs <= "1011"; wait for 10 ns;
    B_Inputs <= "0001"; wait for 10 ns;
    A_Inputs <= "1000"; wait for 10 ns;
    B_Inputs <= "1001"; wait for 10 ns;
    A_Inputs <= "0001"; wait for 10 ns;
    B_Inputs <= "0001"; wait for 10 ns;
    A_Inputs <= "1111"; wait for 10 ns;
    B_Inputs <= "0001"; wait for 10 ns;

    wait;
  end process;

end behavior;

