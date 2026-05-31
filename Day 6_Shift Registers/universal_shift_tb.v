module tb_universal_shift;
reg clk, rst_n;
reg [1:0] mode;
reg serial_in_left, serial_in_right;
reg [7:0] parallel_in;
wire [7:0] parallel_out;
universal_shift_reg uut (
clk, rst_n, mode,
serial_in_left, serial_in_right,
parallel_in, parallel_out
);
always #5 clk = ~clk;
initial begin
$monitor("clk = %b, rst_n = %b, mode = %b, serial_in_left = %b, serial_in_right = %b, parallel_in = %b, parallel_out = %b", clk, rst_n, mode, serial_in_left, serial_in_right, parallel_in, parallel_out);
clk=0; rst_n=0;
#10 rst_n=1;
// load
mode=2'b11; parallel_in=8'b10101010; #10;
// shift right
mode=2'b01; serial_in_left=1; #20;
// shift left
mode=2'b10; serial_in_right=0; #20;
// hold
mode=2'b00; #20;
$finish;
end
endmodule