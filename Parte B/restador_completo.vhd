library ieee;
use ieee.std_logic_1164.all;

entity restador_completo is 
	port (
		ext_A, ext_B, ext_Borrow_in, clk: in std_logic; -- con ext referencio entradas previo al latcheo, i.e "externas"
		ext_D, ext_Borrow_out: out std_logic);
end restador_completo;

architecture behavioral of restador_completo is

component D_FF
	port(D,CLOCK: in std_logic;
	Q: out std_logic);
end component; 

signal a, b, bin, bout, d: std_logic; --señales para latchear y con las que hago la función lógica
	begin
		d <= a xor b xor bin; --salida diferencia
		bout <=(not(a) and b) or (bin and(not(a) or b)); --bout salida borrow out
		
-- instancio ff. Recordar D=entrada FF, clock, Q=estado
FF_A: D_FF port map(ext_A, clk, a);
FF_B: D_FF port map(ext_B, clk, b);
FF_Borrow_in: D_FF port map(ext_Borrow_in, clk, bin);
FF_Diff: D_FF port map(d, clk, ext_D);
FF_Borrow_out: D_FF port map(bout, clk, ext_Borrow_out);
end behavioral;