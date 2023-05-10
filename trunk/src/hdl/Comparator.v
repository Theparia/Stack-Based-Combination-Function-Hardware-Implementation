`timescale 1ns/1ns

module Comparator(input[3:0] in0, in1, output eq);
  assign eq = (in0 == in1);
endmodule
