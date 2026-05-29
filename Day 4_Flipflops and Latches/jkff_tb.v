`timescale 1ns/1ps
module tb_jk_ff;
reg clk, rst_n, j, k;
wire q;
jk_ff uut (clk, rst_n, j, k, q);
always #5 clk = ~clk;
initial begin
$monitor("clk=%b rst_n=%b j=%b k=%b q=%b",clk,rst_n,j,k,q);
clk = 0;
rst_n = 0; j = 0; k = 0;
#10 rst_n = 1;
j=0; k=0; #10;
j=0; k=1; #10;
j=1; k=0; #10;
j=1; k=1; #20; // toggle
$finish;
end
endmodule