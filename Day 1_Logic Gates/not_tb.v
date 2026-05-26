`timescale 1ns/1ps
module tb_not_gate;
reg a;
wire y;
not_gate uut (.a(a), .y(y));
initial begin
$display("a | y");
#10 a=0;
#10 a=1;
#10 $finish;
end
endmodule