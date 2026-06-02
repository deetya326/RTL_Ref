`timescale 1ns/1ps
module tb_simple_alu;
reg [7:0] a, b;
reg [2:0] opcode;
wire [7:0] result;
wire zero, carry, overflow;
simple_alu uut (a, b, opcode, result, carry, overflow, zero);
initial begin
$monitor("a=%d  b=%d  opcode=%b | result=%d  carry=%b  overflow=%b  zero=%b", a, b, opcode, result, carry, overflow, zero);
a = 8'd10; b = 8'd5;
opcode = 3'b000; #10; // ADD
opcode = 3'b001; #10; // SUB
opcode = 3'b010; #10; // AND
opcode = 3'b011; #10; // OR
opcode = 3'b100; #10; // XOR
opcode = 3'b101; #10; // SHIFT LEFT
opcode = 3'b110; #10; // SHIFT RIGHT
a = 0; b = 0; opcode = 3'b000; #10;// zero test
$finish;
end
endmodule