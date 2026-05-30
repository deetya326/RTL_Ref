module binary_counter (
input clk, rst_n, en, load,
input [7:0] load_val,
output reg [7:0] count,
output carry_out
);
always @(posedge clk or negedge rst_n) begin
if (!rst_n)
count <= 8'b00000000;
else if (load)
count <= load_val;
else if (en)
count <= count + 1;
end
assign carry_out = (count == 8'b11111111);
endmodule