module shiftregIR(
                input  logic IR,
				input  logic reset, 
				input  logic serial_data_in,
				output logic [31:0] parallel_data_out);

always @ ( negedge IR , negedge reset)
	begin
	  if (!reset) 
		begin
			parallel_data_out <= 32'b0;
		end
	  else  
		 parallel_data_out[31:0] <= {parallel_data_out[30:0],serial_data_in};
	end
	
	
	
	
	
endmodule