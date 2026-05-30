`timescale 1ns/1ps
module tb_gray_counter;
reg clk, rst_n, en;
wire [2:0] gray;
gray_counter uut (clk, rst_n, en, gray);
always #5 clk = ~clk;
initial begin
$monitor("Time: %0t | rst_n: %b | en: %b | gray: %b", $time, rst_n, en, gray);
clk = 0;
rst_n = 0; en = 0;
#10 rst_n = 1; en = 1;
#80;
$finish;
end
endmodule