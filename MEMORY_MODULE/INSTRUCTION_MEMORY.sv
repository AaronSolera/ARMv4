module INSTRUCTION_MEMORY #(parameter N_ENTRIES = 1)(CLK, ADDRESS, INSTRUCTION);
	
	input  logic CLK;
	input  logic [31:0] ADDRESS;
	output logic [31:0] INSTRUCTION;
	
	logic [31:0] INSTRUCTIONS [0:N_ENTRIES-1];
	
	initial begin
		$readmemh("C:/Users/aaron/Desktop/ARMv4/INSTRUCTIONS.txt", INSTRUCTIONS);
	end
	
	always @(posedge CLK) begin
		INSTRUCTION = INSTRUCTIONS[ADDRESS[31:2]];
	end
 
endmodule 