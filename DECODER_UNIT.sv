module DECODER_UNIT(input logic [5:0] Funct, input logic [1:0] Op, input logic [3:0] Rd,
						  output logic PCs, RegW, MemW, MemToReg, ALUSrc,
						  output logic [1:0] FlagW, ImmSrc, RegSrc, ALUControl);
	//Main Decoder
	logic Branch, ALUOp;
	
	
	MAIN_DECODER MainDeco(Op, Funct[0], Funct[5], Branch, RegW, MemW, MemToReg, ALUSrc, ALUOp, ImmSrc, RegSrc);
	
	//PC Logic
	
	PC_LOGIC PcLogic(Rd, Branch, RegW, PCs);
	
	//ALU Logic
	
	ALU_DECODER AluLogic(Funct, ALUOp, ALUControl, FlagW);
endmodule