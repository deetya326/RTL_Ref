module universal_shift_reg (
input clk, rst_n,
input [1:0] mode,   // 00: hold, 01: right, 10: left, 11: load
input serial_in_left, serial_in_right,
input [7:0] parallel_in,
output reg [7:0] parallel_out
);
always @(posedge clk or negedge rst_n) begin
if (!rst_n)
parallel_out <= 0;
else begin
case (mode)
2'b00: parallel_out <= parallel_out; // hold
2'b01: // shift right
parallel_out <= {serial_in_left, parallel_out[7:1]};
2'b10: // shift left
parallel_out <= {parallel_out[6:0], serial_in_right};
2'b11: // load
parallel_out <= parallel_in;
endcase
end
end
endmodule