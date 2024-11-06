library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Lab_FPGA_testbench is 
end Lab_FPGA_testbench;
	
architecture behavior of Lab_FPGA_testbench is 

--Component declaration for the UUT

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
--Instantiatethe UUT (Unit Under Test)
uut: Lab_FPGA port map (
SW1 => SW1,
SW2 => SW2,
SW3 => SW3,
LED => LED
);

-- Stimulus Process
stim_proc: process
begin
    -- Combinación 000
    SW1 <= '0';
    SW2 <= '0';
    SW3 <= '0';
    wait for 20 ns; 

    -- Combinación 001
    SW1 <= '0';
    SW2 <= '0';
    SW3 <= '1';
    wait for 20 ns; 

    -- Combinación 010
    SW1 <= '0';
    SW2 <= '1';
    SW3 <= '0';
    wait for 20 ns; 

    -- Combinación 011
    SW1 <= '0';
    SW2 <= '1';
    SW3 <= '1';
    wait for 20 ns; 

    -- Combinación 100
    SW1 <= '1';
    SW2 <= '0';
    SW3 <= '0';
    wait for 20 ns; 

    -- Combinación 101
    SW1 <= '1';
    SW2 <= '0';
    SW3 <= '1';
    wait for 20 ns; 

    -- Combinación 110
    SW1 <= '1';
    SW2 <= '1';
    SW3 <= '0';
    wait for 20 ns; 

    -- Combinación 111
    SW1 <= '1';
    SW2 <= '1';
    SW3 <= '1';
    wait for 20 ns; 
	 
end process;

end;


