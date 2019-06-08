module REGISTER_MODULE #(parameter DATA_SIZE = 32)(CLK, RST, WRITE, IN_DATA, OUT_DATA);

	input  logic CLK, WRITE, RST;
	input  logic [DATA_SIZE-1:0] IN_DATA;
	output logic [DATA_SIZE-1:0] OUT_DATA;
	
	genvar r;
	generate
		for(r = 0; r < DATA_SIZE; r++) 
		begin : GENERATE_BLOCK_IDENTIFIER
			ONE_BIT_REGISTER_MODULE 
				OBRM (CLK, RST, WRITE, IN_DATA[r], OUT_DATA[r]);
		end
	endgenerate

endmodule 