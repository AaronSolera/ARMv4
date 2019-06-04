module ALU_DECODER(input logic [4:0] Funct, input logic ALUOp,
						 output logic [1:0] ALUControl, FlagW);
	
	always @ *
	
	case ({ALUOp, Funct[4], Funct[3], Funct[2], Funct[1], Funct[0]})
		6'b0?????: begin //Not DP
				ALUControl = 2'b00;
				FlagW = 2'b00;
			end
		6'b101000: begin //ADD
				ALUControl = 2'b00;
				FlagW = 2'b00;
			end
		6'b101001: begin //ADD
				ALUControl = 2'b00;
				FlagW = 2'b11;
			end
		6'b100100: begin //SUB
				ALUControl = 2'b01;
				FlagW = 2'b00;
			end
		6'b100101: begin //SUB
				ALUControl = 2'b01;
				FlagW = 2'b11;
			end
		6'b100000: begin //AND
				ALUControl = 2'b10;
				FlagW = 2'b00;
			end
		6'b100001: begin //AND
				ALUControl = 2'b10;
				FlagW = 2'b10;
			end
		6'b111000: begin //ORR
				ALUControl = 2'b11;
				FlagW = 2'b10;
			end
		6'b111001: begin //ORR
				ALUControl = 2'b11;
				FlagW = 2'b10;
			end
	endcase		
	
endmodule