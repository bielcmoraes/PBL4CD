//Decodificador 4 Bits. Decodifica as letras nescessárias para formar as palavras corretas no display.

module DecodificadorDisplay (value, convert, Ponto);

	input [3:0] value;
	output reg [6:0] convert;
	output reg Ponto;
	
	always @* begin
	
		Ponto = 1'b1;
	
		case (value) //FrEE, PArE, ErrO
			
			4'b0000: convert = 7'b0111000; //F
			4'b0001: convert = 7'b1111010; //r
			4'b0010: convert = 7'b0110000; //E
			4'b0011: convert = 7'b0011000; //P
			4'b0100: convert = 7'b0001000; //A
			4'b0101: convert = 7'b1100010; //0
			4'b0110: convert = 7'b1000001; //U
			4'b0111: convert = 7'b1110001;	//L
			
			default: convert = 7'b1111111;
			
		endcase
		
	end

endmodule 