module INSTRUCTION_CONTROL_UNIT (CLK, RST, SYS_X, SYS_Y, INS, C_INS);

	input  logic        CLK, RST;
	input  logic [9:0]  SYS_X, SYS_Y;
	input  logic [31:0] INS;
	output logic [15:0] C_INS;
	logic WRITE;
	
	logic [5:0] NEW_INS_ADD;
	logic ALL_INS_CMLPTED, EQU;
	
	NEW_INSTRUCTION_VERIFICATOR 
		NIV (CLK, RST, INS, WRITE);      
	
	COUNTER_MODULE 
		NEW_INS_CM  (~WRITE, RST, NEW_INS_ADD);
	
	GRAPHIC_INSTRUCTION_MEMORY_MODULE
		GRAPHIC_INSTRUCTION_MEMORY (CLK, RST, SYS_X, SYS_Y, NEW_INS_ADD, WRITE, INS, C_INS);
		
endmodule 