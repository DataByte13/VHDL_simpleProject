
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity one_bit_adder is 
  port (
    A :in  std_logic ;
    B :in  std_logic ;
    Cin : in std_logic;
    cout : out std_logic ;
    sum : out std_logic 
    );
end one_bit_adder;
architecture one_bit_adder_gate_level of one_bit_adder is
  signal A_XOR_B : std_logic;
  signal A_AND_B : std_logic;
  signal Cin_AND_XORAB : std_logic;
begin 
  A_XOR_B <= A xor B ;
  A_AND_B <= A and B ;
  Cin_AND_XORAB <= A_XOR_B and Cin;
  cout <= Cin_AND_XORAB or (A and B);
  sum <= A_XOR_B xor Cin;
end one_bit_adder_gate_level;
