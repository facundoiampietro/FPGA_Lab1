LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY restador_4_bits_testbench IS
END restador_4_bits_testbench;

ARCHITECTURE behavior OF restador_4_bits_testbench IS

    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT restador_4_bits
    PORT(
        Borrow_in : IN  std_logic;
        A0, A1, A2, A3 : IN  std_logic;
        B0, B1, B2, B3 : IN  std_logic;
        CLK : IN  std_logic;
        D0, D1, D2, D3 : OUT std_logic;
        Borrow_out : OUT std_logic;
        Zero : OUT std_logic
        );
    END COMPONENT;
    
    -- Signals to connect to UUT
    signal Borrow_in : std_logic := '0';
    signal A0, A1, A2, A3 : std_logic := '0';
    signal B0, B1, B2, B3 : std_logic := '0';
    signal CLK : std_logic := '0';
    signal D0, D1, D2, D3 : std_logic := '0';
    signal Borrow_out : std_logic := '0';
    signal Zero : std_logic := '0';
	 
	 --Clock period definitions
	 constant clock_period : time := 20ns;

BEGIN

    -- Instantiate the Unit Under Test (UUT)
    uut: restador_4_bits PORT MAP (
        Borrow_in => Borrow_in,
        A0 => A0, 
		  A1 => A1, 
		  A2 => A2, 
		  A3 => A3,
        B0 => B0, 
		  B1 => B1, 
		  B2 => B2, 
		  B3 => B3,
        CLK => CLK,
        D0 => D0, 
		  D1 => D1, 
		  D2 => D2, 
		  D3 => D3,
        Borrow_out => Borrow_out,
        Zero => Zero
    );

    -- Clock process definitions
    CLK_process :process
    begin
        CLK <= '0';
        wait for clock_period/2;
        CLK <= '1';
        wait for clock_period/2;
    end process;

    -- Stimulus process
    stim_proc: process
    begin  
	 
        -- Caso 1: A = 0100 (4), B = 0001 (1), Borrow_in = 0 : Resta normal sin Borrow
        A3 <= '0'; A2 <= '1'; A1 <= '0'; A0 <= '0';
        B3 <= '0'; B2 <= '0'; B1 <= '0'; B0 <= '1';
        Borrow_in <= '0';
        wait for 2*clock_period;
		  
        -- Caso 2: A = 1111 (15), B = 1111 (15), Borrow_in = 0 : Prueba máx sin borrow, esperando z = 1
        A3 <= '1'; A2 <= '1'; A1 <= '1'; A0 <= '1';
        B3 <= '1'; B2 <= '1'; B1 <= '1'; B0 <= '1';
        Borrow_in <= '0';
        wait for 2*clock_period;

        -- Caso 3: A = 0010 (2), B = 0100 (4), Borrow_in = 0 : Prueba resta negativa
        A3 <= '0'; A2 <= '0'; A1 <= '1'; A0 <= '0';
        B3 <= '0'; B2 <= '1'; B1 <= '0'; B0 <= '0';
        Borrow_in <= '0';
        wait for 2*clock_period;
		  -- Expected: Borrow_out = 1

        -- Caso 4: A = 0000, B = 0000, Borrow_in = 1
        A3 <= '0'; A2 <= '0'; A1 <= '0'; A0 <= '0';
        B3 <= '0'; B2 <= '0'; B1 <= '0'; B0 <= '0';
        Borrow_in <= '1';
        wait for 2*clock_period;

        -- Caso 5: A = 0111 (7), B = 0011 (3), Borrow_in = 1
        A3 <= '0'; A2 <= '1'; A1 <= '1'; A0 <= '1';
        B3 <= '0'; B2 <= '0'; B1 <= '1'; B0 <= '1';
        Borrow_in <= '1';
        wait for 2*clock_period;
		  
		  -- Caso 6: A = 1111 (15), B = 1111 (15), Borrow_in = 1 : Prueba máx con borrow
        A3 <= '1'; A2 <= '1'; A1 <= '1'; A0 <= '1';
        B3 <= '1'; B2 <= '1'; B1 <= '1'; B0 <= '1';
        Borrow_in <= '1';
        wait for 2*clock_period;

        wait;
    end process;
END;
