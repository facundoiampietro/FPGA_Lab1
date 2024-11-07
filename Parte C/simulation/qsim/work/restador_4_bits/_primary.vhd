library verilog;
use verilog.vl_types.all;
entity restador_4_bits is
    port(
        D0              : out    vl_logic;
        A0              : in     vl_logic;
        CLK             : in     vl_logic;
        B0              : in     vl_logic;
        Borrow_in       : in     vl_logic;
        D1              : out    vl_logic;
        A1              : in     vl_logic;
        B1              : in     vl_logic;
        D2              : out    vl_logic;
        A2              : in     vl_logic;
        B2              : in     vl_logic;
        D3              : out    vl_logic;
        A3              : in     vl_logic;
        B3              : in     vl_logic;
        Borrow_out      : out    vl_logic;
        Zero            : out    vl_logic
    );
end restador_4_bits;
