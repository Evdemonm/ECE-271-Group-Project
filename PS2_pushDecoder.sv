//////////////////////////////////////////////////////////////////////////////////
// Company:        Oregon State University
// Engineer:       Austin Wilmoth
// 
// Create Date:    08/06/2016 
// Design Name:    PS/2 hold Decoder
// Module Name:    PS2_holdDecoder
// Project Name:   Design Project
// Target Devices: MachX02
// Tool versions:  Lattice Diamond 3.7
// Description:    This converts the 11 bit code sent by the PS/2 keyboard into a
//				   4 bit code to make it easer to understand in other modules
//////////////////////////////////////////////////////////////////////////////////
module PS2_holdDecoder(input  logic [10:0] code, 
				  input  logic en,
				  input  logic value_in,
				  
				  output logic reset,
				  output logic [3:0] value);
	always_comb
	begin
		value = 9;
		if(en) begin //enabled when counter is done
			case(code)
				55'b0001_1100_0010_0011_1000_0100_0111_0000_1000_1110_0001_0001_1100_001: value = value_in;
				default: value = 9;
			endcase
		end
	end
	
	
endmodule
