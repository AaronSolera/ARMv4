module COLOR_DECODER (input logic [3:0] ID, output logic [23:0] RGB_COLOR);

	always_comb begin
	
		case(ID)
			
			4'hF: 	RGB_COLOR = 24'hFFFFFF;
			default: RGB_COLOR = 24'h00FF00;
			
		endcase
		
	end
	
endmodule 