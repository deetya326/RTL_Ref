`timescale 1ns/1ps
module tb_siso_shift;
reg clk, rst_n, serial_in;
wire serial_out;
siso_shift uut (clk, rst_n, serial_in, serial_out);
always #5 clk = ~clk;
initial begin
$monitor("At time %t, serial_out = %b", $time, serial_out);
clk=0; rst_n=0; serial_in=0;
#10 rst_n=1;
serial_in=1; #10;
serial_in=0; #10;
serial_in=1; #40;
$finish;
end
endmodule