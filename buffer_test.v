`timescale 1ns/1ns 
module buffer_test(
	input clk,
	input [4:0] data_in,
	output [24:0] data_out 
);

reg [4:0] data;
reg clock;
assign clk = clock;
assign data_in = data;
mem_buffer #(
	.width(5),
	.length(5)
)
buffer1
(
	.clk(clk),
	.data_in(data_in),
	.data_out(data_out)
);

initial begin
	clock = 0;
	data = 4'd10;
	#50;
	clock = 1;
	#50
	clock = 0;
	data = 4'd12;
	#50
	clock = 1;
	#50
	clock = 0;
	data = 4'd3;
	#50
	clock = 1;
	
end
endmodule