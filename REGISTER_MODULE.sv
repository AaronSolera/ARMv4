module REGISTER_MODULE #(parameter DATA_SIZE = 32)(CLK, RST, WRITE, IN_DATA, OUT_DATA);

	input  logic CLK, WRITE, RST;
	input  logic [DATA_SIZE-1:0] IN_DATA;
	output logic [DATA_SIZE-1:0] OUT_DATA;
	
	logic [DATA_SIZE-1:0] MEMORY;
	
	always_ff @(negedge CLK, posedge WRITE, negedge RST) begin
		if (!RST) begin
			MEMORY <= 32'hFFFFFFFF;
			OUT_DATA <= MEMORY;
		end else if (WRITE) MEMORY <= IN_DATA;
		OUT_DATA <= MEMORY;
	end
	
endmodule 