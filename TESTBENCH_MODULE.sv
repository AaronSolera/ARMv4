module TESTBENCH_MODULE;
	
	logic CLK, RST, H_SYNC, V_SYNC, VGA_CLK, VGA_SYNC_N, VGA_BLANK_N; 
	logic [9:0] SCREEN_POS_X, SCREEN_POS_Y;
	logic [31:0] INS;
	logic [3:0] RGB_COLOR;
	

	GRAPHIC_PROCESSING_UNIT
		GPU (CLK, RST, INS, H_SYNC, V_SYNC, VGA_CLK, VGA_SYNC_N, VGA_BLANK_N, RGB_COLOR);
	
	initial begin
		
		INS = 32'd0;
		RST = 1'b0;
		CLK = 1'b1; #1;
		CLK = 1'b0; #1;
		RST = 1'b1;
		
	end

	always begin
		CLK <= ~ CLK; #1;
	end

endmodule 