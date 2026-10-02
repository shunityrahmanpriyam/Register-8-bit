library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity nand_gate_tb is
end nand_gate_tb;

architecture behavior of nand_gate_tb is

    -- Component Declaration for the Unit Under Test (UUT)
    component nand_gate
        Port (
            A : in  STD_LOGIC;
            B : in  STD_LOGIC;
            Y : out STD_LOGIC
        );
    end component;

    -- Inputs
    signal A : STD_LOGIC := '0';
    signal B : STD_LOGIC := '0';

    -- Output
    signal Y : STD_LOGIC;

begin

    -- Instantiate the Unit Under Test
    uut: nand_gate
        port map (
            A => A,
            B => B,
            Y => Y
        );

    -- Stimulus process
    stim_proc: process
    begin

        -- Test 00
        A <= '0';
        B <= '0';
        wait for 10 ns;

        -- Test 01
        A <= '0';
        B <= '1';
        wait for 10 ns;

        -- Test 10
        A <= '1';
        B <= '0';
        wait for 10 ns;

        -- Test 11
        A <= '1';
        B <= '1';
        wait for 10 ns;

        wait;
    end process;

end behavior;