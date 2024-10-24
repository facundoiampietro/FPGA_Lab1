library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Lab_FPGA_testbench is 
end LAB_FPGA_testbench;
	
architecture behavior of Lab_FPGA_testbench is 

component Lab_FPGA 
	Port ( SW1 : in STD_LOGIC;
				SW2 : in STD_LOGIC;
				SW3: in STD_LOGIC;
				LED : out STD_LOGIC);
end component; 

--Inputs
signal SW1: STD_LOGIC := '0';
signal SW2: STD_LOGIC := '0';
signal SW3: STD_LOGIC := '0';

--Outputs
signal LED: STD_LOGIC; 

begin
uut: Lab_FPGA port map (
SW1 => SW1,
SW2 => SW2,
SW3 => SW3,
LED => LED
);

--Stimulus process
stim_proc: process
begin
	wait for 20 ns; 
	SW1 <= '0';
	SW2 <= '0';
	SW3 <= '0';
	wait for 20 ns; 
	SW1 <= '0';
	SW2 <= '0';
	SW3 <= '1';
	wait for 20 ns; 
	SW1 <= '0';
	SW2 <= '1';
	SW3 <= '0';
	wait for 20 ns; 
	SW1 <= '0';
	SW2 <= '1';
	SW3 <= '1';
	end process;
end;
end;

