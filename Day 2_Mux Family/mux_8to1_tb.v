`timescale 1ns/1ps

module tb_mux_8to_1;

    reg i0,i1,i2,i3,i4,i5,i6,i7;
    reg s0,s1,s2;
    wire out;

    mux_8to_1 uut (i0,i1,i2,i3,i4,i5,i6,i7,s0,s1,s2,out);

    initial begin
        $display("s2 s1 s0 | out");

        // set inputs (pattern so you can verify easily)
        i0=0; i1=1; i2=0; i3=1;
        i4=0; i5=1; i6=0; i7=1;

        s2=0; s1=0; s0=0; #10;
        $display("%b  %b  %b |  %b", s2,s1,s0,out);

        s2=0; s1=0; s0=1; #10;
        $display("%b  %b  %b |  %b", s2,s1,s0,out);

        s2=0; s1=1; s0=0; #10;
        $display("%b  %b  %b |  %b", s2,s1,s0,out);

        s2=0; s1=1; s0=1; #10;
        $display("%b  %b  %b |  %b", s2,s1,s0,out);

        s2=1; s1=0; s0=0; #10;
        $display("%b  %b  %b |  %b", s2,s1,s0,out);

        s2=1; s1=0; s0=1; #10;
        $display("%b  %b  %b |  %b", s2,s1,s0,out);

        s2=1; s1=1; s0=0; #10;
        $display("%b  %b  %b |  %b", s2,s1,s0,out);

        s2=1; s1=1; s0=1; #10;
        $display("%b  %b  %b |  %b", s2,s1,s0,out);

        $finish;
    end

endmodule