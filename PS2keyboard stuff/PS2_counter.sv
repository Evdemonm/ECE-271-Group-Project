//////////////////////////////////////////////////////////////////////////////////
// Company:        Oregon State University
// Engineer:       Austin Wilmoth
// 
// Create Date:    08/06/2016 
// Design Name:    PS2 counter
// Module Name:    PS2_counter
// Project Name:   Design Project
// Target Devices: MachX02
// Tool versions:  Lattice Diamond 3.7
// Description:    This counts each bit that is coming in from the PS/2 keyboard up
//  			   to 10 and then sends a done signal to switch the state
//////////////////////////////////////////////////////////////////////////////////
module PS2_counter(input  logic clk_i,		
					 input  logic reset_n,	
	
					 output logic count_done);
		
		logic [3:0] count;
		
		always_ff @ (negedge clk_i, negedge reset_n)			
			begin
				count <= count + 1;
				if(!reset_n)
					begin
						count <= 0;
					end
				else
					if(count >= 9)
						begin	
							count_done = 1;//sends out to switch out or reading state
							count <= 0;
						end
					else 
						begin
							count_done = 0;
						end
			end
endmodule
