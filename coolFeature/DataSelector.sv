module dataSelector( input logic [3:0] IR
                     input logic [3:0] PS,
					 input logic [3:0] BT,
					 input logic [2:0] Sel,
					  
					  output logic [3:0] D);

    always_comb
	     begin
			 case(Sel)
		     
			 0: D = BT;
			 
			 1: D = PS;
			 
			 2: D = IR;
			 
			 default: D = 4; 

        endcase


endmodule