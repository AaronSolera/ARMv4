module ADDER_MODULE #(parameter WIDTH=4)(A, B, Cin, S, Cout);

	 input logic [WIDTH-1:0] A;
	 input logic [WIDTH-1:0] B;
	 input logic Cin;
	 output logic [WIDTH-1:0] S;
	 output logic Cout;
	 logic [WIDTH-2:0] W;
	 
		ONE_BIT_ADDER_MODULE FIRST_ADD (A[0],B[0],Cin,S[0],W[0]);
		
		genvar i;
		generate
		for(i = 1; i < WIDTH-1; i++) 
			begin : generate_block_identifier
				ONE_BIT_ADDER_MODULE
					ADD (A[i],B[i],W[i-1],S[i],W[i]);
			end
		endgenerate
		
		ONE_BIT_ADDER_MODULE LAST_ADD (A[WIDTH-1],B[WIDTH-1],W[WIDTH-2],S[WIDTH-1],Cout);
		
endmodule 