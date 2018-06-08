//////////////////////////////////////////////////////////////////////////////////
// Company:        Oregon State University
// Engineer:       Austin Wilmoth
// 
// Create Date:    08/06/2016 
// Design Name:    PS2 hold counter
// Module Name:    PS2_holdcounter
// Project Name:   Design Project
// Target Devices: MachX02
// Tool versions:  Lattice Diamond 3.7
// Description:    This counts each bit that is coming in from the PS/2 keyboard if
//  			   it is detected that the key is held
//////////////////////////////////////////////////////////////////////////////////
module PS2_holdCounter(input  logic clk_i,		
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
					if(count >= 53)
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
