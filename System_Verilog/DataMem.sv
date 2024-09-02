`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.09.2024 05:21:09
// Design Name: 
// Module Name: DataMem
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


module DataMem(
    input logic clk, rstn, WriteEn, ReadEn,
    input [31:0] Addr, WriteData,
    output [31:0] ReadData
);
    logic [31:0] memory [2^30-1:0];

    // initial begin
    //     integer i;
    //     for (i = 0; i < 2^30; i = i + 1) begin
    //         memory[i] = 32'd0;
    //     end
    // end

    always_ff @(posedge clk or negedge rstn) begin
        if (!rstn) begin
            // memory[Addr] <= 32'd0;
        end else begin
            if (WriteEn) begin
                memory[Addr] <= WriteData;
            end
        end
    end   

    assign ReadData = (ReadEn) ? memory[Addr] : 32'd0;

endmodule
