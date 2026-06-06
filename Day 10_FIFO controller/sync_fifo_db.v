module sync_fifo (
input clk,rst_n,
input wr_en,rd_en,
input [7:0]data_in,
output reg [7:0]data_out,
output full,empty
);
reg [7:0]mem[15:0];//Depth=16
reg [3:0]wr_ptr,rd_ptr;
reg [4:0]count;// tracking the number of elements
always @(posedge clk or negedge rst_n) begin//Write
if (!rst_n)
wr_ptr<=0;
else if (wr_en && !full) begin
mem[wr_ptr]<=data_in;
wr_ptr<=wr_ptr+1;
end
end
always @(posedge clk or negedge rst_n) begin//Read
if (!rst_n) begin
rd_ptr<=0;
data_out<=0;
end else if (rd_en && !empty) begin
data_out<=mem[rd_ptr];
rd_ptr<=rd_ptr+1;
end
end
always @(posedge clk or negedge rst_n) begin    // Count Logic
if (!rst_n)
count<=0;
else begin
case ({wr_en && !full,rd_en && !empty})
2'b10:count<=count+1;//write only
2'b01:count<=count-1;//read only
default:count<=count;
endcase
end
end
assign full=(count==16);
assign empty=(count==0);
endmodule