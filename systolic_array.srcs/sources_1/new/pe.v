`timescale 1ns / 1ps
module pe(
    input clk,rst_n,valid,
    input signed [7:0] a,b, 
    output reg signed [7:0] a_out,b_out,
    output reg signed [25:0] ps,
    output reg valid_out
    );
    always@(posedge clk) begin
        if (!rst_n) begin   
            a_out <=0;
            b_out<=0;
            ps <=0;
            valid_out <=0;
        end
        else if (valid) begin
            ps <= ps+ (a*b);
            a_out <= a;
            b_out <= b; 
            valid_out <= 1'b1;
            end 
      end 
endmodule
    
