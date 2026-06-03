`timescale 1ns/1ps
module tb_dual_port_ram;
reg clk;
reg we_a, re_a;
reg [7:0] addr_a, data_in_a;
wire [7:0] data_out_a;
reg we_b, re_b;
reg [7:0] addr_b, data_in_b;
wire [7:0] data_out_b;
dual_port_ram uut (clk, we_a, re_a, addr_a, data_in_a, data_out_a, we_b, re_b, addr_b, data_in_b, data_out_b);
always #5 clk = ~clk;
initial begin
$monitor("Time: %0t | WE_A: %b | RE_A: %b | ADDR_A: %h | DATA_IN_A: %h | DATA_OUT_A: %h | WE_B: %b | RE_B: %b | ADDR_B: %h | DATA_IN_B: %h | DATA_OUT_B: %h", $time, we_a, re_a, addr_a, data_in_a, data_out_a, we_b, re_b, addr_b, data_in_b, data_out_b);
clk = 0;
// INIT
we_a=0; re_a=0;
we_b=0; re_b=0;
// WRITE using PORT A
addr_a = 8'd10;
data_in_a = 8'hAA;
we_a = 1; #10;
we_a = 0;
// WRITE using PORT B
addr_b = 8'd20;
data_in_b = 8'h55;
we_b = 1; #10;
we_b = 0;
// READ using both ports simultaneously
addr_a = 8'd10; re_a = 1;
addr_b = 8'd20; re_b = 1;#10;
$display("Port A read: %h", data_out_a);
$display("Port B read: %h", data_out_b);
$finish;
end
endmodule