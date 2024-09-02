`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.09.2024 05:59:15
// Design Name: 
// Module Name: InstructionMem
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


module InstructionMem(
    input logic rstn,
    input logic [31:0] Addr,
    output logic [31:0] ReadData
);
    logic [31:0] memory [2^30-1:0];
    
    assign ReadData = (~rstn) ? {32{1'b0}} : memory[Addr];


//   initial begin
//     memory[0] = 32'hFFC4A303;
//     memory[5] = 32'h00832383;
//   end

endmodule
