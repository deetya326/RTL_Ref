module mux_2to_1 (
input i0, i1,
input s,
output out
);
assign out = (~s & i0) | (s & i1);
endmodule