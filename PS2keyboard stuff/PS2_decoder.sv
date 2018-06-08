//////////////////////////////////////////////////////////////////////////////////
// Company:        Oregon State University
// Engineer:       Austin Wilmoth
// 
// Create Date:    08/06/2016 
// Design Name:    PS/2 Decoder
// Module Name:    PS2_decoder
// Project Name:   Design Project
// Target Devices: MachX02
// Tool versions:  Lattice Diamond 3.7
// Description:    This converts the 11 bit code sent by the PS/2 keyboard into a
//				   4 bit code to make it easer to understand in other modules
//////////////////////////////////////////////////////////////////////////////////
module PS2_decoder(input  logic [10:0] code, 
				  input  logic en,
				  
				  output logic reset,
				  output logic [3:0] value);
	always_comb
	begin
		value = 9;
		if(en) begin //enabled when counter is done
			case(code)
				11'b0_0011_1000_01:	value = 0;//a //0000
				11'b0_1100_0100_01: value = 1;//d //0001
				11'b0_0010_0100_11: value = 2;//e //0010
				11'b0_1101_0100_11: value = 3;//f //0011
				11'b0_0010_1100_01: value = 4;//g //0100
				11'b0_1011_0100_11: value = 5;//r //0101
				11'b0_1101_1000_11: value = 6;//s //0110
				11'b0_0011_0100_01: value = 7;//t //0111
				11'b0_1011_1000_11: value = 8;//w //1000
				default: value = 9;
			endcase
		end
	end
	
	
endmodule
