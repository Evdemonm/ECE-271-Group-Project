module clock_counter(
	input logic [10:0] Data_i,
    input logic clock                    
	output [10:0] logic Data_o);
         
        logic Value[10:0]

		always_ff @ (negedge clock)
			begin
				 Value <= Data;
			end
			
			
	    assign Data_o = Value;
endmodule
