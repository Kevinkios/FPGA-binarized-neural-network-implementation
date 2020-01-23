module multiplexer4_1(
	input [1:0] sign,
	input [3:0] channel,
	output outMap
);
reg out_reg;
assign outMap = out_reg;
always @ (channel or sign) begin
    case(sign)
        2'b00 : out_reg <= channel[0];
        2'b01 : out_reg <= channel[1];
        2'b10 : out_reg <= channel[2];
        2'b11 : out_reg <= channel[3];
    endcase
end
//assign outMap = sign[1] ? (sign[0] ? channel[3] : channel[2]) :(sign[0] ? channel[1] : channel[0]);

endmodule