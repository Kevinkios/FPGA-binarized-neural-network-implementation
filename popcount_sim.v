`timescale 1ns/1ns

module test(
	input [15:0] datain,
	output [4:0] dataout
);

popcount
#(
	.input_width(16),
	.output_width(5)
)
mypopcount
(
	.data_in(datain),
	.data_out(dataout)
);
reg [15:0] inputdata;
assign datain = inputdata;
initial begin
	inputdata = 16'd0;
	#10
	inputdata = 16'd15342;
	#10
	inputdata = 16'd26753;
end
endmodule