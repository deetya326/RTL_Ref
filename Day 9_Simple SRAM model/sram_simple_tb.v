`timescale 1ns/1ps
module tb_sram;
reg clk, we, re;
reg [7:0] addr, data_in;
wire [7:0] data_out;
sram_model uut (clk, we, re, addr, data_in, data_out);
always #5 clk = ~clk;
initial begin
$monitor("Time: %0t | WE: %b | RE: %b | ADDR: %h | DATA_IN: %h | DATA_OUT: %h", $time, we, re, addr, data_in, data_out);
clk = 0; we = 0; re = 0;
// WRITE
addr = 8'd5;
data_in = 8'hAA;
we = 1; #10;
we = 0;
 // READ
re = 1; #10;
$display("Read data: %h", data_out);
$finish;
end
endmodule