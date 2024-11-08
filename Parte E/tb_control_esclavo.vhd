LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY tb_control_esclavo IS
END tb_control_esclavo;

ARCHITECTURE behavior OF tb_control_esclavo IS 

    -- Componentes del diseño
    COMPONENT control_esclavo
        PORT(
            SDA     : IN STD_LOGIC;
            SCL     : IN STD_LOGIC;
            reset   : IN STD_LOGIC
        );
    END COMPONENT;

    COMPONENT almacenar_data
        PORT(
            SDA     : IN STD_LOGIC;
            SCL     : IN STD_LOGIC;
            hab_dat : IN STD_LOGIC;
            fin_dato: OUT STD_LOGIC
        );
    END COMPONENT;

    COMPONENT almacenar_dir
        PORT(
            SDA     : IN STD_LOGIC;
            SCL     : IN STD_LOGIC;
            Hab_dir : IN STD_LOGIC;
            fin_dir : OUT STD_LOGIC;
            soy     : OUT STD_LOGIC
        );
    END COMPONENT;

    -- Señales para las pruebas
    SIGNAL SDA         : STD_LOGIC := '0';
    SIGNAL SCL         : STD_LOGIC := '0';
    SIGNAL reset       : STD_LOGIC := '0';
    SIGNAL soy         : STD_LOGIC;
    SIGNAL fin_dato    : STD_LOGIC;
    SIGNAL fin_dir     : STD_LOGIC;
    SIGNAL Hab_dir     : STD_LOGIC;
    SIGNAL Hab_dat     : STD_LOGIC;

BEGIN

    -- Instanciación de los componentes
    control_esclavo_inst : CONTROL_ESCLAVO
        PORT MAP (
            SDA => SDA,
            SCL => SCL,
            reset => reset
        );

    almacenar_data_inst : ALMACENAR_DATA
        PORT MAP (
            SDA => SDA,
            SCL => SCL,
            hab_dat => Hab_dat,
            fin_dato => fin_dato
        );

    almacenar_dir_inst : ALMACENAR_DIR
        PORT MAP (
            SDA => SDA,
            SCL => SCL,
            Hab_dir => Hab_dir,
            fin_dir => fin_dir,
            soy => soy
        );

    -- Proceso de generación de señales para prueba
    stimulus : PROCESS
    BEGIN
        -- Inicialización
        reset <= '1'; -- Activar reset
        WAIT FOR 10 ns;
        reset <= '0'; -- Desactivar reset
        WAIT FOR 10 ns;
        
        -- Generar un ciclo de reloj para SCL y SDA para enviar la dirección "0101011"
        -- Es importante asegurarse de que SDA y SCL cambian correctamente

        -- Enviar la dirección "0101011"
        SDA <= '0'; -- bit 1
        WAIT FOR 10 ns;
        SDA <= '1'; -- bit 2
        WAIT FOR 10 ns;
        SDA <= '0'; -- bit 3
        WAIT FOR 10 ns;
        SDA <= '1'; -- bit 4
        WAIT FOR 10 ns;
        SDA <= '0'; -- bit 5
        WAIT FOR 10 ns;
        SDA <= '1'; -- bit 6
        WAIT FOR 10 ns;
        SDA <= '1'; -- bit 7 (dirección completa)
        WAIT FOR 10 ns;
        
        -- Activar la señal de habilitación para la dirección
        Hab_dir <= '1'; -- Habilitar dirección
        WAIT FOR 10 ns;
        Hab_dir <= '0'; -- Deshabilitar dirección

        -- Verificar si la señal soy se pone en alto
        WAIT FOR 50 ns; -- Esperar y observar si soy = '1'
        ASSERT soy = '1' REPORT "La dirección es correcta, soy debería ser '1'" SEVERITY ERROR;

        -- Terminar la simulación
        WAIT;
    END PROCESS;

END behavior;
