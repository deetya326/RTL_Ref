`timescale 1ns/1ps
module tb_binary_counter;
reg clk, rst_n, en, load;
reg [7:0] load_val;
wire [7:0] count;
wire carry_out;
binary_counter uut (clk, rst_n, en, load, load_val, count, carry_out);
always #5 clk = ~clk;
initial begin
$monitor("Time: %0t | rst_n: %b | en: %b | load: %b | load_val: %d | count: %d | carry_out: %b", $time, rst_n, en, load, load_val, count, carry_out);
clk = 0;
rst_n = 0; en = 0; load = 0;
#10 rst_n = 1;
load = 1; load_val = 8'd5; #10;
load = 0;
en = 1; #50;
en = 0; #20;
rst_n = 0; #10;
rst_n = 1;
$finish;
end
endmodule