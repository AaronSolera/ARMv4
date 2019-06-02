module TWO_BITS_SELECT_FOUR_N_BITS_DEMUX_MODULE #(parameter BITS = 4) (DATA, SELECT, D, C, B, A);
	input logic [BITS-1:0] DATA;
	input logic [1:0] SELECT;
	output logic [BITS-1:0] A, B, C, D;
	
	genvar i;
	generate
		for(i = 0; i < BITS; i++) 
		begin : generate_block_identifier
			TWO_BITS_SELECT_FOUR_DEMUX_MODULE
				DEMUX (DATA[i], SELECT, {D[i], C[i], B[i], A[i]});
		end
	endgenerate

endmodule 