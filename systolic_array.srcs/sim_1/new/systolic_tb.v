`timescale 1ns / 1ps
module systolic_tb();
    reg clk,rst_n,valid_a0,valid_a1;
    reg signed [7:0] a0_in,a1_in,b0_in,b1_in;
    wire signed [25:0] c00,c01,c10,c11;
    
    systolic_2X2 dut(
        .clk(clk),.rst_n(rst_n),.valid_a0(valid_a0),.valid_a1(valid_a1),
        .a0_in(a0_in),.b0_in(b0_in),.a1_in(a1_in),.b1_in(b1_in),
        .c00(c00),.c01(c01),.c10(c10),.c11(c11));
    always #5 clk = ~clk;
    
   initial begin 
    clk  =0;
    rst_n=0;
    valid_a0 =0;
    valid_a1 = 0;
    a0_in = 0;
    b0_in =0;
    b1_in = 0;
    a1_in = 0;
    
    #20
    rst_n =1;
    @(posedge clk);
    valid_a0 = 1;
    valid_a1 = 1;
    a0_in = 8'd1;
    b0_in = 8'd5;
    a1_in = 8'd3;
    b1_in = 8'd6;
    @(posedge clk);
    a0_in = 8'd2;
    b0_in = 8'd7;
    a1_in = 8'd4;
    b1_in = 8'd8;
    @(posedge clk);
    valid_a0 = 0;
    valid_a1 = 0;
    a0_in = 8'd0;
    b0_in = 8'd0;
    a1_in = 8'd0;
    b1_in = 8'd0;
    
    repeat(5) @(posedge clk);
    $display("c00 = %d",c00);
    $display("c01 = %d",c01);
    $display("c10 = %d",c10);
    $display("c11=%d",c11);
    $finish;
    end
    
endmodule
