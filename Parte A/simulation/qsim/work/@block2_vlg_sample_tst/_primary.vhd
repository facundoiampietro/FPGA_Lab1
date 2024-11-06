library verilog;
use verilog.vl_types.all;
entity Block2_vlg_sample_tst is
    port(
        PIN_AC14        : in     vl_logic;
        PIN_AC19        : in     vl_logic;
        PIN_AD18        : in     vl_logic;
        SW1             : in     vl_logic;
        SW2             : in     vl_logic;
        SW3             : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end Block2_vlg_sample_tst;
