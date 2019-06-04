module ENABLED_RESETTABLE_FF#(parameter WIDTH = 8)
								(input logic clk, reset, Enable, 
								 input logic [WIDTH-1:0] D,
								 output logic [WIDTH-1:0] Q);
								
								
	always_ff@(posedge clk, posedge reset)
		if (reset) Q <= 4'b0;
		else if (Enable) Q <= D;

endmodule