module GRAPHIC_INSTRUCTION_MEMORY_MODULE (CLK, RST, SYS_X, SYS_Y, WRITE_ADDRESS, WRITE, INSTRUCTION, CURRENT_GRAPHIC_DATA);

	input  logic        CLK, WRITE, RST;
	input  logic [5:0]  WRITE_ADDRESS;
	input  logic [9:0]  SYS_X, SYS_Y;
	input  logic [31:0] INSTRUCTION;
	output logic [15:0] CURRENT_GRAPHIC_DATA;
	
	logic [63:0] 		  DEMUX_WRITE;
	logic [63:0] [15:0] OUT_GRAPHIC_DATA;
	
	SIX_BITS_SELECT_SIXTY_FOUR_DEMUX_MODULE 
		SBSSFDM (WRITE, WRITE_ADDRESS, DEMUX_WRITE);
	
	GRAPHIC_REGISTER_MODULE 
		FIRST_GRM (CLK, RST, DEMUX_WRITE[0], INSTRUCTION, SYS_X, SYS_Y, 16'hFFFF, OUT_GRAPHIC_DATA[0]);	
	
	genvar r;
	generate
		for(r = 1; r < 63; r++) 
		begin : GENERATE_BLOCK_IDENTIFIER
			GRAPHIC_REGISTER_MODULE 
				GRM (CLK, RST, DEMUX_WRITE[r], INSTRUCTION, SYS_X, SYS_Y, OUT_GRAPHIC_DATA[r-1], OUT_GRAPHIC_DATA[r]);
		end
	endgenerate
	
	GRAPHIC_REGISTER_MODULE 
		LAST_GRM (CLK, RST, DEMUX_WRITE[63], INSTRUCTION, SYS_X, SYS_Y, OUT_GRAPHIC_DATA[62], CURRENT_GRAPHIC_DATA);

endmodule 