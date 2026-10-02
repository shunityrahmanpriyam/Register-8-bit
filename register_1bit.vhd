library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity register_1bit is
    Port (
        D    : in  STD_LOGIC;
        CLK  : in  STD_LOGIC;
        Q    : out STD_LOGIC;
        Qbar : out STD_LOGIC
    );
end register_1bit;

architecture Structural of register_1bit is

    component d_flipflop
        Port (
            D    : in  STD_LOGIC;
            CLK  : in  STD_LOGIC;
            Q    : out STD_LOGIC;
            Qbar : out STD_LOGIC
        );
    end component;

begin

    DFF1: d_flipflop
        port map (
            D    => D,
            CLK  => CLK,
            Q    => Q,
            Qbar => Qbar
        );

end Structural;
