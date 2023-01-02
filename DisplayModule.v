//Multiplexador display

module DisplayModule (Clock, Livre, Pare, Erro, Full, Output, DigitoLigado, Ponto);
	
	input Clock, Livre, Pare, Erro, Full;
	wire ClockMetade;
	wire [3:0] valorMux;
	output [6:0] Output;
	output [3:0] DigitoLigado;
	output Ponto;
	
	FlipFlopT divideMetade (.Clock(Clock), .rstn(1'b1), .T(1'b1), .Q(ClockMetade));
	
	CaseDisplay7Segmentos case1 (.Livre(Livre), .Pare(Pare), .Erro(Erro), .Full(Full), .Clock(Clock), .ClockMetade(ClockMetade), .Output(valorMux));
	
	DigitoAceso Demux1 (.Clock(Clock), .ClockMetade(ClockMetade), .Output(DigitoLigado));
	
	DecodificadorDisplay decodificador1 (.value(valorMux), .convert(Output), .Ponto(Ponto));
endmodule 