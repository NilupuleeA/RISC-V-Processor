`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.08.2024 13:53:01
// Design Name: 
// Module Name: ALU_tb
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


module ALU_tb();
    logic [31:0] rs1, rs2;
    logic [3:0] ALUControl;
    logic [31:0] ALUOut;
    logic clk;
    logic Zero, Negative;

    localparam CLK_PERIOD = 10;

    initial begin
        clk = 0;
        forever #(CLK_PERIOD/2) clk <= ~clk;
    end

    ALU dut (.*);

    initial begin
        rs1 <= 32'd5;
        rs2 <= 32'd10;
        ALUControl <= 4'd0;

        @(posedge clk);
        rs1 <= 32'd5;
        rs2 <= 32'd10;
        ALUControl <= 4'd1;

        @(posedge clk);
        rs1 <= 32'd30;
        rs2 <= -32'd10;
        ALUControl <= 4'b0010;

        @(posedge clk);
        rs1 <= 32'd5;
        rs2 <= 32'd10;
        ALUControl <= 4'b0011;

        @(posedge clk);
        rs1 <= 32'd127;
        rs2 <= 32'd1;
        ALUControl <= 4'b0100;   

        @(posedge clk);
        rs1 <= 32'd5;
        rs2 <= 32'd10;
        ALUControl <= 4'b0101;

        @(posedge clk);
        rs1 <= 32'd10;
        rs2 <= 32'd3;
        ALUControl <= 4'b0110;

        @(posedge clk);
        rs1 <= 32'b10000000000000000000000011110101;
        rs2 <= 32'd3;
        ALUControl <= 4'b0111;

        @(posedge clk);
        rs1 <= 32'd30;
        rs2 <= -32'd10;
        ALUControl <= 4'b1000;

        @(posedge clk);
        rs1 <= 32'd30;
        rs2 <= 32'd10;
        ALUControl <= 4'b1001;
    end
endmodule

