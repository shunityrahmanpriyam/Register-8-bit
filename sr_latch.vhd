library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sr_latch is
    Port (
        S    : in  STD_LOGIC;
        R    : in  STD_LOGIC;
        Q    : out STD_LOGIC;
        Qbar : out STD_LOGIC
    );
end sr_latch;

architecture Structural of sr_latch is

    signal Q_int    : STD_LOGIC := '0';
    signal Qbar_int : STD_LOGIC := '1';

    component nand_gate
        Port (
            A : in  STD_LOGIC;
            B : in  STD_LOGIC;
            Y : out STD_LOGIC
        );
    end component;

begin

    NAND1: nand_gate
        port map (
            A => S,
            B => Qbar_int,
            Y => Q_int
        );

    NAND2: nand_gate
        port map (
            A => R,
            B => Q_int,
            Y => Qbar_int
        );

    Q    <= Q_int;
    Qbar <= Qbar_int;

end Structural;