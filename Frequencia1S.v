module Frequencia1S (Pulse, view);

	input Pulse; // input clock on FPGA
	output reg view; // output clock after dividing the input clock by divisor
	reg[27:0] counter=28'd0;
	parameter DIVISOR = 28'd100000000; //Divide a frequencia para 0,05 Hz
	
	always @(posedge Pulse)
	begin
	 counter <= counter + 28'd1;
	 if(counter>=(DIVISOR-1))
		counter <= 28'd0;
		view <= (counter<DIVISOR/2)?1'b1:1'b0;
	end
endmodule 