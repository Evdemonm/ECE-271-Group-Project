//////////////////////////////////////////////////////////////////////////////////
// Company:        Oregon State University
// Engineer:       Austin Wilmoth
// 
// Create Date:    08/06/2016 
// Design Name:    PS/2 hold shift register
// Module Name:    PS2_holdSshiftreg
// Project Name:   Design Project
// Target Devices: MachX02
// Tool versions:  Lattice Diamond 3.7
// Description:    This takes in each bit sent by the PS/2 keyboard in serial and
//				   and converts it to a parallel code.
//////////////////////////////////////////////////////////////////////////////////
module PS2_holdShiftreg(input  logic clk,
				input  logic reset, 
				input  logic serial_data_in,
				
				output logic [54:0] parallel_data_out);

always @ ( posedge clk or negedge reset)
	begin
	  if (!reset) 
		begin
			parallel_data_out <= 55'b0;
		end
	  else  
		 parallel_data_out[54:0] <= {parallel_data_out[53:0],serial_data_in};
	end
endmodule