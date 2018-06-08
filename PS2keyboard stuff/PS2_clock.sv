//////////////////////////////////////////////////////////////////////////////////
// Company:        Oregon State University
// Engineer:       Austin Wilmoth
// 
// Create Date:    08/06/2016 
// Design Name:    PS2 clock divider
// Module Name:    PS2_clock
// Project Name:   Design Project
// Target Devices: MachX02
// Tool versions:  Lattice Diamond 3.7
// Description:    Slows the FPGA clock  lattice in the fpga down from 14.78Mhz to
//                 14.78kHz to be able to read the PS2 keyboard data
//////////////////////////////////////////////////////////////////////////////////
module PS2_clock(input  logic clk_i,		
				 input  logic reset_n,	
	
				 output logic clk_o);
		
		logic [13:0] count;	
		
		always_ff @ (posedge clk_i, negedge reset_n)			
			begin
				count <= count + 1;
				if(!reset_n)
					begin
						clk_o <= 0;
						count <= 0;
					end
				else
					if(count >= 1000)//slows by 1000hz 
						begin		
							clk_o <= ~clk_o;
							count <= 0;
						end
			end
endmodule
