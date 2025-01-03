// module InstructionMem(
//     input logic rstn,
//     input logic [31:0] Addr,
//     output logic [31:0] ReadData
// );
//     logic [31:0] memory [2^30-1:0];
    
//     assign ReadData = (~rstn) ? {32{1'b0}} : memory[Addr];


//     initial begin
// //       memory[0]  = 32'b00000000010100110000000010110011;      
// //       memory[4]  = 32'b00000000011101000000001101100011;
// //       memory[4]  = 32'b00000000010100110000000110110011;
// //       memory[8]  = 32'b01000000100000001000000100110011; 
      
// //      memory[0]  = 32'b01000000011000101000001110110011;
// //      memory[4]  = 32'b00000000011000111000001010110011;
// //      memory[8]  = 32'b01000000010100111000000110110011;
// //		  memory[12] = 32'b00000000010100011000000110010011;
// //		  memory[16] = 32'b00000000010100011000000110010011;
// //		  memory[20] = 32'b00000000000100011000000110110011;
// //		  memory[24] = 32'b00000000010100011000000110010011;

// 		  memory[0]  = 32'b00000000010100101000001000000011;
// 		  memory[4]  = 32'b00000000011000100000011100110011;
// 		  // memory[4]  = 32'b00000000101001001000011100110011;
		  
// 		  memory[8]  = 32'b00000000011100100000011110110011;

//     end

// endmodule


module InstructionMem(
    input logic rstn,
    input logic [31:0] Addr,          
    output logic [31:0] ReadData
);
    logic [31:0] memory [2^30-1:0];        
    assign ReadData = (~rstn) ? 32'b0 : memory[Addr >> 2];

    initial begin

		//R type 
		memory[0]  = 32'h003102b3;		//add x5, x2, x3 
		memory[1]  = 32'h40828233;      //sub x4, x5, x8
		memory[2]  = 32'h0084c533;      //xor x10, x9, x8
		memory[3]  = 32'h005665b3;   	//or x11, x12, x5
		memory[4]  = 32'h001676b3;		//and x13, x12, x1
		memory[5]  = 32'h00419633;    	//sll x12, x3, x4 
		memory[6]  = 32'h00915533; 		//srl x10, x2, x9
		memory[7]  = 32'h0060a2b3; 		//sra x7, x16, x3
		memory[8]  = 32'h0060a2b3; 		//slt x5, x1, x6 
		memory[9]  = 32'h0101b7b3;		//sltu x15, x3, x16

		//B type
		memory[10]  = 32'h01ff0863;		//beq x30, x31, 16
		memory[11]  = 32'h00de1663;     //bne x28 x13 12
		memory[12]  = 32'h00e44563;     //blt x8, x14, 10
		memory[13]  = 32'h00455863;   	//bge x10, x4, 16
		memory[14]  = 32'h00e6e363;		//bltu x13, x14, 6
		memory[15]  = 32'h0181f463;    	//bgeu x3, x24, 8

		//J type
		memory[16]  = 32'h0060066f;		//jal x12, 6

		//I type - JALR
		memory[17]  = 32'h00700be7;     //jalr x23, 7(x0)

		//I type 
		memory[18]  = 32'h00798e13;		//addi x28, x19, 7
		memory[19]  = 32'h02d4cd13;     //xori x26, x9, 45
		memory[20]  = 32'h004ee813;     //ori x16, x29, 4
		memory[21]  = 32'h017bf713;   	//andi x14, x23, 23
		memory[22]  = 32'h01b19593;		//slli x11, x3, 27
		memory[23]  = 32'h00cad913;    	//srli x18, x21, 12
		memory[24]  = 32'h40bad413; 	//srai x8, x21, 11
		memory[25]  = 32'h00aba693; 	//slti x13, x23, 10
		memory[26]  = 32'h00cb3613; 	//sltiu x12, x22, 12

		//I type - Load
		memory[27]  = 32'h00500c03;		//lb x24, 5(x0)
		memory[28]  = 32'h00801c83;     //lh x25, 8(x0)
		memory[29]  = 32'h00a02d03;     //lw x26, 10(x0)
		memory[30]  = 32'h00a04d83;   	//lbu x27, 10(x0)
		memory[31]  = 32'h00c05e03;		//lhu x28, 12(x0)

		//S type
		memory[32]  = 32'h01c00623;    	//sb x28, 12(x0)
		memory[33]  = 32'h01d018a3; 	//sh x29, 17(x0)
		memory[34]  = 32'h01e02923; 	//sw x30, 18(x0)

		//U type
		memory[35]  = 32'h00022f37; 	//lui x30, 34
		memory[36]  = 32'h0002da97; 	//auipc x21, 45

		


	// 	memory[0]  = 32'h003102b3;		//add x5, x2, x3 
	// 	memory[1]  = 32'h00638a63;      //beq x7 x6 4
	// 	memory[2]  = 32'h00940393;      //addi x7 x8 9
	// 	memory[3]  = 32'h40418133;   //rd: 00010= 2, rs1: 00011= 3, rs2: 00100= 4  sub
	// 	memory[4]  = 32'h003102b3;		//add x5, x2, x3
	// 	memory[5]  = 32'h00602383;    	//ld x7, 6(x0)  
	// 	memory[6]  = 32'h00518193; 
	// 	memory[7]  = 32'h403104B3; 
	// 	memory[8] = 32'h009302B3;
	// 	memory[9]  = 32'b00000000000000000000000000010011; 
	// 	memory[10]  = 32'b00000000000000000000000000010011; 
	// 	memory[11]  = 32'b00000000000000000000000000010011; 
	// 	memory[12]  = 32'b00000000000000000000000000010011;
	// 	memory[13] = 32'h00000013; // NoOp 
	// 	memory[14] = 32'h00000013;
	// 	memory[15] = 32'hFEC58EE3;
	// 	memory[16] = 32'h00000013;
	// 	memory[17] = 32'h00000013;
	// 	memory[18]  = 32'b00000000000000000000000000010011;
	// 	memory[19]  = 32'b00000000000000000000000000010011;
	// 	memory[20]  = 32'b00000000000000000000000000010011; 
    end

endmodule