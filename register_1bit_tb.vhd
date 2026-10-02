LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY register_1bit_tb IS
END register_1bit_tb;

ARCHITECTURE behavior OF register_1bit_tb IS

    COMPONENT register_1bit
    PORT(
         D    : IN  std_logic;
         CLK  : IN  std_logic;
         Q    : OUT std_logic;
         Qbar : OUT std_logic
        );
    END COMPONENT;

    signal D    : std_logic := '0';
    signal CLK  : std_logic := '0';
    signal Q    : std_logic;
    signal Qbar : std_logic;

    constant CLK_period : time := 10 ns;

BEGIN

    -- Instantiate 1-bit register
    uut: register_1bit PORT MAP (
          D    => D,
          CLK  => CLK,
          Q    => Q,
          Qbar => Qbar
        );

    -- Clock generation
    CLK_process :process
    begin
        CLK <= '0';
        wait for CLK_period/2;
        CLK <= '1';
        wait for CLK_period/2;
    end process;

    -- Input stimulus
    stim_proc: process
    begin

        -- D = 0
        D <= '0';
        wait for 10 ns;

        -- D = 1
        D <= '1';
        wait for 10 ns;

        -- D = 0
        D <= '0';
        wait for 10 ns;

        -- D = 1
        D <= '1';
        wait for 10 ns;

        -- D = 0
        D <= '0';
        wait for 10 ns;

        wait;

    end process;

END;