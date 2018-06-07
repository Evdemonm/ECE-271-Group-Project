module bitCounter ( input logic reset,
                input logic IR,
				
				output logic DONE);
                
				logic [31:0] Count = 0;

      always_ff @ (posedge IR, negedge reset) 
		 begin
          if(~reset)
		     begin 
	     	    Count <= 0;
		     end
		  else if(Count == 32)
			   Count <= 0;
		  
		  else
			  Count <= Count + 1;
			 
		end
		
		assign DONE =(count == 32); // send to sm
			
	endmodule

