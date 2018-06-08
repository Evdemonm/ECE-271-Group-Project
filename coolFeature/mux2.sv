//////////////////////////////////////////////////////////////////////////////////
// Company:        Oregon State University
// Engineer:       Austin Wilmoth
// 
// Create Date:    08/06/2016 
// Design Name:    mux2
// Module Name:    mux2
// Project Name:   Design Project
// Target Devices: MachX02
// Tool versions:  Lattice Diamond 3.7
// Description:    depending on state specific device buttons will be output
//////////////////////////////////////////////////////////////////////////////////
module mux2(input logic [4:0]nes_in,
			input logic [3:0]state,
		   output logic [4:0]nes_out);
	
	always_comb
	begin
		if(state == 1 && (nes_in < 4)) 
				nes_out = nes_in; 
		else if(state == 2 && (nes_in > 3 && nes_in < 8))
				nes_out = nes_in;
		else if(state == 0 && (nes_in > 7 && nes_in < 12))
				nes_out = nes_in;
		else
				nes_out = 12;
	end
endmodule