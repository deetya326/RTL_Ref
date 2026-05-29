`timescale 1ns/1ps
module tb_d_ff;
reg clk, rst_n, en, d;
wire q;
d_ff_with_enable uut (clk, rst_n, en, d, q);
always #5 clk = ~clk;
initial begin
$monitor("clk=%b rst_n=%b en=%b d=%b q=%b",clk,rst_n,en,d,q);
clk = 0;
rst_n = 0; en = 0; d = 0;
#10 rst_n = 1; en = 1;
d = 1; #10;
d = 0; #10;
en = 0; d = 1; #10; // should not change
en = 1; #10;
rst_n = 0; #10; // reset
rst_n = 1; #10;
$finish;
end
endmodule