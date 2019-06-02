module ONE_BIT_ADDER_MODULE(input logic X,Y,Cin, output logic S,Cout);

	logic W1, W2, W3;
	
	_XOR
		W1_XOR(X,Y,W1),
		S_XOR(W1,Cin,S);
	_AND
		W2_AND(W1,Cin,W2),
		W3_AND(X,Y,W3);
	_OR
		Cout_OR(W2,W3,Cout);
		
endmodule