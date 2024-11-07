library verilog;
use verilog.vl_types.all;
entity restador_completo_vlg_sample_tst is
    port(
        clk             : in     vl_logic;
        ext_A           : in     vl_logic;
        ext_B           : in     vl_logic;
        ext_Borrow_in   : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end restador_completo_vlg_sample_tst;
