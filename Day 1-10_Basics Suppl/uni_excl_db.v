module compound_gates(
input a,b,
output nand_y,nor_y,xor_y,xnor_y
);
assign nand_y=~(a&b);
assign nor_y=~(a|b);
assign xor_y=a^b;
assign xnor_y=~(a^b);
endmodule