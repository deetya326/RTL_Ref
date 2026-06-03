module sram_model (
input clk, we, re,
input [7:0] addr,
input [7:0] data_in,
output reg [7:0] data_out
);
reg [7:0] memory [255:0]; // 256 locations of 8 bits each
always @(posedge clk) begin
if (we)
memory[addr] <= data_in;
if (re)
data_out <= memory[addr];
end
endmodule