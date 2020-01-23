module control_unit(
    input clk,
    output [4:0] out_mem_coladdr,
    output [4:0] out_mem_rowaddr,
    output [4:0] graph_mem_coladdr,
    output [4:0] graph_mem_rowaddr,
    output input_mem_RW,
    output input_mem_en,
    output output_mem_en,
    output output_mem_RW,
    output buffer_en
);

reg [4:0] rowaddr = 0;
reg [4:0] coladdr = 0;
reg [5:0] cnt = 0;
always @ (posedge clk) begin
    if(cnt == 6'd33) begin
        if(rowaddr ==5'd27) begin
            rowaddr <= 5'b0;
        end
        else begin
            rowaddr <= rowaddr + 5'b1;
        end
        cnt <= 6'b0;
    end
    else begin
        cnt <= cnt + 6'b1;
    end
    /*
    if(coladdr >= 4'd4) begin
        WR_reg <= 1'b1;
    end
    else begin
        WR_reg <= 1'b0;
    end
    */
end 
assign output_mem_en = (cnt >= 6'd6) ? 1'b1 : 1'b0;
assign input_mem_en = (cnt <= 6'd31) ? 1'b1 : 1'b0;
assign graph_mem_coladdr = (cnt >= 6'd31) ? 5'd31 : cnt;
assign graph_mem_rowaddr = rowaddr;
assign out_mem_rowaddr = rowaddr;
assign out_mem_coladdr = (cnt >= 6'd6) ? cnt - 6'd6 : 5'b0;
assign input_mem_RW = 1'b1;
assign output_mem_RW = 1'b0;
assign buffer_en = 1'b1;

endmodule
