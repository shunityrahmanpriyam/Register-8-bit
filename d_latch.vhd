library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity d_latch is
    Port (
        D    : in  STD_LOGIC;
        EN   : in  STD_LOGIC;
        Q    : out STD_LOGIC;
        Qbar : out STD_LOGIC
    );
end d_latch;

architecture Structural of d_latch is

    signal Dbar : STD_LOGIC;
    signal S    : STD_LOGIC;
    signal R    : STD_LOGIC;

    component not_gate
        Port (
            A : in  STD_LOGIC;
            Y : out STD_LOGIC
        );
    end component;

    component nand_gate
        Port (
            A : in  STD_LOGIC;
            B : in  STD_LOGIC;
            Y : out STD_LOGIC
        );
    end component;

    component sr_latch
        Port (
            S    : in  STD_LOGIC;
            R    : in  STD_LOGIC;
            Q    : out STD_LOGIC;
            Qbar : out STD_LOGIC
        );
    end component;

begin

    NOT1: not_gate
        port map (
            A => D,
            Y => Dbar
        );

    NAND1: nand_gate
        port map (
            A => D,
            B => EN,
            Y => S
        );

    NAND2: nand_gate
        port map (
            A => Dbar,
            B => EN,
            Y => R
        );

    SR1: sr_latch
        port map (
            S    => S,
            R    => R,
            Q    => Q,
            Qbar => Qbar
        );

end Structural;