//////////////////////////////////////////////////////////////////////////////////
// Company:        Oregon State University
// Engineer:       Austin Wilmoth
// 
// Create Date:    08/06/2016 
// Design Name:    recoder
// Module Name:    recoder
// Project Name:   Design Project
// Target Devices: MachX02
// Tool versions:  Lattice Diamond 3.7
// Description:    makes the button presse readable by the snes
//////////////////////////////////////////////////////////////////////////////////
module recoder(input  logic[3:0] button_in,
			   input  logic clk,
			   output logic[11:0] snes);
			   
	always_comb// @ (posedge clk)
	begin
		case(button_in)
			0: snes = 12'b1111_1111_1111_1111_1110;
			1: snes = 12'b1111_1111_1111_1111_1101;
			2: snes = 12'b1111_1111_1111_1111_1011;
			3: snes = 12'b1111_1111_1111_1111_0111;
			4: snes = 12'b1111_1111_1111_1110_1111;
			5: snes = 12'b1111_1111_1111_1101_1111;
			6: snes = 12'b1111_1111_1111_1011_1111;
			7: snes = 12'b1111_1111_1111_0111_1111;
			8: snes = 12'b1111_1111_1110_1111_1111;
			default: snes = 12'b1111_1111_1111_1111_1111;
		endcase
	end
endmodule
