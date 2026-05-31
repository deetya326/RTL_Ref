module pipo_shift (
input clk, rst_n,
input [3:0] parallel_in,
output reg [3:0] parallel_out
);
always @(posedge clk or negedge rst_n) begin
if (!rst_n)
parallel_out <= 0;
else
parallel_out <= parallel_in;
end
endmodule