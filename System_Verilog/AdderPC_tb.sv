`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.08.2024 09:25:02
// Design Name: 
// Module Name: AdderPC_tb
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


module AdderPC_tb();
    logic [31:0] Addr;
    logic [31:0] NextAddr;
    logic clk, rst;

    localparam CLK_PERIOD = 10;

    initial begin
        clk = 0;
        forever #(CLK_PERIOD/2) clk <= ~clk;
    end

    AdderPC dut (.*);

    initial begin
        rst <= 1;
        Addr <= 32'd5;

        @(posedge clk);
        Addr <= 32'd10;
    end
endmodule