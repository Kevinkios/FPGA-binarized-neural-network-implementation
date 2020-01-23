module popcount
#(
	parameter input_width = 16,
	parameter output_width = 4
)(
	input [input_width-1:0] data_in,
	output reg [output_width-1:0] data_out
);

integer i;
always @ (data_in) begin
	//data_out = 0;
	data_out = data_in[0];
	for (i=1;i<input_width;i=i+1) begin
		data_out = data_out + data_in[i];
	end
end
endmodule
