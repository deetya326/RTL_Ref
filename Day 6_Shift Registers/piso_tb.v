module tb_piso_shift;
reg clk, rst_n, load;
reg [3:0] parallel_in;
wire serial_out;
piso_shift uut (clk, rst_n, load, parallel_in, serial_out);
always #5 clk = ~clk;
initial begin
$monitor("clk = %b, rst_n = %b, load = %b, parallel_in = %b, serial_out = %b", clk, rst_n, load, parallel_in, serial_out);
clk=0; rst_n=0; load=0;
#10 rst_n=1;
load=1; parallel_in=4'b1011; #10;
load=0; #50;
$finish;
end
endmodule