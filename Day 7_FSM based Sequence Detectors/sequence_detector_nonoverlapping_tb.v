`timescale 1ns/1ps
module tb_seq_detector_1011;
reg clk, rst_n, data_in;
wire detected;
seq_detector_1011 uut (clk, rst_n, data_in, detected);
always #5 clk = ~clk;
initial begin
$monitor("clk=%b rst_n=%b data_in=%b detected=%b", clk, rst_n, data_in, detected);
clk = 0;
rst_n = 0;
data_in = 0;
#10 rst_n = 1;
// input stream: 1 0 1 1 → detect
data_in=1; #10;
data_in=0; #10;
data_in=1; #10;
data_in=1; #10;
// next sequence (no overlap reuse)
data_in=1; #10;
data_in=0; #10;
data_in=1; #10;
data_in=1; #10;
$finish;
end
endmodule