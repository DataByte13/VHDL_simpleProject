
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity n_bit_adder is 
  generic (Number_Of_Inputs : positive := 4 );
  port (
    Inputs : in std_logic_vector(Number_Of_Inputs-1 downto 0);
    Cout : out std_logic;
    Sum : out std_logic_vector(Number_Of_Inputs-1 downto 0)
    );
end n_bit_adder;

architecture n_bit_adder_gate_level of n_bit_adder is 
  component one_bit_adder is  
    port (
      A :in  std_logic ;
      B :in  std_logic ;
      Cin : in std_logic;
      cout : out std_logic ;
      sum : out std_logic 
    );
  end component; 
  signal count : std_logic := '0';
  signal tmp : std_logic ;

begin
		gen_adder:  for i in 0 to Number_Of_Inputs-1 generate 
			tmp <= count;
			one_bit_instance : one_bit_adder
				port map (
					A => Inputs(i),
					B => Inputs(i),
					Cin => tmp,
					cout => count,
					sum => Sum(i)
				);
		end generate;
		Cout <= tmp;
end n_bit_adder_gate_level;