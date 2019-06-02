module TWO_BITS_SELECT_FOUR_DEMUX_MODULE (DATA, S, OUT);
	
	input logic DATA;
	input logic [1:0]	S;
	output logic [3:0] OUT;
	logic NOT_S0, NOT_S1;
	
	_NOT 
		_NOT_S0 (S[0], NOT_S0),
		_NOT_S1 (S[1], NOT_S1);
		
	N_INPUTS_AND #(3)
		FISRT_AND  ({DATA, NOT_S0, NOT_S1}, OUT[0]),
		SECOND_AND ({DATA, NOT_S1, S[0]}, 	OUT[1]),
		THIRD_AND  ({DATA, NOT_S0, S[1]},	OUT[2]),
		FOURTH_AND ({DATA, S[0],   S[1]}, 	OUT[3]);
		
endmodule 