//////////////////////////////////////////////////////////////////////////////////
// Company:        Oregon State University
// Engineer:       Austin Wilmoth
// 
// Create Date:    08/06/2016 
// Design Name:    button board decoder
// Module Name:    buttonBoard_decoder
// Project Name:   Design Project
// Target Devices: MachX02
// Tool versions:  Lattice Diamond 3.7
// Description:    makes each button on the button board register as a diferent value
//////////////////////////////////////////////////////////////////////////////////
module buttonBoard_decoder (input  logic [7:0] buttons,
							output logic [3:0] value);
	always_comb
		case(buttons)
			8'b0000_0001: value = 0;
			8'b0000_0010: value = 1;
			8'b0000_0100: value = 2;
			8'b0000_1000: value = 3;
			8'b0001_0000: value = 4;
			8'b0010_0000: value = 5;
			8'b0100_0000: value = 6;
			8'b1000_0000: value = 7;
			8'b1000_0001: value = 8;
		default: value = 9;
	endcase
endmodule
