`timescale 1ns/1ns

module Register(input clk, ld, input [3:0] in, output reg [3:0] out);
  always@(posedge clk)begin
    if(ld)
      out <= in;
  end
endmodule
