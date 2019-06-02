module ONE_BIT_MUX_MODULE (A, B, S, R);

	input logic A, B, S;
	output logic R;
	logic W_1, W_2, W_3;
	
	_NOT 
		FIRST_NOT (S, W_1);
	_AND 
		FIRST_AND (B, S, W_2),
		SECOND_AND (A, W_1, W_3);
	_OR 
		FIRST_OR (W_2, W_3, R);
	
endmodule 