module GRAPHIC_REGISTER_MODULE (CLK, RST, WRITE, WRITE_DATA, SYS_X, SYS_Y, IN_GRAPHIC_DATA, OUT_GRAPHIC_DATA);
	
	input  logic         CLK, RST, WRITE;
	input  logic  [31:0] WRITE_DATA; 
	input  logic  [9:0]  SYS_X, SYS_Y;
	input  logic  [15:0] IN_GRAPHIC_DATA;
 	output logic  [15:0] OUT_GRAPHIC_DATA;
	
	logic INVISIBLE, IN_AREA, IN_AREA_INDICATOR; 
	logic [4:0]  DIFF_X_COUNT, DIFF_Y_COUNT;
	logic [31:0] READ_DATA;
 	
	REGISTER_MODULE #(32)
		REGISTER (CLK, RST, WRITE, WRITE_DATA, READ_DATA);
	
	AREA_VERIFICATOR_MODULE 
		AVM (READ_DATA[21:12], READ_DATA[31:22], SYS_X, SYS_Y, DIFF_X_COUNT, DIFF_Y_COUNT, IN_AREA);
	
	N_BITS_ONE_SELECT_MUX_MODULE #(16)
		MUX ({READ_DATA[5:0], DIFF_Y_COUNT, DIFF_X_COUNT}, IN_GRAPHIC_DATA, ~IN_AREA_INDICATOR, OUT_GRAPHIC_DATA);
	
	N_INPUTS_AND #(6)
		INVISIBLE_AND (READ_DATA[11:6], INVISIBLE);
		
	_AND
		SKIP_IMG_AND (~INVISIBLE, IN_AREA, IN_AREA_INDICATOR);
	
endmodule 