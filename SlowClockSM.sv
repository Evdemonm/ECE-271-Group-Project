module slowclock( input logic clk,
				     input logic reset,
					 
					 output logic flip);
	
	    logic [19:0] Timer;
			   

        always_ff @ (posedge clk, negedge reset)
			begin
				Timer <= Timer + 1;	
				if(!reset) 
					begin
						flip <= 0;
						Timer <= 0;
					end
				else
					if(Timer >= 1040) 
						begin
							flip <= ~flip;	
							Timer <= 0;			
						end
			end


endmodule 