module d_ff_with_enable (
input clk, rst_n, en, d,
output reg q
);
always @(posedge clk or negedge rst_n) begin
if (!rst_n)
q <= 0;
else if (en)
q <= d;
end
endmodule