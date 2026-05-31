module siso_shift (
input clk, rst_n,
input serial_in,
output reg serial_out
);
reg [3:0] shift;
always @(posedge clk or negedge rst_n) begin
if (!rst_n)
shift <= 4'b0000;
else begin
shift <= {shift[2:0], serial_in};
serial_out <= shift[3];
end
end
endmodule