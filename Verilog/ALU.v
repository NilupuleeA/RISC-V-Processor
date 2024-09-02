`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.08.2024 13:27:57
// Design Name: 
// Module Name: ALU
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


module ALU(
    input [31:0] rs1, rs2,
    input [3:0] ALUControl,
    output Zero, Negative,
    output reg [31:0] ALUOut
    );

    always @(ALUControl, rs1, rs2) begin
        case (ALUControl)
            4'b0000: ALUOut <= rs1 + rs2;
            4'b0001: ALUOut <= rs1 - rs2;
            4'b0010: ALUOut <= rs1 ^ rs2; 
            4'b0011: ALUOut <= rs1 | rs2;
            4'b0100: ALUOut <= rs1 & rs2; 
            4'b0101: ALUOut <= rs1 << rs2;  
            4'b0110: ALUOut <= rs1 >> rs2;    
            4'b0111: ALUOut <= rs1 >>> rs2;   
            4'b1000: ALUOut <= (rs1 < rs2)? 1:0;  
            4'b1001: ALUOut <= (rs1 < rs2)? 1:0;         
            default: begin
                ALUOut <= 0;  
            end
        endcase
    end
    
    assign Zero = (ALUOut == 0);
    assign Negative = ALUOut[31];

endmodule
