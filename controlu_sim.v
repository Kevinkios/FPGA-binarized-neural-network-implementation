`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/01/20 10:43:40
// Design Name: 
// Module Name: controlu_sim
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


module controlu_sim(
    input clk,
    output [4:0] graph_mem_coladdr,
    output [4:0] graph_mem_rowaddr,
    output [4:0] out_mem_coladdr,
    output [4:0] out_mem_rowaddr,
    output WR
);
reg test_clk = 0;
assign clk = test_clk;
control_unit control1(
    .clk(clk),
    .graph_mem_coladdr(graph_mem_coladdr),
    .graph_mem_rowaddr(graph_mem_rowaddr),
    .out_mem_coladdr(out_mem_coladdr),
    .out_mem_rowaddr(out_mem_rowaddr),
    .WR(WR)
);
always test_clk = #50 ~test_clk;

endmodule
