library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity n_bit_adder is 
  generic (Number_Of_Inputs : positive := 4 );
  port (
    A_Inputs : in std_logic_vector(Number_Of_Inputs-1 downto 0);
    B_Inputs : in std_logic_vector(Number_Of_Inputs-1 downto 0);
   -- Cins : out std_logic_vector(Number_Of_Inputs downto 0);
    cout : out std_logic ;
    Sum : out std_logic_vector(Number_Of_Inputs-1 downto 0);
    tmp : out std_logic 
  );
end n_bit_adder;

architecture n_bit_adder_gate_level of n_bit_adder is 
  component one_bit_adder is  
    port (
      A :in  std_logic ;
      B :in  std_logic ;
      Cin : in std_logic;
      cout : out std_logic ;
      sum : out std_logic ;
      bitA : out std_logic
    );
  end component; 
  signal count : std_logic := '0';
  signal icin : std_logic_vector(Number_Of_Inputs downto 0);

begin 
  icin(0) <= '0';
		gen_adder:  for i in 0 to Number_Of_Inputs-1 generate 
      one_bit_instance : one_bit_adder
				port map (
					A => A_Inputs(i),
					B => B_Inputs(i),
          Cin => icin(i),
					cout => icin(i+1),
					sum => Sum(i),
          bitA => tmp
				);

		end generate;
end n_bit_adder_gate_level;

