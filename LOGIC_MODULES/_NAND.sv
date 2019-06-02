module _NAND (input logic X,Y, output logic Z);
	
	assign Z = ~(X & Y);
	
endmodule 