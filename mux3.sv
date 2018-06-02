module mux3(input logic [4:0]nes_in,
			input logic [3:0]state,
		   output logic [4:0]nes_out);
	
	always_comb
	begin
	if(state == 3 && (nes_in < 4)) 
			nes_out = nes_in; 
	else if(state == 1 && (nes_in > 3 && nes_in < 8))
			nes_out = nes_in;
	else if(state == 2 && (nes_in > 7 && nes_in < 12))
			nes_out = nes_in;
	else
			nes_out = 12;
	end
endmodule