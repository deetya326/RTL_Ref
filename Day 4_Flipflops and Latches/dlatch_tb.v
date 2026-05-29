`timescale 1ns/1ps
module tb_d_latch;
reg en, d;
wire q;
d_latch uut (en, d, q);
initial begin
$monitor("en=%b d=%b q=%b",en,d,q);
en = 0; d = 0;
#10 d = 1; // no change
en = 1; #10; 
d = 0; #10;
en = 0; d = 1; #10; // hold
$finish;
end
endmodule