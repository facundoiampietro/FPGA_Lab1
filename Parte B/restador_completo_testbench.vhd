library ieee;
use ieee.std_logic_1164.all;

entity restador_completo_testbench is 
end restador_completo_testbench;

architecture behavior of restador_completo_testbench is 

	component restador_completo 
	port (
	ext_A, ext_B, ext_Borrow_in, clk: in std_logic;
		ext_D, ext_Borrow_out: out std_logic
		);
	end component;

	--Inputs
	signal ext_A : std_logic := '0';
	signal ext_B : std_logic := '0';
	signal ext_Borrow_in : std_logic := '0';
	signal clk : std_logic := '0';
	--Outputs
	signal ext_D : std_logic;
	signal ext_Borrow_out : std_logic;
	--Clock Period Definition
	constant clock_period : time := 20ns;
	
	begin
		--Instantiate UUT
		uut : restador_completo port map (
			ext_A => ext_A,
			ext_B => ext_B,
			ext_Borrow_in => ext_Borrow_in,
			clk => clk,
			ext_D => ext_D,
			ext_Borrow_out => ext_Borrow_out
		);
		
		--Clock Process Definitions
		clock_process: process
			begin
				clk <= '0';
				wait for clock_period/2;
				clk <= '1';
				wait for clock_period/2;
			end process;
		
		--Stimulus Process			
		stimulus_proc: process
			begin
				-- 000
				ext_A <= '0';
				ext_B <= '0';
				ext_Borrow_in <= '0';
				wait for 30 ns;

				-- 001
				ext_A <= '0';
				ext_B <= '0';
				ext_Borrow_in <= '1';
				wait for 30 ns;

				-- 010
				ext_A <= '0';
				ext_B <= '1';
				ext_Borrow_in <= '0';
				wait for 30 ns;

				-- 011
				ext_A <= '0';
				ext_B <= '1';
				ext_Borrow_in <= '1';
				wait for 30 ns;

				-- 100
				ext_A <= '1';
				ext_B <= '0';
				ext_Borrow_in <= '0';
				wait for 30 ns;

				-- 101
				ext_A <= '1';
				ext_B <= '0';
				ext_Borrow_in <= '1';
				wait for 30 ns;

				-- 110
				ext_A <= '1';
				ext_B <= '1';
				ext_Borrow_in <= '0';
				wait for 30 ns;

				-- 111
				ext_A <= '1';
				ext_B <= '1';
				ext_Borrow_in <= '1';
				wait for 30 ns;
				wait; 
			end process;
	end;
	