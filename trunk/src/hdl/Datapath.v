`timescale 1ns/1ns

module Datapath(input clk, rst, push, pop,  sel_m, sel_n, ld_m, ld_n, en_acc,
                input[1:0] sel_stack, input [3:0] n, m, output is_empty, eq1, eq2,
                output [12:0] result);
                
  wire [3:0] d_in, d_out, mux_m_out, mux_n_out, reg_m_out, reg_n_out, sub_m_out, sub_n_out;
                
  Stack stack(clk, rst, push, pop, d_in, is_empty, d_out);
  Multiplexer2to1 mux_m(d_out, m, sel_m, mux_m_out);
  Multiplexer2to1 mux_n(d_out, n, sel_n, mux_n_out);
  Register reg_m(clk, ld_m, mux_m_out, reg_m_out);
  Register reg_n(clk, ld_n, mux_n_out, reg_n_out);
  Subtractor sub_m(reg_m_out, 4'd1, sub_m_out);
  Subtractor sub_n(reg_n_out, 4'd1, sub_n_out);
  Multiplexer3to1 mux_stack(reg_m_out, sub_m_out, sub_n_out, sel_stack, d_in);
  Comparator cmp_m_n(reg_m_out, reg_n_out, eq1);
  Comparator cmp_m_0(reg_m_out, 4'd0, eq2);
  Accumulator accumulator(clk, rst, en_acc, result);
endmodule

  
