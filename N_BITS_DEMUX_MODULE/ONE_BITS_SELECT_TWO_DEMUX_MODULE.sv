module ONE_BITS_SELECT_TWO_DEMUX_MODULE (DATA, S, OUT);
	
	input logic DATA;
	input logic S;
	output logic [1:0] OUT;
	logic NOT_S;
	
	_NOT 
		_NOT_S (S, NOT_S);
		
	_AND
		FIRST_AND  (DATA, NOT_S, OUT[0]),
		SECOND_AND (DATA, S, OUT[1]);
		
endmodule 