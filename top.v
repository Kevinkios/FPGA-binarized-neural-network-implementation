module top(
    input clk,
    //input inmem_RW_ctr,
    input inmem_data_in,
    //input outmem_RW_ctr,
    output [4:0] data_out
);
wire inmem_en;
wire outmem_en;
wire inmem_RW_ctr;
wire outmem_RW_ctr;
wire [4:0] graph_raddr;
wire [4:0] graph_caddr;
wire [4:0] mem_caddr;
wire [4:0] mem_raddr;
wire [24:0] kernnel_in;
wire [24:0] weights;
assign weights = 25'b1010101010101010101010101;
wire [4:0] thresh;
assign thresh = 5'b01011;
wire [1:0] sign;
assign sign = 2'b01;
wire [4:0] org_data;
wire kernnel_out;
binConv #(
    .input_width(25),
    .popcount_width(5)
)
kernnel(
    .recField(kernnel_in),
    .weights(weights),
    .thresh(thresh),
    .sign(sign),
    .outmap(kernnel_out)
);

mem_buffer buffer(
    .en(buffer_en),
    .clk(clk),
    .data_in(org_data),
    .data_out(kernnel_in)
);

graph_mem inmem(
    .en(inmem_en),
    .clk(clk),
    .RW(inmem_RW_ctr),
    .coladdr(graph_caddr),
    .rowaddr(graph_raddr),
    .data_out(org_data),
    .data_in(inmem_data_in)    
);

graph_mem out_mem(
    .en(outmem_en),
    .clk(clk),
    .RW(outmem_RW_ctr),
    .coladdr(mem_caddr),
    .rowaddr(mem_raddr),
    .data_out(data_out),
    .data_in(kernnel_out)
);
control_unit controlu(
    .clk(clk),
    .out_mem_coladdr(mem_caddr),
    .out_mem_rowaddr(mem_raddr),
    .graph_mem_coladdr(graph_caddr),
    .graph_mem_rowaddr(graph_raddr),
    .input_mem_RW(inmem_RW_ctr),
    .output_mem_RW(outmem_RW_ctr),
    .buffer_en(buffer_en),
    .input_mem_en(inmem_en),
    .output_mem_en(outmem_en)
);

endmodule
