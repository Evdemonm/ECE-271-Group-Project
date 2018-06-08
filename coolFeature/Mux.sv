//////////////////////////////////////////////////////////////////////////////////
// Company:        Oregon State University
// Engineer:       Austin Wilmoth
// 
// Create Date:    08/06/2016 
// Design Name:    mux1
// Module Name:    mux1
// Project Name:   Design Project
// Target Devices: MachX02
// Tool versions:  Lattice Diamond 3.7
// Description:    depending on state specific device buttons will be output
//////////////////////////////////////////////////////////////////////////////////
module mux1(input logic [3:0]nes_in,
			input logic [2:0]state,
		   output logic [3:0]nes_out);
	
	always_comb
	begin
		if(state == 0 && (nes_in < 3)) 
				nes_out = nes_in; 
		else if(state == 1 && (nes_in > 2 && nes_in < 6))
				nes_out = nes_in;
		else if(state == 2 && (nes_in > 5 && nes_in < 9))
				nes_out = nes_in;
		else
				nes_out = 9;
	end
endmodule