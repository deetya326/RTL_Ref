`timescale 1ns/1ps
module tb_seq_detector_overlapping;
reg clk, rst_n, data_in;
wire detected;
seq_detector_overlapping uut (clk, rst_n, data_in, detected);
always #5 clk = ~clk;
initial begin
$monitor("clk=%b rst_n=%b data_in=%b detected=%b", clk, rst_n, data_in, detected);
clk=0; rst_n=0;
#10 rst_n=1;
data_in=1; #10;// overlapping example: 1011011 → should detect twice
data_in=0; #10;
data_in=1; #10;
data_in=1; #10; // detect first time
data_in=0; #10;
data_in=1; #10;
data_in=1; #10; // detect again
$finish;
end
endmodule