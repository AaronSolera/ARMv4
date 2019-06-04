module CONDITIONAL_LOGIC(input logic clk, reset, input logic [3:0] Cond, ALUFlags, input logic [1:0] FlagW, input logic PCS, RegW, MemW,
								 output logic PCSrc, RegWrite, MemWrite);
	
	logic [1:0] FlagWrite;
	logic [3:0] Flags;
	logic CondEx;

	
	ENABLED_RESETTABLE_FF #(2)flagreg1(clk, reset, FlagWrite[1],
							ALUFlags[3:2], Flags[3:2]);
	
	
							
	ENABLED_RESETTABLE_FF #(2)flagreg0(clk, reset, FlagWrite[0],
								ALUFlags[1:0], Flags[1:0]);

	// write controls are conditional
	CONDITION_CHECK cc(Cond,  Flags,  CondEx);
	
	assign FlagWrite = FlagW & {2{CondEx}};
	assign RegWrite = RegW & CondEx;
	assign MemWrite = MemW & CondEx;
	assign PCSrc = PCS & CondEx;
	
endmodule