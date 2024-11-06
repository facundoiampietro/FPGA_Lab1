library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Lab_FPGA is 
	Port ( SW1 : in STD_LOGIC;
				SW2 : in STD_LOGIC;
				SW3: in STD_LOGIC;
				LED : out STD_LOGIC);
end LAB_FPGA;

architecture Behavioral of LAB_FPGA is

begin
	LED <= (SW1 xnor not(SW2)) or (SW3 and not(SW2));

end Behavioral;