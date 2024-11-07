library verilog;
use verilog.vl_types.all;
entity restador_completo is
    port(
        ext_A           : in     vl_logic;
        ext_B           : in     vl_logic;
        ext_Borrow_in   : in     vl_logic;
        clk             : in     vl_logic;
        ext_D           : out    vl_logic;
        ext_Borrow_out  : out    vl_logic
    );
end restador_completo;
