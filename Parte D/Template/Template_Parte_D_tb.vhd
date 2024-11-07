LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY tb_Parte_D IS
END tb_Parte_D;

ARCHITECTURE behavior OF tb_Parte_D IS
    -- Component declaration for the unit under test (UUT)
    COMPONENT Template_Parte_D
        PORT (
            reset : IN STD_LOGIC;
            clock : IN STD_LOGIC;
            x : IN STD_LOGIC;
            Z4 : OUT STD_LOGIC;
            Z3 : OUT STD_LOGIC;
            Z2 : OUT STD_LOGIC;
            Z1 : OUT STD_LOGIC
        );
    END COMPONENT;

    -- Signals to connect to the UUT
    SIGNAL reset : STD_LOGIC := '0';
    SIGNAL clock : STD_LOGIC := '0';
    SIGNAL x : STD_LOGIC := '0';
    SIGNAL Z4 : STD_LOGIC := '0';
    SIGNAL Z3 : STD_LOGIC := '0';
    SIGNAL Z2 : STD_LOGIC := '0';
    SIGNAL Z1 : STD_LOGIC := '0';
	 
	 -- Clock Period
	 CONSTANT clock_period : time := 20ns;

BEGIN
    -- Instantiate the Unit Under Test (UUT)
    uut: Parte_D PORT MAP (
        reset => reset,
        clock => clock,
        x => x,
        Z4 => Z4,
        Z3 => Z3,
        Z2 => Z2,
        Z1 => Z1
    );

    -- Clock process definitions
    clock_process : PROCESS
    BEGIN
        clock <= '0';
        WAIT FOR clock_period/2;
        clock <= '1';
        WAIT FOR clock_period/2;
    END PROCESS clock_process;

    -- Stimulus process
    stim_proc : PROCESS
    BEGIN
        -- 1: Apply reset 
        reset <= '1';  
        WAIT FOR clock_period*2;
        reset <= '0';  
        WAIT FOR clock_period*2;
		  
		--Alterno entrada entre 0 y 1
		  
		-- 2: x = 0 (debe transicionar a s2)
			x <= '0'; 
        WAIT FOR clock_period*2;
		  
		  --3: x = 1 (debe transicionar a s4)
		  x <= '1';
		  WAIT FOR clock_period*2;
		  
		  --4: x = 0 (debe transicionar a s6)
			x <= '0';
			WAIT FOR clock_period*2;
			
			--5: x = 1 (debe transicionar a s1)
			x <= '1'; 
			WAIT FOR clock_period*2;
			
			-- Volví a estado inicial, ahora hago transiciones no hechas antes para verificar funcionamiento
			
			--6: x = 1 (debe transicionar a s3)
			x <= '1';
			WAIT FOR clock_period*2;
			
			--7: x = 0 (debe transicionar a s5)
			x <= '0';
			WAIT FOR clock_period*2;
			
			--8 x = 1 (debe transicionar  a s4)
			x <= '1'; 
			WAIT FOR clock_period*2;
			
			--9 x = 1 (debe transicionar a s7)
			x <= '1';
			WAIT FOR clock_period*2;
			
			-- x = 0 (debe transicionar a s1)
			x <= '0';
			WAIT FOR clock_period*2;
			
        WAIT;
    END PROCESS stim_proc;

END behavior;
