module gray_counter (
input clk, rst_n, en,
output reg [2:0] gray
);
always @(posedge clk or negedge rst_n) begin
if (!rst_n)
gray <= 3'b000;
else if (en) begin
case (gray)
3'b000: gray <= 3'b001;
3'b001: gray <= 3'b011;
3'b011: gray <= 3'b010;
3'b010: gray <= 3'b110;
3'b110: gray <= 3'b111;
3'b111: gray <= 3'b101;
3'b101: gray <= 3'b100;
3'b100: gray <= 3'b000;
endcase
end
end
endmodule