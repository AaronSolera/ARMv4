module TWO_COMPLEMENTER_MODULE #(parameter WIDTH=4)(I, ENA, O);

	input logic [WIDTH-1:0] I;
	input logic ENA;
	output logic [WIDTH-1:0] O;
	logic Cout;
	logic [WIDTH-1:0] W_COMP;
	
	ONE_COMPLEMENTER_MODULE #(WIDTH) COMP (I, ENA, W_COMP);
	ADDER_MODULE #(WIDTH) ADD (W_COMP, ENA, 0, O, Cout);
	
endmodule 