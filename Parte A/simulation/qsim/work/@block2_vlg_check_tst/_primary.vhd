library verilog;
use verilog.vl_types.all;
entity Block2_vlg_check_tst is
    port(
        LED             : in     vl_logic;
        PIN_AG19        : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end Block2_vlg_check_tst;
