library ieee;
use ieee.std_logic_1164.all; 

entity restador_completo is 
	port (
		A, B, Borrow_in : in std_logic; 
		D, Borrow_out: out std_logic);
end restador_completo;

architecture behavioral of restador_completo is 

begin
	D <= A xor B xor Borrow_in; 
	Borrow_out <=(not(A) and B) or (Borrow_in and(not(A) or B)); 
		
end behavioral;