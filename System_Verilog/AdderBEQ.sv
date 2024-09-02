`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.08.2024 22:42:31
// Design Name: 
// Module Name: AdderBEQ
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


module AdderBEQ(
    input logic [31:0] Addr,
    input logic [31:0] Extended_imm,
    output logic [31:0] NextAddr
    );

    assign NextAddr = Addr + (Extended_imm<<1);
endmodule