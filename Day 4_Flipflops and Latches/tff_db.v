module t_ff (
input clk, rst_n, t,
output reg q
);
always @(posedge clk or negedge rst_n) begin
if (!rst_n)
q <= 0;
else if (t)
q <= ~q;
end
endmodule