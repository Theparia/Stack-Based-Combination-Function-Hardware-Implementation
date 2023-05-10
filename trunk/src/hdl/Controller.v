`timescale 1ns/1ns

module Controller(input clk, rst, start, is_empty, eq1, eq2, output reg done, push, pop,  sel_m, sel_n,
                  ld_m, ld_n, en_acc, output reg [1:0] sel_stack);
                  
 reg [3:0] ns, ps;
 parameter [4:0] q0 = 0, q1 = 1, q2 = 2, q3 = 3, q4 = 4, q5 = 5, q6 = 6, q7 = 7, q8 = 8,
                 q9 = 9, q10 = 10, q11 = 11, q12 = 12, q13 = 13;
       
  always @(ps) begin
    {done, push, pop, sel_m, sel_n, ld_m, ld_n, en_acc, sel_stack} = 10'd0;
    case(ps)
      q0: begin ns = start ? q1 : q0; end
      q1: begin ns = q2; {sel_m, sel_n, ld_m, ld_n} = 4'b1111; end
      q2: begin ns = ((eq1 == 1) || (eq2 == 1)) ? q12 : q3; end
      q3: begin ns = q4; push = 1'b1; sel_stack = 2'd0; end
      q4: begin ns = q5; push = 1'b1; sel_stack = 2'd2; end
      q5: begin ns = q6; push = 1'b1; sel_stack = 2'd1; end
      q6: begin ns = q7; push = 1'b1; sel_stack = 2'd2; end
      q7: begin ns = q8; pop = 1'b1; end
      q8: begin ns = q9; ld_n = 1'b1; end
      q9: begin ns = q10; pop = 1'b1; end
      q10: begin ns = q11; ld_m = 1'b1; end
      q11: begin ns = ((eq1 == 1) || (eq2 == 1)) ? q12 : q3; end
      q12: begin ns = is_empty ? q13 : q7; en_acc = 1'b1; end
      q13: begin ns = q0; done = 1'b1; end
    endcase
  end       
                    
  always@(posedge clk, posedge rst)begin
    if(rst)
      ps <= q0;
    else
      ps <= ns;
  end                
endmodule
