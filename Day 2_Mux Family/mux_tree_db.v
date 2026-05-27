module mux_2to_1 (
input i0, i1,
input s,
output out
);
assign out = (~s & i0) | (s & i1);
endmodule

module mux_tree_4to1 (
input i0, i1, i2, i3,
input s0, s1,
output out
);
wire w1, w2;
mux_2to_1 m1 (i0, i1, s0, w1);
mux_2to_1 m2 (i2, i3, s0, w2);
mux_2to_1 m3 (w1, w2, s1, out);
endmodule