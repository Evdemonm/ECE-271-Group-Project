module PS2_state(input  logic PS2_data,
				 input  logic clk,
				 input  logic reset,
				 input  logic count_done,
				 
				 output logic reset_out);
	typedef enum logic {S0,S1} statetype;
	statetype state, nextstate;
		
	always_ff @(negedge clk, posedge reset) begin
			if(reset) state <= S0; 
			else  state <= nextstate;
			
	end
			
	always_comb begin 
		case(state)
			S0: if(PS2_data == 0) begin
					reset_out = 1;
					nextstate <= S1;
				end else begin
					nextstate <= S0;
					reset_out = 0;
				end
			S1: if(count_done) begin
					nextstate <= S0;
				end else begin
					nextstate <= S1;
				end
			default: nextstate <= S0;
		endcase
		end
	
endmodule