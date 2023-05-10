library verilog;
use verilog.vl_types.all;
entity Multiplexer3to1 is
    port(
        in0             : in     vl_logic_vector(3 downto 0);
        in1             : in     vl_logic_vector(3 downto 0);
        in2             : in     vl_logic_vector(3 downto 0);
        sel             : in     vl_logic_vector(1 downto 0);
        \out\           : out    vl_logic_vector(3 downto 0)
    );
end Multiplexer3to1;
