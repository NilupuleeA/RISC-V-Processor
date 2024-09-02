`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.08.2024 23:46:37
// Design Name: 
// Module Name: DataMem
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


module DataMem(
    input clk, WriteEn, ReadEn,
    input [31:0] Addr, WriteData,
    output [31:0] ReadData
);
    reg [31:0] memory [2^30-1:0];

    always @ (posedge clk)
    begin
        if(WriteEn)
            memory[Addr] <= WriteData;
    end

    assign ReadData = (~ReadEn) ? 32'd0 : memory[Addr];
endmodule