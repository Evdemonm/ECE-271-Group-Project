//////////////////////////////////////////////////////////////////////////////////
// Company:        Oregon State University
// Engineer:       Austin Wilmoth
// 
// Create Date:    08/06/2016 
// Design Name:    state machine PS/2
// Module Name:    PS2_stateMachine
// Project Name:   Design Project
// Target Devices: MachX02
// Tool versions:  Lattice Diamond 3.7
// Description:    This first looks for a 0 which is the starting value and once
// 				   it finds a 0 it starts taking in the PS/2 code.
//////////////////////////////////////////////////////////////////////////////////
module PS2_stateMachine(input  logic PS2_data,
				 input  logic clk,
				 input  logic reset,
				 input  logic count_done,
				 
				 output logic reset_out);
				 
	typedef enum logic [1:0] {S0,S1} statetype;
	statetype [1:0] state, nextstate;
		
	always_ff @(negedge clk, posedge reset) begin
			if(reset) state <= S0; 
			else  state <= nextstate;
			
	end
			
	always_comb begin 
		case(state)
			//looking for a 0
			S0: if(PS2_data == 0) begin
					reset_out = 0;
					nextstate <= S1;
				end else begin
					nextstate <= S0;
					reset_out = 1;
				end
			//reading in values
			S1: if(count_done) begin
					nextstate <= S0;
					reset_out = 0;
				end else begin
					nextstate <= S1;
					reset_out = 1;
				end
			default: nextstate <= S0;
		endcase
	end
	
endmodule