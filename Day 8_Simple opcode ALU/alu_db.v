module simple_alu (
input [7:0] a, b,
input [2:0] opcode,
output reg [7:0] result,
output reg carry, overflow,
output zero
);
always @(*) begin
carry = 0;
overflow = 0;
case (opcode)
3'b000: begin // ADD
{carry, result} = a + b;
overflow = (a[7] == b[7]) && (result[7] != a[7]);
end
3'b001: begin // SUB
{carry, result} = a - b;
overflow = (a[7] != b[7]) && (result[7] != a[7]);
end
3'b010: result = a & b;   // AND
3'b011: result = a | b;   // OR
3'b100: result = a ^ b;   // XOR
3'b101: result = a << 1;  // SHIFT LEFT
3'b110: result = a >> 1;  // SHIFT RIGHT
default: result = 8'b00000000;
endcase
end
assign zero = (result == 0);
endmodule