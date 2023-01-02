module ControlaFluxo (Clock, SE, SI, Full, Contador, Senha, ErroSenha, SenhaErro, reset, Liberado, Pare, Bloqueado, state);
	
	input	Clock, SE, SI, Full, Contador, Senha, ErroSenha, reset;
	output reg Liberado, Pare, Bloqueado, SenhaErro;
	
	// Declare states
	output reg [3:0]state;
	parameter Inicial = 0, EsperandoSenha = 1, Estacionando = 2, PareImediatamente = 3, SistemaBloqueado = 4;
	
	always @ (posedge Clock or posedge reset) begin
		if (reset)
			state <= Inicial;
		else
			case (state)
				Inicial:
					if (Full)
						state <= SistemaBloqueado;
					else if (SE & ~Full)
						state <= EsperandoSenha;
					
				EsperandoSenha:
					if (Senha & ~Full)
						state <= Estacionando;
					else if (~Senha & ~Full)
						state <= EsperandoSenha;
					else if (Contador)
						state <= Inicial;
					else if (Full)
						state <= SistemaBloqueado; 
					
				Estacionando:
					if (~SE & SI)
						state <= Estacionando;
					else if (SE & SI)
						state <= PareImediatamente;
					else if (~SE & ~SI)
						state <= Inicial;
					
				PareImediatamente:
					if (SE & SI)
						state <= PareImediatamente;
					else
						state <= Inicial;
				
				SistemaBloqueado:
					if (Full)
						state <= SistemaBloqueado;
					else if (~Full)
						state <= Inicial;
				
				default:
					state <= Inicial;
					
			endcase
	end
	
	//SAÍDAS
	always @ (posedge Clock)
	begin
	
	Liberado = 1'b0; 
	Pare = 1'b0;  
	Bloqueado = 1'b0;
	
		case (state)
			Inicial:
				if (Full)
				begin
					Liberado = 1'b0; 
					Pare = 1'b0;  
					Bloqueado = 1'b1;
					SenhaErro = 1'b0;
				end
				
			EsperandoSenha:
				if (Full)
				begin
					Liberado = 1'b0; 
					Pare = 1'b0;  
					Bloqueado = 1'b1;
					SenhaErro = 1'b0;
				end
				else if (Senha)
				begin
					Liberado = 1'b0; 
					Pare = 1'b0;  
					Bloqueado = 1'b0;
					SenhaErro = 1'b0;
				end
				else if (~Senha & ErroSenha)
				begin
					Liberado = 1'b0; 
					Pare = 1'b0;  
					Bloqueado = 1'b0;
					SenhaErro = 1'b1;
				end
				
			Estacionando:
				if (~SE & ~SI)
				begin
					Liberado = 1'b1; 
					Pare = 1'b0;  
					Bloqueado = 1'b0;
				end
				else if (SI & SE)
				begin
					Liberado = 1'b0; 
					Pare = 1'b1;  
					Bloqueado = 1'b0;
				end
				else if (Senha)
				begin
					Liberado = 1'b1; 
					Pare = 1'b0;  
					Bloqueado = 1'b0;
				end
				else
					Liberado = 1'b1;
				
				
			PareImediatamente:
				if (SI & SE)
				begin
					Liberado = 1'b1; 
					Pare = 1'b1;  
					Bloqueado = 1'b0;
				end
				
			SistemaBloqueado:
				if (Full)
				begin
					Liberado = 1'b0; 
					Pare = 1'b0;  
					Bloqueado = 1'b1;
				end
		
		default:
		begin
			Liberado = 1'b0; 
			Pare = 1'b0;  
			Bloqueado = 1'b0;
		end
		
		endcase
		
	end
	
endmodule