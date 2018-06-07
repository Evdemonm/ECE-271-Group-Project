module statemachine(
                                input logic clk,
				input logic reset,
				input logic DONE,
				input logic read,
                                input logic ERROR,				
				output logic FINISH,
				output logic Idlereset
 );
       
 
 enum logic [1:0]{
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
			 
		 case(sm_ps)
	
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
		  assign FINISH = (1);
		  assign Idlereset = (sm_ps == IDLE);
 endmodule

/*
logic [1:0] currentstate;

always_ff @ (posedge clk, negedge reset)
      begin
		 if(~reset)
            currentstate <= 2'b00;
         else
            currentstate <= currentstate+1;
	  end

always_comb
         begin	
			 
		 case(currentstate)
	
			 2'b00:  
			     if(read == 1)
					 currentstate = 2'b01;
			     else
					 currentstate = 2'b00;
					 
			 2'b01:      
                             if(DONE == 1)
                                 currentstate = 2'b10;
	                     else if(ERROR == 1)
	 	                currentstate = 2'b00;
                             else					 
			         currentstate = 2'b01; 
		         2'b10:
			     currentstate = 2'b00;
			 
			 2'b11:
			     currentstate = 2'b00;
				
			 default:
                             currentstate = 2'b00;			 

			 endcase	     
	      end
 endmodule
*/