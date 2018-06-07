module statemachine(
                input logic clk,
				input logic reset,
				input logic DONE,
				input logic read,
                input logic ERROR,				
				output logic FINISH
 );
       
 
 typedef enum{
   IDLE = 2'b00,
   READ = 2'b01,
   END = 2'b10,
   NA = 2'b11
 } sm_ps, sm_ns;
 
 
 always_ff @ (posedge clk, negedge reset)
      begin
		 if(~reset)
            sm_ps <= IDLE;
         else
            sm_ps <= sm_ns;
	  end

always_comb
         begin	
			 
		 case(ps_state)
	
			 IDLE:  
			     if(read == 1)
					 sm_ns = READ;
			     else
					 sm_ns = IDLE;
					 
			 READ:      
                  if(DONE == 1)
                     sm_ns = END;
			      else if(ERROR == 1)
					 sm_ns = IDLE;
                  else					 
			         sm_ns = READ; 
		     END:
			     sm_ns = IDLE;
			 
			 NA:
			    sm_ns = IDLE;
				
			 default:
                sm_ns = IDLE;			 

			 endcase	     
	      end
 endmodule
