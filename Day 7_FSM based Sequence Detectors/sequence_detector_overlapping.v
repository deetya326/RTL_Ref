module seq_detector_overlapping (
input clk, rst_n, data_in,
output reg detected
);
reg [2:0] state;
parameter IDLE = 3'd0,
S1 = 3'd1,
S10= 3'd2,
S101 = 3'd3;
always @(posedge clk or negedge rst_n) begin
if (!rst_n) begin
state <= IDLE;
detected <= 0;
end else begin
detected <= 0;
case (state)
IDLE: begin
if (data_in) state <= S1;
end
S1: begin
if (!data_in) state <= S10;
else state <= S1;
end
S10: begin
if (data_in) state <= S101;
else state <= IDLE;
end
S101: begin
if (data_in) begin
detected <= 1;
state <= S1; 
end else
state <= S10;
end
endcase
end
end
endmodule