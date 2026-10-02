library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity d_flipflop_tb is
end d_flipflop_tb;

architecture behavior of d_flipflop_tb is

    component d_flipflop
        Port (
            D    : in  STD_LOGIC;
            CLK  : in  STD_LOGIC;
            Q    : out STD_LOGIC;
            Qbar : out STD_LOGIC
        );
    end component;

    signal D    : STD_LOGIC := '0';
    signal CLK  : STD_LOGIC := '0';
    signal Q    : STD_LOGIC;
    signal Qbar : STD_LOGIC;

begin

    uut: d_flipflop
        port map (
            D    => D,
            CLK  => CLK,
            Q    => Q,
            Qbar => Qbar
        );

    -- Clock: 10 ns period
    CLK_process: process
    begin
        CLK <= '0';
        wait for 5 ns;

        CLK <= '1';
        wait for 5 ns;
    end process;

    -- Test input
    stim_proc: process
    begin

        -- 0
        D <= '0';
        wait for 12 ns;

        -- 1
        D <= '1';
        wait for 10 ns;

        -- 0
        D <= '0';
        wait for 10 ns;

        -- 1
        D <= '1';
        wait for 10 ns;

        -- 0
        D <= '0';
        wait for 10 ns;

        wait;

    end process;

end behavior;