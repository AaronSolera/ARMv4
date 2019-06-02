module REGISTER_FILE_MODULE (CLK, RST, ADDRS_RN, ADDRS_RM, ADDRS_RD, WRT_DATA, R15_DATA, WRT_ENA, RN_DATA, RM_DATA);
	
	input logic         CLK, RST, WRT_ENA;
	input logic  [3:0]  ADDRS_RN, ADDRS_RM, ADDRS_RD;
	input logic  [31:0] WRT_DATA, R15_DATA;
	output logic [31:0] RN_DATA, RM_DATA;
	
	logic [15:0] 		  DEMUX_WRITE;
	logic [15:0] [31:0] REGISTER_DATA;
	logic [31:0]        WRT_DATA_R15_MUX;
	
	FOUR_BITS_SELECT_SIXTEEN_DEMUX_MODULE 
		FBSSDM (WRT_ENA, ADDRS_RD, DEMUX_WRITE);
		
	genvar r;
	generate
		for(r = 0; r < 15; r++) 
		begin : GENERATE_BLOCK_IDENTIFIER
			REGISTER_MODULE #(32)
				REGISTER (CLK, RST, DEMUX_WRITE[r], WRT_DATA, REGISTER_DATA[r]);
		end
	endgenerate
	
	N_BITS_ONE_SELECT_MUX_MODULE #(32)
		NBOSMM (R15_DATA, WRT_DATA, DEMUX_WRITE[15], WRT_DATA_R15_MUX);
	
	REGISTER_MODULE #(32)
		R15 (CLK, RST, 1'b1, WRT_DATA_R15_MUX, REGISTER_DATA[15]);
				
	SIXTEEN_N_BITS_INPUTS_FOUR_BITS_SELECT_MUX_MODULE #(32) 
		RN_SNBIFBSMM (REGISTER_DATA, ADDRS_RN, RN_DATA),
		RM_SNBIFBSMM (REGISTER_DATA, ADDRS_RM, RM_DATA);
		
endmodule 