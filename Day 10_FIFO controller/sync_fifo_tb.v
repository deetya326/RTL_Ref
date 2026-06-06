`timescale 1ns/1ps
module tb_fifo;
reg clk,rst_n,wr_en,rd_en;
reg [7:0]data_in;
wire [7:0]data_out;
wire full,empty;
sync_fifo dut(clk,rst_n,wr_en,rd_en,data_in,data_out,full,empty);
always #5 clk=~clk;
initial begin
$monitor("Clk=%b rst_n=%b wr_en=%b rd_en=%b data_in=%h data_out=%h full=%b empty=%b",clk,rst_n,wr_en,rd_en,data_in,data_out,full,empty);
clk=0;
rst_n=0;
wr_en=0;
rd_en=0;
#10 rst_n = 1;
wr_en=1;//Write 3 Values
data_in=8'hA1;#10;
data_in=8'hB2;#10;
data_in=8'hC3;#10;
wr_en=0;
rd_en=1;#30;// Read 3 val
rd_en=0;
$finish;
end
endmodule