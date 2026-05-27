module mux_8to_1 (
input i0,i1,i2,i3,i4,i5,i6,i7,
input s0,s1,s2,
output out
);
assign out = (~s2 & ~s1 & ~s0 & i0) |
(~s2 & ~s1 &  s0 & i1) |
(~s2 &  s1 & ~s0 & i2) |
(~s2 &  s1 &  s0 & i3) |
( s2 & ~s1 & ~s0 & i4) |
( s2 & ~s1 &  s0 & i5) |
( s2 &  s1 & ~s0 & i6) |
( s2 &  s1 &  s0 & i7);
endmodule