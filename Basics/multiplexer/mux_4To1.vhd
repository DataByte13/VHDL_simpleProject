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
architecture multiplexer_2to1 of multiplexer is 
begin 
  output <= in0 when selector = '0' else in1;
end multiplexer_2to1;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity mux_4to1 is 
 port (
  inputs : in std_logic_vector(3 downto 0) ;
  selector : in std_logic_vector(1 downto 0);
  output : out std_logic 
);
 end mux_4to1;
architecture mux_4to1_compo of mux_4to1 is  
-- with component one : 
  component mux_2To1 
  port (
    in0 : in std_logic;
    in1 : in std_logic;
    selector : in std_logic;
    output : out std_logic
  );
end component;
  signal muxA_out , muxB_out : std_logic;
begin 
  muxA : mux_2To1 port map (
    in0 => inputs(0),
    in1 => inputs(1),
    selector => selector(0),
    output => muxA_out
  );
  muxB : mux_2To1 port map (
    in0 => inputs(2),
    in1 => inputs(3),
    selector => selector(0),
    output => muxB_out
  );
  mux_edg :mux_2To1 port map (
    in0 => muxA_out,
    in1 => muxB_out,
    selector => selector(1),
    output => output
  );
end mux_4to1_compo;
--with entity one : 
architecture mux_4to1_entity of mux_4to1 is 
signal muxA_out , muxB_out : std_logic;
begin 
  muxA : entity work.multiplexer port map (
    in0 => inputs(0),
    in1 => inputs(1),
    selector => selector(0),
    output => muxA_out
  );
  muxB : entity work.multiplexer port map (
    in0 => inputs(2),
    in1 => inputs(3),
    selector => selector(0),
    output => muxB_out
  );
  mux_edg : entity work.multiplexer port map (
    in0 => muxA_out,
    in1 => muxB_out,
    selector => selector(1),
    output => output
  );
end mux_4to1_entity;



