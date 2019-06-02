module TESTBENCH_MODULE;
	
	/*
	logic CLK, RST, H_SYNC, V_SYNC, VGA_CLK, VGA_SYNC_N, VGA_BLANK_N; 
	logic [31:0] INS;
	logic [23:0] RGB_COLOR;*/
	
	/*
	logic CLK, BLANK, RST, CHANGE_C_INS;
	logic [31:0] INS, C_INS;
	
	
	logic CLK, WRITE, RST;
	logic [8:0] ROW;
	logic [9:0] COLUMN;
	logic [3:0] IN_DATA, OUT_DATA;*/
	
	//PIXEL_GRAPHIC_ARRAY #(4) PGA (CLK, WRITE, RST, ROW, COLUMN, IN_DATA, OUT_DATA);
	
	/*GRAPHIC_PROCESSING_UNIT
		GPU (CLK, RST, INS, H_SYNC, V_SYNC, VGA_CLK, VGA_SYNC_N, VGA_BLANK_N, RGB_COLOR);*/
		
	//INSTRUCTION_CONTROL_UNIT ICU (CLK, RST, BLANK, CHANGE_C_INS, INS, C_INS);
	
	logic         CLK, RST, WRT_ENA;
	logic  [3:0]  ADDRS_RN, ADDRS_RM, ADDRS_RD;
	logic  [31:0] WRT_DATA, R15_DATA;
	logic  [31:0] RN_DATA, RM_DATA;
	
	REGISTER_FILE_MODULE 
		RFM (CLK, RST, ADDRS_RN, ADDRS_RM, ADDRS_RD, WRT_DATA, R15_DATA, WRT_ENA, RN_DATA, RM_DATA);
	
	initial begin
	
		RST = 1'b0;
		CLK = 1'b0; #10;
		CLK = 1'b1; #10;
		CLK = 1'b0; #10;
		RST = 1'b1;
		
		ADDRS_RN = 4'd0; ADDRS_RM = 4'd0; 
		
		for (int a = 0; a < 16; a++) begin
		
			ADDRS_RD = a; WRT_DATA = a; R15_DATA = a; WRT_ENA = 1'b1; #10;
			CLK = 1'b1; #10;
			CLK = 1'b0; #10;
			
		end
		
		WRT_ENA = 1'b0;
		
		for (int a = 0; a < 16; a++) begin
		
			ADDRS_RN = a; ADDRS_RM = a; #10;
			CLK = 1'b1; #10;
			CLK = 1'b0; #10;
			
		end

	/*	
		CLK = 1'b1;
		INS = 32'd1;#1;
		CLK = 1'b0; #1; 
		
		INS = 32'hFFFFFFFF;
		CHANGE_C_INS = 1'b0;
		BLANK = 1'b0;
		RST = 1'b0;
		CLK = 1'b0; #10;
		CLK = 1'b1; #10;
		CLK = 1'b0; #10;
		RST = 1'b1;
		
		CLK = 1'b1;
		INS = 32'd1;#10;
		CLK = 1'b0; #10;
		
		CLK = 1'b1;
		INS = 32'd2;#10;
		CLK = 1'b0; #10;
		
		CLK = 1'b1;
		INS = 32'd3;#10; 
		CLK = 1'b0; #10;
		
		CLK = 1'b1;
		INS = 32'd4;#10;
		CLK = 1'b0; #10;
		
		CLK = 1'b1;
		INS = 32'd5;#10;
		CLK = 1'b0; #10;
		CLK = 1'b1; #10;
		CLK = 1'b0; #10;
		
		CLK = 1'b1;
		CHANGE_C_INS = 1'b1; #10;
		CLK = 1'b0;
		CHANGE_C_INS = 1'b0; #10;
		
		CLK = 1'b1;
		CHANGE_C_INS = 1'b1; #10;
		CLK = 1'b0;
		CHANGE_C_INS = 1'b0; #10;
		
		CLK = 1'b1;
		CHANGE_C_INS = 1'b1; #10;
		CLK = 1'b0;
		CHANGE_C_INS = 1'b0; #10;
		
		CLK = 1'b1;
		CHANGE_C_INS = 1'b1; #10;
		CLK = 1'b0;
		CHANGE_C_INS = 1'b0; #10;
		
		CLK = 1'b1;
		CHANGE_C_INS = 1'b1; #10;
		CLK = 1'b0;
		CHANGE_C_INS = 1'b0; #10;
		
		BLANK = 1'b1;
		CLK = 1'b1; #10;
		CLK = 1'b0; #10;
		CLK = 1'b1; #10;
		CLK = 1'b0; #10;	
		CLK = 1'b1; #10;
		CLK = 1'b0; #10;
		CLK = 1'b1; #10;
		CLK = 1'b0; #10;
		
	
	
	

		COLUMN = 10'b0;
		
		ROW = 9'd0; WRITE = 1'b1; IN_DATA = 4'h0;
		CLK = 1'b1; #10;
		CLK = 1'b0; #10;
		ROW = 9'd32; IN_DATA = 4'h1;
		CLK = 1'b1; #10;
		CLK = 1'b0; #10;
		ROW = 9'd64; IN_DATA = 4'h2;
		CLK = 1'b1; #10;
		CLK = 1'b0; #10;
		ROW = 9'd96; IN_DATA = 4'h3;
		CLK = 1'b1; #10;
		CLK = 1'b0; #10;
		ROW = 9'd128; IN_DATA = 4'h4;
		CLK = 1'b1; #10;
		CLK = 1'b0; #10;
		ROW = 9'd160; IN_DATA = 4'h5;
		CLK = 1'b1; #10;
		CLK = 1'b0; #10;
		ROW = 9'd192; IN_DATA = 4'h6;
		CLK = 1'b1; #10;
		CLK = 1'b0; #10;
		ROW = 9'd224; IN_DATA = 4'h7;
		CLK = 1'b1; #10;
		CLK = 1'b0; #10;
		
		ROW = 9'd0; WRITE = 1'b0; IN_DATA = 4'hF;
		CLK = 1'b1; #10;
		CLK = 1'b0; #10;
		ROW = 9'd32; 
		CLK = 1'b1; #10;
		CLK = 1'b0; #10;
		ROW = 9'd64; 
		CLK = 1'b1; #10;
		CLK = 1'b0; #10;
		ROW = 9'd96; 
		CLK = 1'b1; #10;
		CLK = 1'b0; #10;
		ROW = 9'd128;
		CLK = 1'b1; #10;
		CLK = 1'b0; #10;
		ROW = 9'd160; 
		CLK = 1'b1; #10;
		CLK = 1'b0; #10;
		ROW = 9'd192; 
		CLK = 1'b1; #10;
		CLK = 1'b0; #10;
		ROW = 9'd224; 
		CLK = 1'b1; #10;
		CLK = 1'b0; #10;
		
		ROW = 9'd0; WRITE = 1'b1; IN_DATA = 4'hF;
		CLK = 1'b1; #10;
		CLK = 1'b0; #10;
		*/	
	end
/*
	always begin
		CLK <= ~CLK; #1;
	end
*/
endmodule 