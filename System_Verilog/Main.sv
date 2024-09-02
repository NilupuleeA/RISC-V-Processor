`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.09.2024 15:11:22
// Design Name: 
// Module Name: Main
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


module Main(
    input logic clk, rstn
);
    logic [31:0] PC_Adder, PC_NextAddr, AdderPC_out, AdderBEQ_out, RD_Instr, RD_Data1, RD_Data2, WR_Data, Imm_Extended, ALU_inp, ALU_out, Read_MemData;
    logic Zero, Negative;
    logic RegWrite,MemWrite,ALUSrc,ResultSrc;
    logic [1:0]ImmSrc;
    logic [2:0]ALUControl_Top;
    
    PC PC_module(
        .clk(clk),
        .rstn(rstn),
        .Addr(PC_Adder),
        .NextAddr(PC_NextAddr)
    );
        
    AdderPC PC_Adder(
        .Addr(PC_Adder),
        .NextAddr(AdderPC_out)
    );

    AdderBEQ BEQ_Adder(
        .Addr(PC_Adder),
        .Extended_imm(Imm_Extended),
        .NextAddr(AdderBEQ_out)
    );

    Mux Mux_AdderBEQ_to_PC(
        .inp1(AdderPC_out),
        .inp2(AdderBEQ_out),
        // .sel(ALUSrc),
        .out(PC_NextAddr)
    );
    
    InstructionMem Instruction_Memory(
        .rstn(rstn),
        .Addr(PC_Adder),
        .ReadData(RD_Instr)
    );

    RegisterFile Register_File(
        .clk(clk),
        .rstn(rstn),
        // .WriteEn(RegWrite),
        .WriteData(WR_Data),
        .ReadAddr1(RD_Instr[19:15]),
        .ReadAddr2(RD_Instr[24:20]),
        .WriteAddr(RD_Instr[11:7]),
        .ReadData1(RD_Data1),
        .ReadData2(RD_Data2)
    );

    ImmGen Immediate_Generator(
        .rstn(rstn),
        .Instruction(RD_Instr),
        .Extended_imm(Imm_Extended)
    );

    Mux Mux_Register_to_ALU(
        .inp1(RD_Data2),
        .inp2(Imm_Extended),
        // .sel(ALUSrc),
        .out(ALU_inp)
    );

    ALU ALU(
        .rs1(ReadData1),
        .rs2(ALU_inp),
        .ALUOut(ALU_out),
        // .ALUControl(ALUControl_Top),
        .Zero(Zero),
        .Negative(Negative)
    );

    // Control_Unit_Top Control_Unit_Top(
    //                         .Op(RD_Instr[6:0]),
    //                         .RegWrite(RegWrite),
    //                         .ImmSrc(ImmSrc),
    //                         .ALUSrc(ALUSrc),
    //                         .MemWrite(MemWrite),
    //                         .ResultSrc(ResultSrc),
    //                         .Branch(),
    //                         .funct3(RD_Instr[14:12]),
    //                         .funct7(RD_Instr[6:0]),
    //                         .ALUControl(ALUControl_Top)
    // );

    DataMem Data_Memory(
        .clk(clk),
        .rstn(rstn),
        // .WriteEn(MemWrite),
        // .ReadEn(MemRead),
        .WriteData(RD_Data2),
        .Addr(ALU_out),
        .ReadData(Read_MemData)
    );

    Mux Mux_DataMemory_to_Register(
        .inp1(Read_MemData),
        .inp2(ALU_out),
        // .sel(ResultSrc),
        .out(WR_Data)
    );
endmodule