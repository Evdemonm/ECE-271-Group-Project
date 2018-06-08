module buttonState(            input slowCLK,
            output [2:0] State );

      logic [2:0] ST = 2;
      
			
 always_ff @ (posedge slowCLK)
      begin
		 if(ST == 2)
            ST <= 0;
		 else if(ST == 0)
			 ST <= 1;
         else
            ST <= 2;
	  end

     assign State = ST; 
	 
  endmodule
