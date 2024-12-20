library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity almacenar_dir is
    port(
        SDA         : in  std_logic;            -- Serial Data Line
        SCL         : in  std_logic;            -- Serial Clock Line
        Hab_dir     : in  std_logic;            -- Señal de habilitación
        fin_dir     : out std_logic;            -- Señal de finalización de dirección
        soy         : out std_logic             -- Señal que indica si la dirección y los datos coinciden
    );
end entity almacenar_dir;

architecture behavior of almacenar_dir is

    signal contador    : unsigned(2 downto 0) := (others => '0'); -- Contador de 3 bits (0 a 6)
    signal registro    : std_logic_vector(6 downto 0) := (others => '0'); -- Registro de 7 bits para almacenar datos
	signal dir_almacenada : std_logic_vector(6 downto 0) := "0101011";  -- Registro para almacenar la dirección

begin

    -- Proceso que cuenta los ciclos y guarda los datos en el registro
    process(SCL)
    begin
        if rising_edge(SCL) then
            if Hab_dir = '1' then -- Solo si Hab_dir está en alto (habilitado)
                if contador < to_unsigned(6, contador'length) then
                    -- Incrementar el contador (de 0 a 6) y almacenar SDA en el registro
                    contador <= contador + 1;
                    registro(to_integer(contador)) <= SDA;
                elsif contador = to_unsigned(6, contador'length) then
                    -- Cuando se reciben los 7 bits, fin_dir=1 y reseteo el contador
                    fin_dir <= '1';
                    contador <= (others => '0');
                end if;
            else
                -- Resetear el contador y fin_dir cuando habilitación = 0
                contador <= (others => '0');
                fin_dir <= '0';
            end if;
        end if;
    end process;

    -- Comparación de la dirección almacenada con el valor del registro
    process(registro, dir_almacenada)
    begin
        if registro = dir_almacenada then
            soy <= '1';  -- Si los datos coinciden con la dirección, soy=1
        else
            soy <= '0';  -- Caso contrario, soy=0
        end if;
    end process;

end architecture behavior;
