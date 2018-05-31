module mux1(input logic [4:0]nes_in,
			input logic [3:0]state,
		   output logic [4:0]nes_out);
	
	always_comb
	begin
	if(state == 1 && (nes_in < 4)) 
				assign nes_out = nes_in; 
	else if(state == 2 && (nes_in > 3 && nes_in < 8))
			assign nes_out = nes_in;
	else if(state == 3 && (nes_in > 7 && nes_in < 12))
			assign nes_out = nes_in;
	else
			assign nes_out = 12;
	end
endmodule