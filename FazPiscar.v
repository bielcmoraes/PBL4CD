module FazPiscar (Sinal, Clk, Pulse);

	input Sinal, Clk;
	output Pulse;
	wire ClkReduzido;
	
	Frequencia1S Periodo1S (.Pulse(Clk), .view(ClkReduzido));
	
	and(Pulse, ClkReduzido, Sinal);

endmodule 