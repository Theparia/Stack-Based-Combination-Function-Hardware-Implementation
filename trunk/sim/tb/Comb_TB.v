`timescale 1ns/1ns

module Comb_TB();  
  reg clk = 1'b0, rst = 1'b1, start = 1'b1;
  reg [3:0] n = 4'd15;
  reg [3:0] m = 4'd7;
  wire done;
  wire [12:0] result;
  always #10 clk = ~clk;
  Comb CUT(clk, rst, start, m, n, done, result);
  initial begin
    #51 rst = 1'b0;
    #21 start = 1'b1;
    #21 start = 1'b0;
    #100000000 $stop;
  end 
endmodule
