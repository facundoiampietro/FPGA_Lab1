library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

entity divisor is 
	port (
		A : in std_logic_vector(5 downto 0); -- A(4,2) => son 6 bits
		B : in std_logic_vector(5 downto 0); -- B(3,3) => son 6 bits
		C: out std_logic_vector(9 downto 0) -- C(7,3) => son 10 bits y cubro peor caso
	);
end divisor; 

architecture behavioral of divisor is
	signal a_zp : unsigned(15 downto 0); --Debo agregar 6 ceros a parte entera y 4 a la fraccionaria => 10 en total
	signal b_div : unsigned(5 downto 0);
	signal cociente : unsigned(15 downto 0);
	--converti los vectores a unsigned para poder operar
	begin
		process (a,b)
		begin
			a_zp <= "000000" & unsigned(A) & "0000"; --hago el zp con 6 a la izquierda y 4 a la derecha. Con & concateno 
			b_div <= unsigned(B);
			cociente <= a_zp/b_div;
			C <= std_logic_vector(cociente(9 downto 0));
		end process;
end behavioral;