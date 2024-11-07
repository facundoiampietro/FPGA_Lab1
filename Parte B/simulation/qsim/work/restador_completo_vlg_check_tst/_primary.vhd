library verilog;
use verilog.vl_types.all;
entity restador_completo_vlg_check_tst is
    port(
        ext_Borrow_out  : in     vl_logic;
        ext_D           : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end restador_completo_vlg_check_tst;
