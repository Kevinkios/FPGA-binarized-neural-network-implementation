module binConv#(
	parameter input_width = 25,
	parameter popcount_width = 5
)(
	input [input_width-1:0] recField,
	input [input_width-1:0] weights,
	input [popcount_width-1:0] thresh,
	input [1:0] sign,
	output outmap
);
wire [input_width-1:0] xnor_out;
wire [popcount_width-1:0] popcount_out;

wire multiplexer_0;
wire multiplexer_1;
wire multiplexer_2;
wire nultiplexer_3;

wire [popcount_width-1:0] comparator1_0;
wire [popcount_width-1:0] comparator1_1;
wire [popcount_width-1:0] comparator2_0;
wire [popcount_width-1:0] comparator2_1;
wire comparator1_out;
wire comparator2_out;
assign comparator1_0 = popcount_out;
assign comparator2_0 = popcount_out;
assign comparator1_1 = thresh;
assign comparator2_1 = thresh;
assign comparator1_out = (popcount_out>thresh) ? 1'b1 : 1'b0;
assign comparator2_out = (popcount_out<thresh) ? 1'b1 : 1'b0;

// comparators
genvar i;
for(i=0;i<input_width;i=i+1) begin
	xnor(xnor_out[i],recField[i],weights[i]);
end


popcount
#(
	.input_width(input_width),
	.output_width(popcount_width)
)
binpopcount
(
	.data_in(xnor_out),
	.data_out(popcount_out)
);

multiplexer4_1 sel(
	.channel({1'b0,1'b1,comparator1_out,comparator2_out}),
	.sign(sign),
	.outMap(outmap)
);

endmodule
