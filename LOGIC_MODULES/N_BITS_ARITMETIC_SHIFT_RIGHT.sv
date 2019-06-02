module N_BITS_ARITMETIC_SHIFT_RIGHT #(parameter BITS = 1)(A, N, A_SR);
	
	input logic [BITS-1:0] A, N;
	output logic [BITS-1:0] A_SR;
	assign A_SR = A >>> N;
	
endmodule 