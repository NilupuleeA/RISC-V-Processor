`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.08.2024 22:46:47
// Design Name: 
// Module Name: AdderPC
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


module AdderPC(
    input logic [31:0] Addr, 
    output logic [31:0] NextAddr
);
    assign NextAddr = Addr + 32'd4;
    
endmodule
