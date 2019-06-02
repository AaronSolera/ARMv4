module N_BITS_ALU_MODULE #(parameter BITS = 32) (A, B, CIN, OP, RST, COUT, FLAGS);
	
	input  logic  [BITS-1:0] A, B;
	input  logic  [3:0] 		 OP;
	input  logic  				 CIN;
	output logic  [BITS-1:0] RST;
	output logic  [3:0] 		 FLAGS;
	output logic 				 COUT;
	logic  [15:0] [BITS-1:0] DATA; 
	logic 						 W_COUT, W_SUB, ZERO_FLAG, W_XOR, W_AND, W_EQU, W_OP;
	logic         [BITS-1:0] W_RST;
	
	//----------------------------------------------- Aritmetic functions -----------------------------------------------
	
	//Full adder-subtracter module -> Operation ADD = 0000, SUB = 0001
	EQUAL_COMPARATOR_MODULE #(4) 
		EQU_SUB (OP, 4'b0001, W_SUB);
	
	N_BITS_ADD_SUB_MODULE #(BITS) 
		ADD_SUB (A, B, CIN, W_SUB, W_RST, W_COUT);
	
	assign DATA[0] = W_RST;
	assign DATA[1] = W_RST;
	
	//Aritmetic shift right -> Operation ASR = 0010
	N_BITS_ARITMETIC_SHIFT_RIGHT #(BITS)
		ASR (A, B, DATA[2]);
		
	//Aritmetic shift left  -> Operation ASL = 0011
	N_BITS_ARITMETIC_SHIFT_LEFT #(BITS)
		ASL (A, B, DATA[3]);
	
	//----------------------------------------------- Logic functions -----------------------------------------------
	
	//Logic AND -> Operation AND = 0100
	N_AND #(BITS)
		AND (1'b1, A, B, DATA[4]);
	
	//Logic OR  -> Operation ORR = 0101
	N_OR #(BITS)
		ORR (1'b1, A, B, DATA[5]);
		
	//Logic NOT -> Operation NOT = 0110	
	N_NOT #(BITS)
		NOT (1'b1, A, DATA[6]);
		
	//Logic XOR -> Operation EOR = 0111
	N_XOR #(BITS)
		EOR (1'b1, A, B, DATA[7]);
		
	//Logic shift right -> Operation LSR = 1000
	N_BITS_LOGIC_SHIFT_RIGHT #(BITS)
		LSR (A, B, DATA[8]);
	
	//Operation selection multiplexor 
	SIXTEEN_N_BITS_INPUTS_FOUR_BITS_SELECT_MUX_MODULE #(BITS)
		ALU_MUX (DATA, OP, RST);
		
	assign COUT = W_COUT;
	
	//----------------------------------------------- Conditional Flags -----------------------------------------------
	
	//N conditional flag
	assign FLAGS[0] = RST[BITS-1];
	
	//Z conditional flag
	N_INPUTS_OR #(BITS)
		ZERO (RST, ZERO_FLAG);
	assign FLAGS[1] = ~ZERO_FLAG;
	
	//C conditional flag
	EQUAL_COMPARATOR_MODULE #(4) 
		EQU (OP, 4'd3, W_EQU);
	_AND
		AND_C (W_EQU, A[BITS-1], W_OP);
	_OR
		OR_C  (W_COUT, W_OP, FLAGS[2]);
		
	//V conditional flag
	_XOR
		XOR_V (A[BITS-1], B[BITS-1], W_XOR);
	_AND
		FIRST_AND_V  (B[BITS-1], RST[BITS-1], W_AND),
		SECOND_AND_V (W_XOR, W_AND, FLAGS[3]);
		
endmodule 