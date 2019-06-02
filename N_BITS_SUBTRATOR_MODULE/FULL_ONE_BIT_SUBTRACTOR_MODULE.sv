module FULL_ONE_BIT_SUBTRACTOR_MODULE (A, B, Bin, Diff, Bout);

	input logic A, B, Bin;
	output logic Diff, Bout;
	logic [4:0] W;
	
	_XOR 
		FIRST_XOR (A, B, W[0]);
	_NOT
		FIRST_NOT (A, W[1]);
	_AND
		FIRST_AND (W[1], B, W[2]);
	_XOR
		SECOND_XOR (W[0], Bin, Diff);
	_NOT
		SECONF_NOT (W[0], W[3]);
	_AND
		SECOND_AND (W[3], Bin, W[4]);
	_OR
		OR (W[2], W[4], Bout);

endmodule 