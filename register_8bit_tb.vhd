LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY register_8bit_tb IS
END register_8bit_tb;

ARCHITECTURE behavior OF register_8bit_tb IS

    COMPONENT register_8bit
    PORT(
         D    : IN  std_logic_vector(7 downto 0);
         CLK  : IN  std_logic;
         Q    : OUT std_logic_vector(7 downto 0);
         Qbar : OUT std_logic_vector(7 downto 0)
        );
    END COMPONENT;

    signal D    : std_logic_vector(7 downto 0) := (others => '0');
    signal CLK  : std_logic := '0';

    signal Q    : std_logic_vector(7 downto 0);
    signal Qbar : std_logic_vector(7 downto 0);

    constant CLK_period : time := 10 ns;

BEGIN

    -- Instantiate 8-bit register
    uut: register_8bit PORT MAP (
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

        -- Test 1
        D <= "00000000";
        wait for 10 ns;

        -- Test 2
        D <= "10101010";
        wait for 10 ns;

        -- Test 3
        D <= "11110000";
        wait for 10 ns;

        -- Test 4
        D <= "01010101";
        wait for 10 ns;

        -- Test 5
        D <= "11111111";
        wait for 10 ns;

        -- Test 6
        D <= "00001111";
        wait for 10 ns;

        wait;

    end process;

END;