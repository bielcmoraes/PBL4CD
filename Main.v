module Main (clock, SE, SI, Cheio, Buton, CancelaAberta, PareAzul, Display, DigitoDisplay, Ponto, CodigoErrado);
	
	input clock, SE, SI, Cheio;
	input [3:0] Buton;
	
	
	output CancelaAberta, PareAzul, CodigoErrado, Ponto;
	output [6:0] Display;
	output [3:0] DigitoDisplay;
	
	wire [3:0] Botao;
	wire ContadorGatilho, SenhaCorreta, ErroCodigo, GatilhoState, GatilhoTime;
	wire ClockMenor, PareFio;
	wire [2:0] state;
	
	Frequencia700Hz divide700 (.Pulse(clock), .view(ClockMenor));
	
	LevelToPulseMealy B0 (.clk(ClockMenor), .data_in(Buton[0]), .reset(), .data_out(Botao[0]));
	LevelToPulseMealy B1 (.clk(ClockMenor), .data_in(Buton[1]), .reset(), .data_out(Botao[1]));
	LevelToPulseMealy B2 (.clk(ClockMenor), .data_in(Buton[2]), .reset(), .data_out(Botao[2]));
	LevelToPulseMealy B3 (.clk(ClockMenor), .data_in(Buton[3]), .reset(), .data_out(Botao[3]));
	
	ControlaFluxo MEFPrincipal (.Clock(ClockMenor), .SE(SE), .SI(SI), .Full(Cheio), .Contador(ContadorGatilho), .Senha(SenhaCorreta), .reset(), .Liberado(CancelaAberta), .Pare(PareFio), .Bloqueado(Bloqueado), .state(state), .ErroSenha(ErroCodigo), .SenhaErro(CodigoErrado));
	
	and (GatilhoState, ~state[0], ~state[1], state[2]);
	and (GatilhoTime, ClockMenor, GatilhoState);
	
	ContaAte20 Tempo20s (.CLK(GatilhoState), .Tempo(ContadorGatilho));
	
	VerificaSenha VericadorSenha (.clk(ClockMenor), .b1(Botao[0]), .b2(Botao[1]), .b3(Botao[2]), .b4(Botao[3]), .reset(), .acertou(SenhaCorreta), .errou(ErroCodigo));
	
	DisplayModule Display7Seg (.Clock(ClockMenor), .Livre(CancelaAberta), .Pare(PareFio), .Erro(CodigoErrado), .Full(Cheio), .Output(Display), .DigitoLigado(DigitoDisplay), .Ponto(Ponto));
	
	FazPiscar AzulPiscando(.Sinal(PareFio), .Clk(clock), .Pulse(PareAzul));
	
endmodule 