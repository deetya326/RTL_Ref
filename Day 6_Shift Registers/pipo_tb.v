module tb_pipo_shift;
reg clk, rst_n;
reg [3:0] parallel_in;
wire [3:0] parallel_out;
pipo_shift uut (clk, rst_n, parallel_in, parallel_out);
always #5 clk = ~clk;
initial begin
$monitor("clk = %b, rst_n = %b, parallel_in = %b, parallel_out = %b", clk, rst_n, parallel_in, parallel_out);
clk=0; rst_n=0;
#10 rst_n=1;
parallel_in=4'b1100; #10;
parallel_in=4'b0011; #10;
$finish;
end
endmodule