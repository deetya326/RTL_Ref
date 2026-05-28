`timescale 1ns/1ps
module tb_encoder_8to3;
reg [7:0] din;
wire [2:0] dout;
encoder_8to3 uut (din, dout );
initial begin
$monitor("din = %b | dout = %b", din, dout);
din = 8'b00000001; #10;
din = 8'b00000010; #10;
din = 8'b00000100; #10;
din = 8'b00001000; #10;
din = 8'b00010000; #10;
din = 8'b00100000; #10;
din = 8'b01000000; #10;
din = 8'b10000000; #10;
$finish;
end
endmodule