`timescale 1ns/1ns

module Accumulator(input clk, rst, en, output reg [12:0] out);
  always @(posedge clk, posedge rst)begin
    if(rst)
      out <= 13'd0;
    else if(en)
      out <= out + 13'd1;
    end
endmodule
