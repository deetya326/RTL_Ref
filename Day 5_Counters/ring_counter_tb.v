`timescale 1ns/1ps
module tb_ring_counter;
reg clk, rst_n;
wire [3:0] q;
ring_counter uut (clk, rst_n, q);
always #5 clk = ~clk;
initial begin
$monitor("Time: %0t | rst_n: %b | q: %b", $time, rst_n, q);
clk = 0;
rst_n = 0;
#10 rst_n = 1;
#80;
$finish;
end
endmodule