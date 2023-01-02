module MEFprincipal (CLK, SE, SI, Full, Time, Senha, reset, Liberado, Pare, Bloqueado, GatilhoContador);
	
	input	CLK, SE, SI, Full, Time, Senha, reset;
	output reg Liberado, Pare, Bloqueado, GatilhoContador;
	
	// Declare states
	reg [3:0]state;
	parameter Inicial = 0, EsperandoSenha = 1, Estacionando = 2, PareImediatamente = 3, SistemaBloqueado = 4;
	
	always @ (posedge CLK or posedge reset) begin
		if (reset)
			state <= Inicial;
		else
			case (state)
				Inicial:
					if (Full)
						state <= SistemaBloqueado;
					else if (SE)
						state <= EsperandoSenha;
					else if (SE & SI)
						state <= PareImediatamente;
					
				EsperandoSenha:
					if (Full)
						state <= SistemaBloqueado;
					else if (Time)
						state <= Inicial;
					else if (Senha)
						state <= Estacionando;
					
				Estacionando:
					if (~SI)
						state <= Inicial;
					
				PareImediatamente:
					if (~SI)
						state <= Inicial;
				
				SistemaBloqueado:
					 if (~Full)
						state <= Inicial;
				
				default:
					state <= Inicial;
					
			endcase
	end
	
	//SAÍDAS
	always @ (posedge CLK)
	begin
	
		Liberado = 1'b0; 
		Pare = 1'b0;  
		Bloqueado = 1'b0;
		case (state)
			Inicial:
				if (Full)
				begin
					Bloqueado = 1'b1;
				end
				
			EsperandoSenha:
				GatilhoContador = 1'b1;
				if (Full)
				begin 
					Bloqueado = 1'b1;
				end
				else if (Senha)
				begin
					Liberado = 1'b1; 
				end
				
			Estacionando:
				if (SI & SE)
				begin
					Liberado = 1'b1; 
				end
				else if (SI)
				begin
					Liberado = 1'b1; 
				end 
				
			PareImediatamente:
				if (SI & SE)
				begin
					Pare = 1'b1; 
				end
				
			SistemaBloqueado:
				if (Full)
				begin  
					Bloqueado = 1'b1;
				end
		
		endcase
		
	end
	
endmodule 


				 
			