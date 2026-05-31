module piso_shift (
input clk, rst_n, load,
input [3:0] parallel_in,
output reg serial_out
);
reg [3:0] shift;
always @(posedge clk or negedge rst_n) begin
if (!rst_n)
shift <= 0;
else if (load)
shift <= parallel_in;
else begin
serial_out <= shift[3];
shift <= {shift[2:0], 1'b0};
end
end
endmodule