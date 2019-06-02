module EQUAL_COMPARATOR_MODULE #(parameter BITS=10) (A, B, Y);
	
	input logic [BITS-1:0] A, B;
	output logic Y;
	
	logic [BITS-1:0] W_AND;
	
	genvar i;
	generate
		for(i=0; i<BITS; i=i+1) begin: generate_block_identifier
			_XNOR XNOR (A[i], B[i], W_AND[i]);
		end
	endgenerate
	
	N_INPUTS_AND #(BITS) NIA (W_AND, Y);
	
endmodule 