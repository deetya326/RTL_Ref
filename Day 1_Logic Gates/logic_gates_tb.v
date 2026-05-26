`timescale 1ns/1ps
module logic_gates_tb;
reg a, b;
wire and_out, or_out, not_out, nand_out, nor_out, xor_out, xnor_out;
logic_gates_db dut (a, b, and_out, or_out, not_out, nand_out, nor_out, xor_out, xnor_out);
initial begin
$display("A B|AND OR NOT_A NAND NOR XOR XNOR");
#10 a = 0; b = 0; 
$display("%b %b | %b %b %b %b %b %b %b", a, b, and_out, or_out, not_out, nand_out, nor_out, xor_out, xnor_out);
#10 a = 0; b = 1; 
$display("%b %b | %b %b %b %b %b %b %b", a, b, and_out, or_out, not_out, nand_out, nor_out, xor_out, xnor_out);
#10 a = 1; b = 0; 
$display("%b %b | %b %b %b %b %b %b %b", a, b, and_out, or_out, not_out, nand_out, nor_out, xor_out, xnor_out);
#10 a = 1; b = 1; 
$display("%b %b | %b %b %b %b %b %b %b", a, b, and_out, or_out, not_out, nand_out, nor_out, xor_out, xnor_out);
#10 $finish;
end
endmodule