-- Quartus II VHDL Template
-- Four-State Moore State Machine

-- A Moore machine's outputs are dependent only on the current state.
-- The output is written only when the state changes.  (State
-- transitions are synchronous.)

library ieee;
use ieee.std_logic_1164.all;

entity Template_Parte_D is

	port(
		clk		 : in	std_logic;
		x	 : in	std_logic;
		reset	 : in	std_logic;
		z	 : out	std_logic_vector(3 downto 0) --defino salida como vector de 4 bits
	);

end entity;

architecture rtl of Template_Parte_D is

	-- Build an enumerated type for the state machine
	type state_type is (s0, s1, s2, s3, s4, s5, s6);

	-- Register to hold the current state
	signal state   : state_type;

begin

	-- Logic to advance to the next state
	process (clk, reset)
	begin
		if reset = '1' then
			state <= s0;
		elsif (rising_edge(clk)) then
			case state is
			--Estado s0
				when s0=>
					if x = '1' then
						state <= s2;
					else
						state <= s1;
					end if;
			--Estado s1
				when s1=>
						state <= s3;
			--Estado s2
				when s2=>
					state <= s4;
			--Estado s3
				when s3 =>
					if x = '1' then
						state <= s6;
					else
						state <= s5;
					end if;
			--Estado s4
				when s4 =>
						state <= s3;
			--Estad0 s5
				when s5 =>
						state <= s0;
			--Estado s6
				when s6 =>
						state <=s0;
			end case;
		end if;
	end process;

	-- Output depends solely on the current state
	process (state)
	begin
		case state is
			when s0 =>
				z <= "0000";
			when s1 =>
				z <= "0110";
			when s2 =>
				z <= "1000";
			when s3 =>
				z <= "1111";
			when s4 =>
				z <= "1100";
			when s5 =>
				z <= "1001";
			when s6 =>
				z <= "1100";
		end case;
	end process;

end rtl;
