module SMCounter ( input logic clk,
                input logic IR,
				
				output logic read,
				output logic data,
				output logic error);
                
				logic [31:0] Count;

      always_ff @ (posedge clk, negedge IR) //slow clock sometime in the future
		 begin
          if(~IR) 
	     	   Count <= 0;
		  else if( Count == 2147483647)
			  Count <= 0;
		  else
			  Count <= Count + 1;
			 
		end
	    
		assign data = (Count> 1000); // decide pulse, send to shift
		assign read = (Count> 1800); // send to sm
		assign error = (Count> 177127); //LONG RESET
    	
			
	endmodule
	
	
