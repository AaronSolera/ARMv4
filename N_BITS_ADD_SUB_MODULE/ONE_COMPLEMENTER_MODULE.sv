module ONE_COMPLEMENTER_MODULE #(parameter WIDTH=4)(I, ENA, O);
	
	input logic [WIDTH-1:0] I;
	input logic ENA;
	output logic [WIDTH-1:0] O;
	
	genvar i;
	generate
		for(i = 0; i < WIDTH; i++) 
		begin : generate_block_identifier
			_XOR
				XOR (I[i],ENA,O[i]);
		end
	endgenerate
	
endmodule 