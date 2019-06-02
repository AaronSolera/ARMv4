module BIDIMENTIONAL_CELL_ARRAY #(parameter ROW_SIZE = 8, COLUMN_SIZE = 8, DATA_SIZE = 8)(CLK, WRITE, RST, ROW, COLUMN, IN_DATA, OUT_DATA);

	input  logic CLK, WRITE, RST;
	input  logic [ROW_SIZE-1:0]    ROW;
	input  logic [COLUMN_SIZE-1:0] COLUMN;
	input  logic [DATA_SIZE-1:0]   IN_DATA;
	output logic [DATA_SIZE-1:0]   OUT_DATA;
	
	logic [DATA_SIZE-1:0] MEMORY [0:ROW_SIZE-1][0:COLUMN_SIZE-1];
	
	always_ff @(negedge CLK, posedge WRITE, negedge RST) begin
		if (!RST) begin
			MEMORY[1'b0][1'b0] <= '{'b0};
			OUT_DATA <= MEMORY[1'b0][1'b0];
		end else if (WRITE) MEMORY[ROW][COLUMN] <= IN_DATA;
		else OUT_DATA <= MEMORY[ROW][COLUMN];
	end
	
endmodule 