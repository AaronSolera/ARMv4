module TESTBENCH_MODULE;
	
	/*
	logic CLK, RST, H_SYNC, V_SYNC, VGA_CLK, VGA_SYNC_N, VGA_BLANK_N; 
	logic [31:0] INS;
	logic [23:0] RGB_COLOR;*/
	
	
	logic        CLK, RST;
	logic [9:0]  SYS_X, SYS_Y;
	logic [9:0]  x, y;
	logic [31:0] INS;
	logic [15:0] C_INS;
	
	/*GRAPHIC_PROCESSING_UNIT
		GPU (CLK, RST, INS, H_SYNC, V_SYNC, VGA_CLK, VGA_SYNC_N, VGA_BLANK_N, RGB_COLOR);*/
		
	INSTRUCTION_CONTROL_UNIT ICU (CLK, RST, SYS_X, SYS_Y, INS, C_INS);

	initial begin
	
		SYS_X = 10'd0; 
		SYS_Y = 10'd0; 
		
		INS = 32'hFFFFFFFF; 
		RST = 1'b0; 
		CLK = 1'b0; #10;
		CLK = 1'b1; #10;
		CLK = 1'b0; #10;
		RST = 1'b1;
		
		CLK = 1'b1;
		INS = 32'd10;#10;
		CLK = 1'b0; #10;
		
		CLK = 1'b1;
		INS = 32'd20;#10;
		CLK = 1'b0; #10;
		
		CLK = 1'b1;
		INS = 32'd30;#10; 
		CLK = 1'b0; #10;
		
		CLK = 1'b1;
		INS = 32'd40;#10;
		CLK = 1'b0; #10;
		
		CLK = 1'b1;
		INS = 32'd50;#10;
		CLK = 1'b0; #10;
		
		for(y = 0; y < 480; y++) begin
			for(x = 0; x < 635; x++) begin
				SYS_X = x;
				SYS_Y = y;
				CLK = 1'b1; #1;
				CLK = 1'b0; #1;
			end
		end
	end
/*
	always begin
		CLK <= ~CLK; #1;
	end
*/
endmodule 