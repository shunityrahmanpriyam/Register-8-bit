library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sr_latch_tb is
end sr_latch_tb;

architecture behavior of sr_latch_tb is

    component sr_latch
        Port (
            S    : in  STD_LOGIC;
            R    : in  STD_LOGIC;
            Q    : out STD_LOGIC;
            Qbar : out STD_LOGIC
        );
    end component;

    signal S    : STD_LOGIC := '1';
    signal R    : STD_LOGIC := '0';
    signal Q    : STD_LOGIC;
    signal Qbar : STD_LOGIC;

begin

    uut: sr_latch
        port map (
            S    => S,
            R    => R,
            Q    => Q,
            Qbar => Qbar
        );

    stim_proc: process
    begin

        -- 1. Reset: Q = 0
        S <= '1';
        R <= '0';
        wait for 20 ns;

        -- 2. Hold: Q remains 0
        S <= '1';
        R <= '1';
        wait for 20 ns;

        -- 3. Set: Q = 1
        S <= '0';
        R <= '1';
        wait for 20 ns;

        -- 4. Hold: Q remains 1
        S <= '1';
        R <= '1';
        wait for 20 ns;

        -- 5. Reset again: Q = 0
        S <= '1';
        R <= '0';
        wait for 20 ns;

        -- 6. Hold: Q remains 0
        S <= '1';
        R <= '1';
        wait for 20 ns;

        wait;
    end process;

end behavior;