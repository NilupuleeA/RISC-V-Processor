`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.08.2024 01:35:22
// Design Name: 
// Module Name: DataMem_tb
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


module DataMem_tb();
    logic [31:0] Addr, WriteData;
    logic [31:0] ReadData;
    logic clk, WriteEn, ReadEn, rstn = 0;

    localparam CLK_PERIOD = 10;

    initial begin
        clk = 0;
        forever #(CLK_PERIOD/2) clk <= ~clk;
    end

    DataMem dut (.*);

    initial begin
        rstn <= 1;
        Addr <= 32'd5;
        WriteData <= 32'd10;
        WriteEn <= 1;

        @(posedge clk);
        Addr <= 32'd5;
        ReadEn <= 1;

        @(posedge clk);
        Addr <= 32'd20;
        WriteData <= 32'd10;
        WriteEn <= 1;

        @(posedge clk);
        Addr <= 32'd20;
        ReadEn <= 1;
        WriteEn <= 0;
    end
endmodule


