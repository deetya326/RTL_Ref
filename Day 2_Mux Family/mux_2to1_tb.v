`timescale 1ns/1ps
module tb_mux_2to_1;
reg i0, i1, s;
wire out;
mux_2to_1 uut (i0, i1, s, out);
initial begin
$display("i0 i1 s | out");
i0=0; i1=1; s=0; #10;
$display("%b  %b  %b |  %b", i0,i1,s,out);
s=1; #10;
$display("%b  %b  %b |  %b", i0,i1,s,out);
i0=1; i1=0; s=0; #10;
$display("%b  %b  %b |  %b", i0,i1,s,out);
s=1; #10;
$display("%b  %b  %b |  %b", i0,i1,s,out);
$finish;
end
endmodule