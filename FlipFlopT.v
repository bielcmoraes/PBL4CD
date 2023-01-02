module FlipFlopT (Clock, rstn, T, Q);

	input Clock, rstn, T;
	output reg Q;
  
  always @ (posedge Clock) begin  
    if (!rstn)  
      Q <= 0;  
    else  
        if (T)  
            Q <= ~Q;  
        else  
            Q <= Q;  
  end  
endmodule  