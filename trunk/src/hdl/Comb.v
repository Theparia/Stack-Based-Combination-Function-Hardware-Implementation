`timescale 1ns/1ns

module Comb(input clk, rst, start, input [3:0] m, n, output done, output [12:0] result);
  wire push, pop,  sel_m, sel_n, ld_m, ld_n, en_acc, is_empty, eq1, eq2;
  wire [1:0] sel_stack;
  
  Datapath datapath(clk, rst, push, pop,  sel_m, sel_n, ld_m, ld_n, en_acc, sel_stack, 
                    n, m, is_empty, eq1, eq2, result);
            
  Controller controller(clk, rst, start, is_empty, eq1, eq2, done, push, pop,  sel_m, sel_n,
                        ld_m, ld_n, en_acc,sel_stack);
endmodule
