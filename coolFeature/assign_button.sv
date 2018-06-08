//////////////////////////////////////////////////////////////////////////////////
// Company:        Oregon State University
// Engineer:       Austin Wilmoth
// 
// Create Date:    08/06/2016 
// Design Name:    assign buttons
// Module Name:    assign_buttons
// Project Name:   Design Project
// Target Devices: MachX02
// Tool versions:  Lattice Diamond 3.7
// Description:    tells which button will be output to the snes
//////////////////////////////////////////////////////////////////////////////////
module assign_button(input  logic[3:0] button_board,
					 input  logic[3:0] PS2_keyboard,
			         input  logic[3:0] IR_controller,
			         output logic[3:0] button_press);
		
	always_comb
		begin
			if(!(PS2_keyboard-IR_controller))
				button_press = button_board;
			else if(!(button_board-IR_controller))
				button_press = PS2_keyboard;
			else if(!(button_board-PS2_keyboard))
				button_press = IR_controller;
		end
endmodule