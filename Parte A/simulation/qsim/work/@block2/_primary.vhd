library verilog;
use verilog.vl_types.all;
entity Block2 is
    port(
        LED             : out    vl_logic;
        SW2             : in     vl_logic;
        SW3             : in     vl_logic;
        SW1             : in     vl_logic;
        PIN_AG19        : out    vl_logic;
        PIN_AC14        : in     vl_logic;
        PIN_AD18        : in     vl_logic;
        PIN_AC19        : in     vl_logic
    );
end Block2;
