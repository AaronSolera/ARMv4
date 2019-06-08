module SYNC_MODULE (CLK, RST, A, B, C, D, RGB_ENA, OUT_CLK, POSITION);

	input logic CLK, RST;
	input logic [9:0] A, B, C, D;
	output logic RGB_ENA, OUT_CLK;
	output logic [9:0] POSITION;
	logic [9:0] COUNT, POS_DIFF;
	logic V_RST, POS_RST, W_RGB_ENA;

	always_ff @(posedge CLK, negedge RST) begin
		if (!RST) COUNT <= 10'd0;
		else if (COUNT == D) COUNT = 10'd0;
		else COUNT <= COUNT + 10'd1;
	end
	
	assign OUT_CLK = (COUNT > A);
	assign W_RGB_ENA = (COUNT > B & COUNT < C);
	assign RGB_ENA = W_RGB_ENA;
	
	FULL_N_BITS_SUBTRACTOR_MODULE 
		POSITION_SUB (COUNT, B, POS_DIFF, V_RST);
	
	_AND
		AND (~V_RST, W_RGB_ENA, POS_RST);
	
	ENABLE_MODULE #(10)
		EM (POS_DIFF, POS_RST, POSITION);
		
endmodule 