module teste1 (CLK, SE, SI, Full, Contador, Senha, reset, Liberado, Pare, Bloqueado, state);
	
	input CLK, SE, SI, Full, Contador, Senha, reset;
	output Liberado, Pare, Bloqueado;
	wire clk;
	output [3:0] state;
	
	Frequencia700Hz (.Pulse(CLK), .View(clk));

	ControlaFluxo (.CLK(clk), .SE(CLK), .SI(SI), .Full(Full), .Contador(Contador), .Senha(Senha), .reset(reset), .Liberado(Liberado), .Pare(Pare), .Bloqueado(Bloqueado));



endmodule 