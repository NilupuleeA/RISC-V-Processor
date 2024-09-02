`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.08.2024 09:10:13
// Design Name: 
// Module Name: PC
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


module PC(
    input clk, rst,
    input [31:0] NextAddr,
    output [31:0] Addr
);
    reg [31:0] Addr;

    always @(posedge clk)
    begin
        if(~rst)
            Addr <= {32{1'b0}};
        else
            Addr <= NextAddr;
    end
endmodule