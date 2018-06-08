module SMCounter ( input logic clk,
                input logic IR,
				
				output logic read,
				output logic data,
				output logic error);
                
				logic [64:0] Count;

      always_ff @ (posedge clk, negedge IR) 
		 begin
          if(~IR) 
	     	   Count <= 0;
		  else if( Count == 10000)
			  Count <= Count;
		  else
			  Count <= Count + 1;
			 
		end
	    
		assign data = (Count> 1500); // decide pulse, send to shift
		assign read = (Count> 8800); // send to sm
		assign error = (Count == 10000); //LONG RESET
    	
			
	endmodule
	
	
