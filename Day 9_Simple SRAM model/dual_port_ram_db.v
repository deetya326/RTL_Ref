module dual_port_ram (
input clk,
// PORT A
input we_a, re_a,
input [7:0] addr_a,
input [7:0] data_in_a,
output reg [7:0] data_out_a,
// PORT B
input we_b, re_b,
input [7:0] addr_b,
input [7:0] data_in_b,
output reg [7:0] data_out_b
);
reg [7:0] memory [255:0];
always @(posedge clk) begin
// PORT A
if (we_a)
memory[addr_a] <= data_in_a;
if (re_a)
data_out_a <= memory[addr_a];
// PORT B
if (we_b)
memory[addr_b] <= data_in_b;
if (re_b)
data_out_b <= memory[addr_b];
end
endmodule