module DataOutIR(
                input logic clk,
                input logic reset,
				input logic [31:0] datain,
				input logic FINISH,
				
				output logic [31:0] dataout);
	
	
    always_ff(posedge clk, negedge reset)
	    begin
        if(~reset)
           		dataout <= 0;
        else if(FINISH == 1)
                dataout<= datain;
        else
                dataout <= dataout;			
		end	
			
			
endmodule 