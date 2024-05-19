library IEEE;
use IEEE.std_logic_1164.all;

entity mux_4to1_tb is
end mux_4to1_tb;

architecture behavior of mux_4to1_tb is

    -- Component declaration for the Unit Under Test (UUT)
    component mux_4To1
    port(
        inputs : in std_logic_vector(3 downto 0);
        selector : in std_logic_vector(1 downto 0);
        output : out std_logic
    );
    end component;

    -- Signals for testing
    signal inputs : std_logic_vector(3 downto 0) := "0000";
    signal selector : std_logic_vector(1 downto 0) := "00";
    signal output_compo, output_entity : std_logic;

begin

    -- Component instantiation for the UUT using the mux_4to1_compo architecture
    component_mux: entity work.mux_4To1
        port map (
            inputs => inputs,
            selector => selector,
            output => output_compo
        );

    -- Component instantiation for the UUT using the mux_4to1_entity architecture
    entity_mux: entity work.mux_4To1
        port map (
            inputs => inputs,
            selector => selector,
            output => output_entity
        );

    -- Stimulus process
    stim_proc: process
    begin		
        -- Test case 1
        inputs <= "0001";
        selector <= "00";
        wait for 10 ns;
        
        -- Test case 2
        inputs <= "0010";
        selector <= "01";
        wait for 10 ns;
        
        -- Test case 3
        inputs <= "0100";
        selector <= "10";
        wait for 10 ns;

        -- Test case 4
        inputs <= "1000";
        selector <= "11";
        wait for 10 ns;

        -- Test case 5
        inputs <= "1100";
        selector <= "10";
        wait for 10 ns;

        -- Test case 6
        inputs <= "1010";
        selector <= "01";
        wait for 10 ns;

        -- Test case 7
        inputs <= "0110";
        selector <= "00";
        wait for 10 ns;
        
        wait;
    end process;

end behavior;

