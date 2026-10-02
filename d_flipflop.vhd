library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity d_flipflop is
    Port (
        D    : in  STD_LOGIC;
        CLK  : in  STD_LOGIC;
        Q    : out STD_LOGIC := '0';
        Qbar : out STD_LOGIC := '1'
    );
end d_flipflop;
architecture Structural of d_flipflop is

    signal CLKbar : STD_LOGIC := '1';
    signal Qm     : STD_LOGIC := '0';
    signal Qmbar  : STD_LOGIC := '1';

    component not_gate
        Port (
            A : in  STD_LOGIC;
            Y : out STD_LOGIC
        );
    end component;

    component d_latch
        Port (
            D    : in  STD_LOGIC;
            EN   : in  STD_LOGIC;
            Q    : out STD_LOGIC;
            Qbar : out STD_LOGIC
        );
    end component;

begin

    NOT1: not_gate
        port map (
            A => CLK,
            Y => CLKbar
        );

    MASTER: d_latch
        port map (
            D    => D,
            EN   => CLKbar,
            Q    => Qm,
            Qbar => Qmbar
        );

    SLAVE: d_latch
        port map (
            D    => Qm,
            EN   => CLK,
            Q    => Q,
            Qbar => Qbar
        );

end Structural;