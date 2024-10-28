`timescale 1ns / 1ps
/////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.09.2024 06:09:35
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
/////////////////////////////////////////////////////////////////////////////////


module RegisterFile(
    input logic clk, rstn, WriteEn,
    input logic [4:0] ReadAddr1, ReadAddr2, WriteAddr,
    input logic [31:0] WriteData,
    output logic [31:0] ReadData1, ReadData2
    );

    logic [31:0] Register [31:0];

    always_ff @(posedge clk or negedge rstn) begin
        if (!rstn) begin
        end else begin
            if (WriteEn) begin
                Register[WriteAddr] <= WriteData;
            end
        end
    end  

    assign ReadData1 = (!rstn) ? 32'd0 : Register[ReadAddr1];
    assign ReadData2 = (!rstn) ? 32'd0 : Register[ReadAddr2];

    initial begin
        Register[5] = 32'h00000005;
        Register[6] = 32'h00000004; 
    end
endmodule
