module Processorwork  (Instrucion,  CLK, RST, PC, RegSrc, RegWrite,ALUSrc, AluControl, MemWrite, MemToReg, PCSrc, Flags);
	
	input  logic  [31:0] Instrucion;
	input  logic   CLK,RST;
	input  logic  [1:0] RegSrc;
	output logic  [3:0] Flags;
	output logic  [31:0] PC;
	output logic  RegWrite, AluControl,ALUSrc, MemWrite, MemToReg, PCSrc;
	
	
	logic A,B,CIN,OP,COT;
	logic ExtImm;		
	logic [31:0] RD1,RD2,R15,ALUResult,ReadData,Result,PCPlus4,PCPrima;
	logic [3:0] A1,A2,A3;
	
	
	
	N_BITS_ONE_SELECT_MUX_MODULE  											//seleccionamos las entradas al register file
		#(32) MuxRA1 (Instrucion[19:16],      1111        , RegSrc[0], A1); // Mux para seleccionar la entrada en el registro RA1.
	N_BITS_ONE_SELECT_MUX_MODULE
		#(32) MuxRA2 (Instrucion[3:0]  , Instrucion[15:12], RegSrc[1], A2); // Mux para seleccionar la entrada en el registro RA1.
	assign A3 = Instrucion[15:12];
	
	REGISTER_FILE_MODULE 
		RegisterFile (CLK, RST, A1, A2, A3, Result, R15, RegWrite, RD1, RD2);
	
	N_BITS_ONE_SELECT_MUX_MODULE 
		#(32) MuxAluSrc (RD2, ExtImm, ALUSrc, SrcB); 						// mux que selecciona entre inmediato o registro.
	logic COUT;
	N_BITS_ALU_MODULE 
		#(32) ALU (SrcA, SrcB, 1'b0, OP, ALUResult, COUT, Flags);			  //ALU llamada a la operacion
	
	
	
	MEMORY_MODULE #(32,32) DataMemory (CLK, RST, ALUResult, MemWrite, RD2, ReadData);    	//ReadData = dato que devuelve la memoria.
	                                                                                       //llamamos el módulo encargado de guardar y leer la memoria
	
	N_BITS_ONE_SELECT_MUX_MODULE  											//seleccionamos la salida entre la memoria o la ALU 
		#(32) MuxResult (ReadData,ALUResult, MemToReg, Result); // Mux para seleccionar el resultado final de la ALU.
	
	N_BITS_ONE_SELECT_MUX_MODULE  											//seleccionamos la salida entre la memoria o la ALU 
		#(32) MuxPC (Result,PCPlus4, PCSrc, PCPrima); // Mux para seleccionar el nuevo pc.
	
	REGISTER_MODULE #(32) 														//Guardamos la posicion del program counter
		RegistroCLK (~CLK, RST, CLK, PCPrima, PC);						//en el ciclo negativo actualizamos el valor del program counter.
	
endmodule 