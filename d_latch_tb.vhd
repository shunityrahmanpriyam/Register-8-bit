library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity d_latch_tb is
end d_latch_tb;

architecture behavior of d_latch_tb is

    component d_latch
        Port (
            D    : in  STD_LOGIC;
            EN   : in  STD_LOGIC;
            Q    : out STD_LOGIC;
            Qbar : out STD_LOGIC
        );
    end component;

    signal D    : STD_LOGIC := '0';
    signal EN   : STD_LOGIC := '0';
    signal Q    : STD_LOGIC;
    signal Qbar : STD_LOGIC;

begin

    uut: d_latch
        port map (
            D    => D,
            EN   => EN,
            Q    => Q,
            Qbar => Qbar
        );

    stim_proc: process
    begin

        -- 1. Enable = 1, D = 0
        -- Q should become 0
        D  <= '0';
        EN <= '1';
        wait for 20 ns;

        -- 2. Enable = 1, D = 1
        -- Q should become 1
        D  <= '1';
        EN <= '1';
        wait for 20 ns;

        -- 3. Disable = 0, D changes to 0
        -- Q should remain 1
        D  <= '0';
        EN <= '0';
        wait for 20 ns;

        -- 4. Disable = 0, D changes to 1
        -- Q should still remain 1
        D  <= '1';
        EN <= '0';
        wait for 20 ns;

        -- 5. Enable = 1, D = 0
        -- Q should become 0
        D  <= '0';
        EN <= '1';
        wait for 20 ns;

        -- 6. Disable = 0
        -- Q should remain 0
        EN <= '0';
        wait for 20 ns;

        wait;
    end process;

end behavior;