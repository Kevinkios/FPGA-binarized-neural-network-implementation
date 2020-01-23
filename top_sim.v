`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/01/20 16:08:16
// Design Name: 
// Module Name: top_sim
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module top_sim(
    input clk,
    output [4:0] data_out
);

reg clkgen = 0;
always clkgen = #50 ~clkgen;
assign clk = clkgen;

top test(
    .clk(clk),
    .data_out(data_out)
);
endmodule
