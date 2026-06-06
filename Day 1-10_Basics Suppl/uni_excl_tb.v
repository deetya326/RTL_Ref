`timescale 1ns/1ps
module tb_compound_gates;
reg a,b;
wire nand_y,nor_y,xor_y, xnor_y;
compound_gates uut(.a(a),.b(b),.nand_y(nand_y),.nor_y(nor_y),.xor_y(xor_y),.xnor_y(xnor_y));
initial begin
$display("a b|NAND NOR XOR XNOR");
#10 a=0; b=0; 
$display("%b %b | %b    %b   %b    %b", a,b,nand_y,nor_y,xor_y,xnor_y);
#10 a=0; b=1;
$display("%b %b |  %b    %b   %b    %b", a,b,nand_y,nor_y,xor_y,xnor_y);
#10 a=1; b=0;
$display("%b %b |  %b    %b   %b    %b", a,b,nand_y,nor_y,xor_y,xnor_y);
#10 a=1; b=1;
$display("%b %b |  %b    %b   %b    %b", a,b,nand_y,nor_y,xor_y,xnor_y);
#10 $finish;
end
endmodule