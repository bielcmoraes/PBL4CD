module LevelToPulseMealy
(
	input	clk, data_in, reset,
	output reg data_out
);

	// Declare state register
	reg [1:0]state;
	
	// Declare states
	parameter S0 = 0, S1 = 1;
	
	// Determine the next state synchronously, based on the
	// current state and the input
	always @ (posedge clk or posedge reset) begin
		if (reset)
			state <= S0;
		else
			case (state)
				S0:
					if (data_in)
					begin
						state <= S1;
					end
					else
					begin
						state <= S0;
					end
				S1:
					if (data_in)
					begin
						state <= S1;
					end
					else
					begin
						state <= S0;
					end
			endcase
	end
	
	
	always @ (posedge clk)
	begin
		case (state)
			S0:
				if (data_in)
				begin
					data_out = 1'b1;
				end
				else
				begin
					data_out = 1'b0;
				end
			S1:
				if (data_in)
				begin
					data_out = 1'b0;
				end
				else
				begin
					data_out = 1'b0;
				end
		endcase
	end

endmodule 