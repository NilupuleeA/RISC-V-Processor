`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.08.2024 22:43:44
// Design Name: 
// Module Name: AdderBEQ_tb
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


module AdderBEQ_tb();
    logic [31:0] Addr;
    logic [31:0] NextAddr;
    logic [31:0] Extended_imm;
    logic clk, rst;

    localparam CLK_PERIOD = 10;

    initial begin
        clk = 0;
        forever #(CLK_PERIOD/2) clk <= ~clk;
    end

    AdderBEQ dut (.*);

    initial begin
        rst <= 1;
        Addr <= 32'd5;
        Extended_imm <= 32'd10;

        @(posedge clk);
        Addr <= 32'd10;
        Extended_imm <= 32'd2;
    end
endmodule
