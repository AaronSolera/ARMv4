module FULL_N_BITS_SUBTRACTOR_MODULE #(parameter BITS = 10) (A, B, Diff, Bout);
	input logic [BITS-1:0] A, B;
	output logic [BITS-1:0] Diff;
	output logic Bout;
	logic [BITS-2:0] W_Bout;

	FULL_ONE_BIT_SUBTRACTOR_MODULE
				FIRST_FOBSM (A[0], B[0], 1'b0, Diff[0], W_Bout[0]);
				
	genvar i;
	generate
		for(i = 1; i < BITS-1; i++) 
		begin : generate_block_identifier
			FULL_ONE_BIT_SUBTRACTOR_MODULE
				FOBSM (A[i], B[i], W_Bout[i-1], Diff[i], W_Bout[i]);
		end
	endgenerate	
	
	FULL_ONE_BIT_SUBTRACTOR_MODULE
				LAST_FOBSM (A[BITS-1], B[BITS-1], W_Bout[BITS-2], Diff[BITS-1], Bout);
	
endmodule 