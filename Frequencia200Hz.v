module Frequencia200Hz (Pulse, Fdividida);

	input Pulse; // input clock on FPGA
	output reg Fdividida; // output clock after dividing the input clock by divisor
	reg[27:0] counter=28'd0;
	parameter DIVISOR = 28'd250000;
	
	always @(posedge Pulse)
	begin
	 counter <= counter + 28'd1;
	 if(counter>=(DIVISOR-1))
		counter <= 28'd0;
		Fdividida <= (counter<DIVISOR/2)?1'b1:1'b0;
	end
endmodule 