module PC_LOGIC(input logic Rd[3:0], Branch, RegW,
					 output logic PCS);
	
	logic quince = 0;
	always @ *
	
	case (Rd)
		4'b1111 : quince = 1; 			
		
		default: quince = 0;
	endcase		
	
	assign PCS = ((quince & RegW) | Branch);
	
endmodule