library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity not_gate_tb is
end not_gate_tb;

architecture behavior of not_gate_tb is

    component not_gate
        Port (
            A : in  STD_LOGIC;
            Y : out STD_LOGIC
        );
    end component;

    signal A : STD_LOGIC := '0';
    signal Y : STD_LOGIC;

begin

    uut: not_gate
        port map (
            A => A,
            Y => Y
        );

    stim_proc: process
    begin

        A <= '0';
        wait for 10 ns;

        A <= '1';
        wait for 10 ns;

        wait;

    end process;

end behavior;