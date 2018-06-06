/*module shiftreg#(parameter N = 11)
				(input 	logic clk,
				 input 	logic reset,// load, 
				 input 	logic sin,
				 //input 	logic [N-1:0] d,
				 output logic [N-1:0] q//,
				 output logic sout);
	always_ff@(posedge clk, posedge reset)
		if (reset)		q <= 0;
		//else if (load)	q <= d;
		else			q <= {q[N-2:0], sin};
		
	//assign sout = q[N-1];
endmodule
*/
module shiftreg(input  logic clk,
				input  logic reset, 
				input  logic serial_data_in,
				//output logic reset_out,
				output logic [10:0] parallel_data_out);

always @ ( posedge clk or negedge reset)
	begin
	  if (!reset) 
		begin
			parallel_data_out <= 11'b0;
			//reset_out = 1;
		end
	  else  
		 parallel_data_out[10:0] <= {parallel_data_out[9:0],serial_data_in};
	end
endmodule