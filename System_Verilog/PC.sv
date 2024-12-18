`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.09.2024 06:04:13
// Design Name: 
// Module Name: PC
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
/////////////////////////////////////////////////////////////////////////////////


module PC(
    input logic clk, rstn,
    input logic [31:0] NextAddr,
    output logic [31:0] Addr
);
    logic [31:0] Addr;

    always_ff @(posedge clk or negedge rstn) begin
        if(!rstn)
            Addr <= {32{1'b0}};
        else
            Addr <= NextAddr;        
    end
endmodule
