`timescale 1ns/1ps
module tb_priority_encoder_8to3;
reg [7:0] data_in;
wire [2:0] data_out;
wire valid;
priority_encoder_8to3 uut (data_in, data_out, valid);
initial begin
$display("data_in | out | valid");
data_in = 8'b00000000; #10;
$display("%b | %b | %b", data_in, data_out, valid);
data_in = 8'b00000100; #10;
$display("%b | %b | %b", data_in, data_out, valid);
data_in = 8'b01010000; #10;
$display("%b | %b | %b", data_in, data_out, valid);
data_in = 8'b10000010; #10;
$display("%b | %b | %b", data_in, data_out, valid);
$finish;
end
endmodule