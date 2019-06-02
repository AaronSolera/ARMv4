module FOUR_BITS_SELECT_SIXTEEN_DEMUX_MODULE (IN, SELECT, OUT);
	
	input  logic 		  IN;
	input  logic [3:0]  SELECT;
	output logic [15:0] OUT;
	logic        [3:0]  W_IN;
	
	TWO_BITS_SELECT_FOUR_DEMUX_MODULE 
		MAIN_DEMUX   (IN,      SELECT[3:2], W_IN),
		FIRST_DEMUX  (W_IN[0], SELECT[1:0], OUT[3:0]),
		SECOND_DEMUX (W_IN[1], SELECT[1:0], OUT[7:4]),
		THIRD_DEMUX  (W_IN[2], SELECT[1:0], OUT[11:8]),
		FOURTH_DEMUX (W_IN[3], SELECT[1:0], OUT[15:12]);
		
endmodule 