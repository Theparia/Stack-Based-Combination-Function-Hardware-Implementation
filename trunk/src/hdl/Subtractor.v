`timescale 1ns/1ns

module Subtractor(input [3:0] in0, in1, output [3:0] out);
  assign out = in0 - in1;
endmodule
