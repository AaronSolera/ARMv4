module _NOR(input logic X,Y, output logic Z);

	assign Z = ~(X | Y);
	
endmodule