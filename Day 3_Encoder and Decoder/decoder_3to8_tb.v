`timescale 1ns/1ps
module tb_decoder_3to8;
reg [2:0] din;
wire [7:0] dout;
decoder_3to8 uut (din, dout);
initial begin
$display("din | dout");
din=0; #10; $display("%b | %b", din, dout);
din=1; #10; $display("%b | %b", din, dout);
din=2; #10; $display("%b | %b", din, dout);
din=3; #10; $display("%b | %b", din, dout);
din=4; #10; $display("%b | %b", din, dout);
din=5; #10; $display("%b | %b", din, dout);
din=6; #10; $display("%b | %b", din, dout);
din=7; #10; $display("%b | %b", din, dout);
$finish;
end
endmodule