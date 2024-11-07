library verilog;
use verilog.vl_types.all;
entity restador_4_bits_vlg_check_tst is
    port(
        Borrow_out      : in     vl_logic;
        D0              : in     vl_logic;
        D1              : in     vl_logic;
        D2              : in     vl_logic;
        D3              : in     vl_logic;
        Zero            : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end restador_4_bits_vlg_check_tst;
