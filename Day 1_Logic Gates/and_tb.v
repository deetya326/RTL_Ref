`timescale 1ns/1ps
module tb_and_gate;
reg a, b;
wire y;
and_gate dut (.a(a), .b(b), .y(y));
initial begin
$display("a=%b b=%b | y=%b",a,b,y);
#10 a=0; b=0;
#10 a=0; b=1;
#10 a=1; b=0;
#10 a=1; b=1; 
#10 $finish;
end
endmodule