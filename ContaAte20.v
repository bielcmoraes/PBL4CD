module ContaAte20 (CLK, Tempo);

	input CLK; // Sinal de clock da placa (50 MHz)
	output reg Tempo; // output clock after dividing the input clock by divisor
	reg[27:0] counter=28'd0;
	parameter DIVISOR = 28'd1000000000;
	
	
	always @(negedge CLK)
		begin
			counter <= counter + 28'd1;
			if(counter>=(DIVISOR-1))
			begin
				counter <= 28'd0;
				Tempo <= 1'b1;
			end
			else
				Tempo <= 1'b0;
	end
endmodule 