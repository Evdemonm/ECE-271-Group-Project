module clock_counter(
	input logic clk_i,		
	input logic reset_n,	
	
	output logic count_done,
	output logic clk_o);
		
		logic [3:0] count;
		
		always_ff @ (negedge clk_i, negedge reset_n)			
			begin
				count <= count + 1;
				if(!reset_n)
					begin
						count_done = 1;
						clk_o <= 0;
						count <= 0;
					end
				else
					if(count >= 10)
						begin	
							count_done = 1;
							clk_o <= ~clk_o;
							count <= 0;
						end
			end
endmodule
