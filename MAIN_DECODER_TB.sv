module MAIN_DECODER_TB();
	
	logic Funct0, Funct5, Branch, RegW, MemW, MemToReg, ALUSrc, ALUOp;
	logic [1:0] ImmSrc, RegSrc, Op;
	
		
		
	// Instantiate the Unit Under Test (UUT)
	MAIN_DECODER uut ( Op, Funct0, Funct5, Branch, RegW, MemW, MemToReg, ALUSrc, ALUOp,
							 ImmSrc, RegSrc);
		
 
	initial begin
	
		// Initialize Inputs
		Op = 2'b00;
		Funct5 = 0;
		Funct0 = 0;
		Branch = 0;
		MemToReg = 0;
		MemW = 0;
		ALUSrc = 0;
		ImmSrc = 2'b00;
		RegW = 0;
		RegSrc = 2'b00;
		ALUOp = 0;
		
		
		#10 Funct5 = 1;
		
		#10 Op = 2'b01;
		#10 Funct0 = 1;
		
		#10 Op = 2'b10;
		
		#40 ;
 
	end  
 

endmodule