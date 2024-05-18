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
      Inputs : in std_logic_vector(Number_Of_Inputs-1 downto 0);
      Cout : out std_logic;
      Sum : out std_logic_vector(Number_Of_Inputs-1 downto 0)
    );
  end component;

  -- Signals to connect to the n_bit_adder
  signal Inputs : std_logic_vector(3 downto 0); -- 4-bit input
  signal Cout : std_logic;
  signal Sum : std_logic_vector(3 downto 0);

begin

  -- Instantiate the n_bit_adder
  UUT: n_bit_adder
    generic map (Number_Of_Inputs => 4)
    port map (
      Inputs => Inputs,
      Cout => Cout,
      Sum => Sum
    );

  -- Stimulus process
  stim_proc: process
  begin
    -- Apply some test vectors
    Inputs <= "0000"; wait for 10 ns;
    Inputs <= "0001"; wait for 10 ns;
    Inputs <= "0010"; wait for 10 ns;
    Inputs <= "0100"; wait for 10 ns;
    Inputs <= "1000"; wait for 10 ns;
    Inputs <= "1010"; wait for 10 ns;
    Inputs <= "1111"; wait for 10 ns;

    -- Stop the simulation
    wait;
  end process;

end behavior;

