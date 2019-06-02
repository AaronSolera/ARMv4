module PIXEL_GRAPHIC_ARRAY #(parameter DATA_SIZE = 4) (CLK, RST, WRITE, ROW, COLUMN, IN_DATA, OUT_DATA);

	input  logic 		           CLK, WRITE, RST;
	input  logic [8:0]           ROW;
	input  logic [9:0] COLUMN;
	input  logic [DATA_SIZE-1:0] IN_DATA;
	output logic [DATA_SIZE-1:0] OUT_DATA;
	logic        [14:0]          DEMUX_WRITE;
	logic [14:0] [3:0]           MUX_OUT_DATA; 

	FOUR_BITS_SELECT_SIXTEEN_DEMUX_MODULE 
		FBSSDM (WRITE, ROW[8:5], DEMUX_WRITE);
	
	genvar i;
	generate
		for(i = 0; i < 15; i++) 
		begin : generate_block_identifier
			BIDIMENTIONAL_CELL_ARRAY #(32, 635, DATA_SIZE)
				BCA (CLK, DEMUX_WRITE[i], RST, ROW[4:0], COLUMN, IN_DATA, MUX_OUT_DATA[i]);
		end
	endgenerate
	
	SIXTEEN_N_BITS_INPUTS_FOUR_BITS_SELECT_MUX_MODULE #(4) 
		SNBIFBSMM (MUX_OUT_DATA, ROW[8:5], OUT_DATA);
	
endmodule 