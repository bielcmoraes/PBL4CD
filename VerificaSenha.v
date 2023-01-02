module VerificaSenha
(
	input	clk, b1, b2, b3, b4, reset,
	output reg acertou, errou
);

	reg [1:0]state;
	
	// Declare states
	parameter S0 = 0, S1 = 1, S2 = 2, S3 = 3;
	
	always @ (posedge clk or posedge reset) begin
		if (reset)
			state <= S0;
		else
			case (state)
				S0:
					if (b1)
						state <= S1;
					else
						state <= S0;
				S1:
					if (b2)
						state <= S2;
					else if (~b1 & ~b2 & ~b3 & ~b4)
						state <= S1;
					else
						state <= S0;
				S2:
					if (b3)
						state <= S3;
					else if (~b1 & ~b2 & ~b3 & ~b4)
						state <= S2;
					else
						state <= S0;
				S3:
					if (b4)
						state <= S0;
					else if (~b1 & ~b2 & ~b3 & ~b4)
						state <= S3;
					else
						state <= S0;
			endcase
	end
	
	always @ (posedge clk)
	begin
		case (state)
			S0:
				if (~b1 & (b2 | b3 | b4))
				begin
					acertou = 1'b0;
					errou = 1'b1;
				end
				else if (b1 & ~b2 & ~b3 & ~b4)
				begin
					acertou = 1'b0;
					errou = 1'b0;
				end
				else
				begin
					errou = 1'b0;
					acertou = 1'b0;
				end
			S1:
				if (~b2 & (b1 | b3 | b4))
				begin
					acertou = 1'b0;
					errou = 1'b1;
				end
				else if (b2 & ~b1 & ~b3 & ~b4)
				begin
					acertou = 1'b0;
					errou = 1'b0;
				end
				else
				begin
					errou = 1'b0;
					acertou = 1'b0;
				end
			S2:
				if (~b3 & (b1 | b2 | b4))
				begin
					acertou = 1'b0;
					errou = 1'b1;
				end
				else if (b3 & ~b1 & ~b2 & ~b4)
				begin
					acertou = 1'b0;
					errou = 1'b0;
				end
				else
				begin
					errou = 1'b0;
					acertou = 1'b0;
				end
			S3:
				if (~b4 & (b1 | b2 | b3))
				begin
					acertou = 1'b0;
					errou = 1'b1;
				end
				else if (b4 & ~b1 & ~b2 & ~b3)
				begin
					acertou = 1'b1; // Sequencia de senha correta
					errou = 1'b0;
				end
				else
				begin
					errou = 1'b0;
					acertou = 1'b0;
				end
		endcase
	end

endmodule 