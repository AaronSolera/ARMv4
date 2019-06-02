module CLK_HALF_DIV_MODULE (CLK, RST, OUT_CLK);

	input logic CLK, RST;
	output logic OUT_CLK;
	logic COUNT;

	always_ff @(posedge CLK, negedge RST) begin
		if (!RST) COUNT = 1'b0;
		else COUNT <= COUNT + 1'b1; 
	end
	
	assign OUT_CLK = (COUNT == 1'b1);
	
endmodule 