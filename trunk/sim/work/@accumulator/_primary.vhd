library verilog;
use verilog.vl_types.all;
entity Accumulator is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        en              : in     vl_logic;
        \out\           : out    vl_logic_vector(12 downto 0)
    );
end Accumulator;
