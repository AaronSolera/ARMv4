module N_OR

	#(parameter n=3)
	(input logic ENA, input logic [n-1:0] a, input logic [n-1:0] b,
	output logic [n-1:0] y);
	
	logic [n-1:0] W_ENA;
	
	genvar i;
	generate
		for(i=0; i<n; i=i+1) begin: forlop
			assign W_ENA[i] = (a[i] || b[i]);
		end
	endgenerate
	
	ENABLE_MODULE #(n) EM (W_ENA, ENA, y);
	
endmodule