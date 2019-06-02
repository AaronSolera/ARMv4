module N_INPUTS_AND #(parameter WIDTH=4) (I,O);

	input logic [WIDTH-1:0] I;
	output logic O;
	logic [WIDTH-3:0] W;
	
	_AND FIRST_AND (I[0], I[1], W[0]);
	
	genvar i;
	generate
		for(i = 2; i < WIDTH-1; i++) 
		begin : generate_block_identifier
			_AND
				AND (W[i-2], I[i], W[i-1]);
		end
	endgenerate
	
	_AND LAST_AND (W[WIDTH-3], I[WIDTH-1], O);
	
endmodule 