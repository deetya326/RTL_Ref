`timescale 1ns/1ps
module tb_or_gate;
reg a, b;
wire y;
or_gate uut (.a(a), .b(b), .y(y));
initial begin
$display("a b | y");
#10 a=0; b=0;
#10 a=0; b=1;
#10 a=1; b=0;
#10 a=1; b=1;
#10 $finish;
end
endmodule