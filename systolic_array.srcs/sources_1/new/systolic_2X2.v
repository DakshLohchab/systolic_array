`timescale 1ns / 1ps
module systolic_2X2(
    input clk,rst_n,valid_a0,valid_a1,
    input signed [7:0] a0_in,a1_in,b0_in,b1_in,
    output signed [25:0] c00,c01,c10,c11
    );
    wire signed [7:0] a00_to_01;
    wire signed [7:0] a10_to_11;
    wire signed [7:0] b00_to_10;
    wire signed [7:0] b01_to_11;
    wire v00_to_01;
    wire v10_to_11;
    wire v01_to_11;
    wire v11;
    assign v11 = v01_to_11 & v10_to_11;
    pe PE00(.clk(clk),.rst_n(rst_n),.valid(valid_a0),.a(a0_in),.b(b0_in),.ps(c00),.valid_out(v00_to_01),.a_out(a00_to_01),.b_out(b00_to_10));
    pe PE01(.clk(clk),.rst_n(rst_n),.valid(v00_to_01),.a(a00_to_01),.b(b1_in),.ps(c01),.valid_out(v01_to_11),.a_out(),.b_out(b01_to_11));
    pe PE10(.clk(clk),.rst_n(rst_n),.valid(valid_a1),.a(a1_in),.b(b00_to_10),.ps(c10),.valid_out(v10_to_11),.a_out(a10_to_11),.b_out());
    pe PE11(.clk(clk),.rst_n(rst_n),.valid(v11),.a(a10_to_11),.b(b01_to_11),.ps(c11),.valid_out(),.a_out(),.b_out());
endmodule
