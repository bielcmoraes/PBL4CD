//Seleleciona qual digito do display está acesso.

module DigitoAceso (Clock, ClockMetade, Output);

	input Clock, ClockMetade;
	output reg [3:0] Output;
	
	always @(*) begin
	
		Output[0] = 1'b1;
		Output[1] = 1'b1;
		Output[2] = 1'b1;
		Output[3] = 1'b1;
		
		case ({Clock, ClockMetade})
			2'b00: Output[0] <= 1'b0;
			2'b01: Output[1] <= 1'b0;
			2'b10: Output[2] <= 1'b0;
			2'b11: Output[3] <= 1'b0;
		endcase
		
	end
endmodule 