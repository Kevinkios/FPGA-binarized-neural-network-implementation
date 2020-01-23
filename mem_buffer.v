module mem_buffer
(
	input clk,
	input [4:0] data_in,
	output [24:0] data_out,
	input en
);
reg [4:0] reg_file [4:0]; 
always @(posedge clk) begin
    if(en) begin
        reg_file[4] <= data_in;
        reg_file[3] <= reg_file[4];
        reg_file[2] <= reg_file[3];
        reg_file[1] <= reg_file[2];
        reg_file[0] <= reg_file[1];
    end
end

assign data_out = {reg_file[4],reg_file[3],reg_file[2],reg_file[1],reg_file[0]};
endmodule