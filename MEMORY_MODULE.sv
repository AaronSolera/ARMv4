module MEMORY_MODULE #(parameter DATA_SIZE = 4, ADDRESS_SIZE = 4)(CLK, RST, ADDRESS, WRITE, IN_DATA, OUT_DATA);

	input  logic CLK, WRITE, RST;
	input  logic [ADDRESS_SIZE-1:0] ADDRESS;
	input  logic [DATA_SIZE-1:0] IN_DATA;
	output logic [DATA_SIZE-1:0] OUT_DATA;
	
	logic [DATA_SIZE-1:0] MEMORY [0:ADDRESS_SIZE-1];
	
	always_ff @(negedge CLK, posedge WRITE, negedge RST) begin
		if (!RST) begin
			MEMORY[32'd0] <= 32'd0;
			OUT_DATA <= MEMORY[32'd0];
		end else if (WRITE) MEMORY[ADDRESS] <= IN_DATA;
		else OUT_DATA <= MEMORY[ADDRESS];
	end
	
endmodule 