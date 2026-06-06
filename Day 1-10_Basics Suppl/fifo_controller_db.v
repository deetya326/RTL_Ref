module fifo_controller (
    input clk, rst_n,
    input wr_en, rd_en,

    output reg [3:0] wr_ptr,
    output reg [3:0] rd_ptr,
    output reg [4:0] count,

    output full, empty, almost_full, almost_empty
);

    // POINTER LOGIC
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            wr_ptr <= 0;
            rd_ptr <= 0;
        end else begin
            if (wr_en && !full)
                wr_ptr <= wr_ptr + 1;

            if (rd_en && !empty)
                rd_ptr <= rd_ptr + 1;
        end
    end

    // COUNT LOGIC
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            count <= 0;
        else begin
            case ({wr_en && !full, rd_en && !empty})
                2'b10: count <= count + 1; // write only
                2'b01: count <= count - 1; // read only
                default: count <= count;
            endcase
        end
    end

    // FLAGS
    assign full  = (count == 16);
    assign empty = (count == 0);

    assign almost_full  = (count >= 14);
    assign almost_empty = (count <= 2);

endmodule