module shiftreg(input  logic clk,
				input  logic reset, 
				input  logic serial_data_in,
				
				output logic [10:0] parallel_data_out);

always @ ( posedge clk or negedge reset)
	begin
	  if (!reset) 
		begin
			parallel_data_out <= 11'b1;
		end
	  else  
		 parallel_data_out[10:0] <= {parallel_data_out[9:0],serial_data_in};
	end
endmodule