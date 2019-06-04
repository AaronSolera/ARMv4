module MAIN_DECODER(input logic [1:0] Op, input logic Funct0, Funct5,
							output logic Branch, RegW, MemW, MemToReg, ALUSrc, ALUOp,
							output logic [1:0] ImmSrc, RegSrc);
							
	
	always @ *
	
	
	case ({Op[1], Op[0], Funct5, Funct0})
		4'b0000, 4'b0001 : begin
				Branch = 0;
				RegW = 1;
				MemW = 0;
				MemToReg = 0;
				ALUSrc = 0;
				ALUOp = 1;
				
				ImmSrc = 2'b00;
				RegSrc = 2'b00;
			end
		4'b0010, 4'b0011 : begin
				Branch = 0;
				RegW = 1;
				MemW = 0;
				MemToReg = 0;
				ALUSrc = 1;
				ALUOp = 1;
				
				ImmSrc = 2'b00;
				RegSrc = 2'b00;
			end
		4'b0100, 4'b0110 : begin
				Branch = 0;
				RegW = 0;
				MemW = 1;
				MemToReg = 0;
				ALUSrc = 1;
				ALUOp = 0;
				
				ImmSrc = 2'b01;
				RegSrc = 2'b10;
			end
		4'b0101, 4'b0111 : begin
				Branch = 0;
				RegW = 1;
				MemW = 0;
				MemToReg = 1;
				ALUSrc = 1;
				ALUOp = 0;
				
				ImmSrc = 2'b01;
				RegSrc = 2'b00;
			end
		4'b1000, 4'b1001, 4'b1010, 4'b1011 : begin
				Branch = 1;
				RegW = 0;
				MemW = 0;
				MemToReg = 0;
				ALUSrc = 1;
				ALUOp = 0;
				
				ImmSrc = 2'b10;
				RegSrc = 2'b01;
			end
	endcase		
	
endmodule
