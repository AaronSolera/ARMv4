module N_INPUTS_OR #(parameter WIDTH=4)(I,O);

	input logic [WIDTH-1:0] I;
	output logic O;
	logic [WIDTH-3:0] W;
	
	_OR FIRST_OR (I[0], I[1], W[0]);
	
	genvar i;
	generate
		for(i = 2; i < WIDTH-1; i++) 
		begin : generate_block_identifier
			_OR
				OR (W[i-2], I[i], W[i-1]);
		end
	endgenerate
	
	_OR LAST_OR (W[WIDTH-3], I[WIDTH-1], O);
	
endmodule 