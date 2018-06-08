module bitCounter ( input logic reset,
                input logic IR,
				input logic Idlereset,
				
				output logic DONE);
                
				logic [31:0] Count = 0;

      always_ff @ (posedge IR, negedge reset) 
		 begin
          if(~reset)
	     	    Count <= 0;
		  else if(Count == 32 || Idlereset == 1)
			   Count <= 0;
		  
		  else
			  Count <= Count + 1;
			 
		end
		
		assign DONE =(Count == 32); // send to sm
			
	endmodule

