library verilog;
use verilog.vl_types.all;
entity Parte_D is
    port(
        reset           : in     vl_logic;
        clock           : in     vl_logic;
        x               : in     vl_logic;
        Z4              : out    vl_logic;
        Z3              : out    vl_logic;
        Z2              : out    vl_logic;
        Z1              : out    vl_logic
    );
end Parte_D;
