`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.08.2024 02:09:31
// Design Name: 
// Module Name: InstructionMem_tb
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


module InstructionMem_tb();
    logic [31:0] Addr;
    logic [31:0] ReadData;
    logic clk, rstn;

    localparam CLK_PERIOD = 10;

    initial begin
        clk = 0;
        forever #(CLK_PERIOD/2) clk <= ~clk;
    end

    InstructionMem dut (.*);

    initial begin
        rstn <= 1;
        Addr <= 32'd5;
    end
endmodule