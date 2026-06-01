`timescale 1ns / 1ps
module pe_tb();
    reg clk,rst_n,valid;
    reg signed [7:0] a,b;
    wire signed [7:0] a_out,b_out;
    wire signed [25:0] ps;
    wire valid_out;
    
    pe dut(.clk(clk),.rst_n(rst_n),.a(a),.b(b),.a_out(a_out),.valid(valid),
        .b_out(b_out),.ps(ps),.valid_out(valid_out));
    always #5 clk = ~clk;
    initial begin
        clk=0;
        rst_n=0;
        valid = 0;
        a = 0;
        b = 0;
        #20
        rst_n = 1;
        @(posedge clk);
        valid = 1;
        a = 1;
        b = 5;
        @(posedge clk);
        a = 2;
        b = 7;
        @(posedge clk);
        valid = 0;
        a = 0;
        b = 0;
        
        repeat(3) @(posedge clk);
        $display("PS = %d",ps);
        if (ps==19)
            $display("Test Passed");
        else    
            $display("Test Failed");
      end
        
endmodule
