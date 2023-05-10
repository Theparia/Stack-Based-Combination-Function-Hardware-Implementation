`timescale 1ns/1ns

module Multiplexer2to1(input [3:0] in0, in1, input sel, output [3:0] out);
  assign out = sel ? in1 : in0;
endmodule

module Multiplexer3to1(input [3:0] in0, in1, in2, input [1:0] sel, output reg [3:0] out);
  always @(in0, in1, in2, sel)begin
    case(sel)
      3'b000: out = in0;
      3'b001: out = in1;
      3'b010: out = in2;
    endcase
  end 
endmodule
