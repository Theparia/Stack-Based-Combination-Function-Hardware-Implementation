library verilog;
use verilog.vl_types.all;
entity Datapath is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        push            : in     vl_logic;
        pop             : in     vl_logic;
        sel_m           : in     vl_logic;
        sel_n           : in     vl_logic;
        ld_m            : in     vl_logic;
        ld_n            : in     vl_logic;
        en_acc          : in     vl_logic;
        sel_stack       : in     vl_logic_vector(1 downto 0);
        n               : in     vl_logic_vector(3 downto 0);
        m               : in     vl_logic_vector(3 downto 0);
        is_empty        : out    vl_logic;
        eq1             : out    vl_logic;
        eq2             : out    vl_logic;
        result          : out    vl_logic_vector(12 downto 0)
    );
end Datapath;
