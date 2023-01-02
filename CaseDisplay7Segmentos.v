//Case do display de 7 segmentos 

module CaseDisplay7Segmentos (Livre, Pare, Erro, Full, Clock, ClockMetade, Output);
	
	input Clock, ClockMetade, Livre, Pare, Erro, Full;
	output reg [3:0] Output;
	
	always @(*) begin
		
		Output <= 4'b1000;
		
		if (Livre)
		begin
			case ({Clock, ClockMetade})
			
			2'b00: Output <= 4'b0000; //F
			2'b01: Output <= 4'b0001; //r
			2'b10: Output <= 4'b0010; //E
			2'b11: Output <= 4'b0010; //E
		
			endcase
		end
		
		else if (Pare)
		begin
			case ({Clock, ClockMetade})
			
			2'b00: Output <= 4'b0011; //P
			2'b01: Output <= 4'b0100; //A
			2'b10: Output <= 4'b0001; //r
			2'b11: Output <= 4'b0010; //E
		
			endcase
		end
		
		else if (Erro)
		begin
			case ({Clock, ClockMetade})
			
			2'b00: Output <= 4'b0010; //E
			2'b01: Output <= 4'b0001; //r
			2'b10: Output <= 4'b0001; //r
			2'b11: Output <= 4'b0101; //o
		
			endcase
		end
		
		else if (Full)
		begin
			case ({Clock, ClockMetade})
			
			2'b00: Output <= 4'b0000; //F
			2'b01: Output <= 4'b0110; //U
			2'b10: Output <= 4'b0111; //L
			2'b11: Output <= 4'b0111; //L
		
			endcase
		end
		
	end


endmodule