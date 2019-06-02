module N_BITS_ADD_SUB_MODULE #(parameter BITS = 32) (A, B, CIN, SUB, RST, COUT);

	input logic [BITS-1:0] A, B;
	input logic CIN;
	input logic SUB;
	output logic [BITS-1:0] RST;
	output logic COUT;
	logic [BITS-1:0] TWO_CMPL_B;
	
	TWO_COMPLEMENTER_MODULE #(BITS)
		FIRST_TCM (B, SUB, TWO_CMPL_B);
		
	ADDER_MODULE #(BITS)
		AM (A, TWO_CMPL_B, CIN, RST, COUT);
		
endmodule 