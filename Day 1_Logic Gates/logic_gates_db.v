module logic_gates_db(input a,
input b,
output not_out,
output and_out,
output or_out,
output nor_out,
output nand_out,
output xor_out,
output xnor_out
);
assign not_out=~a;
assign and_out=a&b;
assign or_out=a|b;
assign nor_out=~(a|b);
assign nand_out=~(a&b);
assign xor_out=a^b;
assign xnor_out=~(a^b);
endmodule