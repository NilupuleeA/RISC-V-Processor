`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.08.2024 10:53:08
// Design Name: 
// Module Name: Mux_tb
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


module Mux_tb();
    logic [31:0] inp1, inp2;
    logic [31:0] out;
    logic clk, sel;

    localparam CLK_PERIOD = 10;

    initial begin
        clk = 0;
        forever #(CLK_PERIOD/2) clk <= ~clk;
    end

    Mux dut (.*);

    initial begin
        inp1 <= 32'd5;
        inp2 <= 32'd10;
        sel <= 0;

        @(posedge clk);
        sel <= 1;
    end
endmodule
