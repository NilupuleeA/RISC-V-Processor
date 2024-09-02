`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.08.2024 09:23:49
// Design Name: 
// Module Name: RegisterFile
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


module RegisterFile(
    input clk, rst, WriteEn,
    input [4:0] ReadAddr1, ReadAddr2, WriteAddr,
    input [31:0] WriteData,
    output [31:0] ReadData1, ReadData2
    );

    reg [31:0] Register [31:0];

    always @ (posedge clk)
    begin
        if(WriteEn)
            Register[WriteAddr] <= WriteData;
    end

    assign ReadData1 = (~rst) ? 32'd0 : Register[ReadAddr1];
    assign ReadData2 = (~rst) ? 32'd0 : Register[ReadAddr2];

    // initial begin
    //     Register[5] = 32'h00000005;
    //     Register[6] = 32'h00000004; 
    // end
endmodule

