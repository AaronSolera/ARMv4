module COUNTER_MODULE (CLK, RST, COUNTER); 
	
	input logic CLK, RST;
	output logic [15:0] COUNTER;
	
	always @(posedge CLK, negedge RST) begin
		if (!RST) COUNTER <= 16'd0;
		else COUNTER <= COUNTER + 16'd1;
	end
	
endmodule 