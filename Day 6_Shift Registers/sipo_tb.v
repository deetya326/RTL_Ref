module tb_sipo_shift;
reg clk, rst_n, serial_in;
wire [3:0] parallel_out;
sipo_shift uut (clk, rst_n, serial_in, parallel_out);
always #5 clk = ~clk;
initial begin
$monitor(" clk = %b, rst_n = %b, serial_in = %b, parallel_out = %b", clk, rst_n, serial_in, parallel_out);
clk=0; rst_n=0; serial_in=1;
#10 rst_n=1;
serial_in=1; #10;
serial_in=0; #10;
serial_in=1; #10;
serial_in=0; #20;
$finish;
end
endmodule