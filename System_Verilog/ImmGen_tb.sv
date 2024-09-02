`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.08.2024 11:31:44
// Design Name: 
// Module Name: ImmGen_tb
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


module ImmGen_tb();
    logic [31:0] Instruction;
    logic [31:0] Extended_imm;
    logic clk, rstn;

    localparam CLK_PERIOD = 10;

    initial begin
        clk = 0;
        forever #(CLK_PERIOD/2) clk = ~clk;
    end

    // Instantiate the DUT (Device Under Test)
    ImmGen dut (.*);

    initial begin
        // Apply reset
        rstn = 0;
        #10;
        rstn = 1;

        // Test different instruction formats
        Instruction = {25'd10, 7'b0010011}; // I-type (e.g., addi)
        @(posedge clk);

        Instruction = {25'd5680, 7'b0100011}; // S-type (e.g., sw)
        @(posedge clk);

        Instruction = {25'd328, 7'b0110111}; // U-type (e.g., lui)
        @(posedge clk);

    end
endmodule
