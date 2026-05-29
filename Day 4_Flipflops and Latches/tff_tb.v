`timescale 1ns/1ps
module tb_t_ff;
reg clk, rst_n, t;
wire q;
t_ff uut (clk, rst_n, t, q);
always #5 clk = ~clk;
initial begin
$monitor("clk=%b rst_n=%b t=%b q=%b",clk,rst_n,t,q);
clk = 0;
rst_n = 0; t = 0;
#10 rst_n = 1;
t = 1; #40; // should toggle
t = 0; #20; // hold
$finish;
end
endmodule