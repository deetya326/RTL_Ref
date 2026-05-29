module jk_ff (
input clk, rst_n, j, k,
output reg q
);
always @(posedge clk or negedge rst_n) begin
if (!rst_n)
q <= 0;
else begin
case ({j,k})
2'b00: q <= q;
2'b01: q <= 0;
2'b10: q <= 1;
2'b11: q <= ~q;
endcase
end
end
endmodule