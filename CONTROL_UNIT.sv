module CONTROL_UNIT(input logic clk, input logic [5:0] Funct, input logic [1:0] Op, input logic [3:0] Rd, Cond, ALUFlags,
						  output logic PCSrc, RegWrite, MemWrite, MemToReg, ALUSrc,
						  output logic [1:0] ImmSrc, RegSrc, ALUControl);
	//Main Decoder
	logic PCs, RegW, MemW;
	logic [1:0] FlagW;
	DECODER_UNIT DecoderUnit(Funct, Op, Rd, PCs, RegW, MemW, MemToReg, ALUSrc, FlagW, ImmSrc, RegSrc, ALUControl);
	
	//Conditional Logic
	logic reset;
	CONDITIONAL_LOGIC ContitionalLogic(clk, reset, Cond, ALUFlags, FlagW, PCs, RegW, MemW, PCSrc, RegWrite, MemWrite);
endmodule