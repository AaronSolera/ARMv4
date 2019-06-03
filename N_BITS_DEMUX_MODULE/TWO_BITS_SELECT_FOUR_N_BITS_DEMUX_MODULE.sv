module TWO_BITS_SELECT_FOUR_N_BITS_DEMUX_MODULE #(parameter BITS = 4) (IN_DATA, SELECT, OUT_DATA);
	input logic  [BITS-1:0] 		IN_DATA;
	input logic  [1:0]            SELECT;
	output logic [3:0] [BITS-1:0] OUT_DATA;
	
	genvar i;
	generate
		for(i = 0; i < BITS; i++) 
		begin : generate_block_identifier
			TWO_BITS_SELECT_FOUR_DEMUX_MODULE
				DEMUX (IN_DATA[i], SELECT, OUT_DATA[i]);
		end
	endgenerate

endmodule 