`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.08.2024 09:40:47
// Design Name: 
// Module Name: RegisterFile_tb
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


module RegisterFile_tb();
    logic [4:0] ReadAddr1, ReadAddr2, WriteAddr;
    logic [31:0] ReadData1, ReadData2, WriteData;
    logic clk, rstn, WriteEn;

    localparam CLK_PERIOD = 10;

    initial begin
        clk = 0;
        forever #(CLK_PERIOD/2) clk <= ~clk;
    end

    RegisterFile dut (.*);

    initial begin
        rstn <= 1;
        WriteAddr <= 32'd5;
        WriteData <= 32'd50;
        WriteEn <= 1;

        @(posedge clk);
        WriteAddr <= 32'd10;
        WriteData <= 32'd30;
        WriteEn <= 1;

        @(posedge clk);
        WriteEn <= 0;
        ReadAddr1 <= 32'd5;
        ReadAddr2 <= 32'd10;
    end
endmodule
