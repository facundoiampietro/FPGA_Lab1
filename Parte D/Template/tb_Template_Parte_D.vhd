LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY tb_Template_Parte_D IS
END tb_Template_Parte_D;

ARCHITECTURE behavior OF tb_Template_Parte_D IS
    -- Component declaration for the unit under test (UUT)
    COMPONENT Template_Parte_D
        PORT (
            reset : IN STD_LOGIC;
            clk : IN STD_LOGIC;
            x : IN STD_LOGIC;
            z  : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
        );
    END COMPONENT;

    -- Signals to connect to the UUT
    SIGNAL reset : STD_LOGIC := '0';
    SIGNAL clk : STD_LOGIC := '0';
    SIGNAL x : STD_LOGIC := '0';
    SIGNAL z : STD_LOGIC_VECTOR(3 DOWNTO 0);
	 
	 -- Clock Period
	 CONSTANT clock_period : time := 20ns;

BEGIN
    -- Instantiate the Unit Under Test (UUT)
    uut: Template_Parte_D PORT MAP (
        reset => reset,
        clk => clk,
        x => x,
        z => z
    );

    -- Clock process definitions
    clock_process : PROCESS
    BEGIN
        clk <= '0';
        WAIT FOR clock_period/2;
        clk <= '1';
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
