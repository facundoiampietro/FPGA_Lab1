library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity almacenar_data is
    port(
        SDA         : in  std_logic;            -- Serial Data Line
        SCL         : in  std_logic;            -- Serial Clock Line
        hab_dat : in  std_logic;          		-- Señal de habilitación
        fin_dato    : out std_logic             -- Señal de finalización
    );
end entity almacenar_data;

architecture behavior of almacenar_data is

    signal contador    : unsigned(2 downto 0) := (others => '0'); -- Contador de 3 bits (0 a 7)
    signal registro    : std_logic_vector(7 downto 0) := (others => '0'); -- Registro de 8 bits para almacenar datos

begin

    -- Proceso que cuenta los ciclos y guarda los datos en el registro
    process(SCL)
    begin
        if rising_edge(SCL) then --trabajo con ciclo ascendente
            if hab_dat = '1' then
                if contador < to_unsigned(7, contador'length) then --verifica si el valor de contador es menor que 7 en su representación binaria de 3 bits.
                    -- Incrementar el contador (de 0 a 7) y almacenar SDA en el registro
                    contador <= contador + 1;
                    registro(to_integer(contador)) <= SDA;
                elsif contador = to_unsigned(7, contador'length) then
                    -- Cuando se reciben los 8 bits, fin_dato=1 y reseteo el contador
                    fin_dato <= '1';
						  contador <= (others => '0');
                end if;
            else
                -- Resetear el contador y finalizo cuando habilitación = 0
                contador <= (others => '0');
                fin_dato <= '0';
            end if;
        end if;
    end process;

end architecture behavior;
