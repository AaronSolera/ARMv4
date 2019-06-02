module SYNC_MODULE (CLK, RST, A, B, C, D, RGB_ENA, OUT_CLK, POSITION);


	input logic CLK, RST;
	input logic [9:0] A, B, C, D;
	output logic RGB_ENA, OUT_CLK;
	output logic [9:0] POSITION;
	logic [9:0] COUNT;

	always_ff @(posedge CLK, negedge RST) begin
		if (!RST) COUNT <= 10'd0;
		else if (COUNT == D) COUNT = 10'd0;
		else COUNT <= COUNT + 10'd1;
	end
	
	assign OUT_CLK = (COUNT > A);
	assign RGB_ENA = (COUNT > B & COUNT < C);
	
	COUNTER_MODULE
		CM (CLK & (COUNT > B), RST & (COUNT < C), POSITION);

endmodule 