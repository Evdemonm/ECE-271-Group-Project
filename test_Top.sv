module test_Top(input  logic PS2_data,
				input  logic reset_n,
				input  logic test_clk,
				output logic [3:0] value);
	
	logic clk;
	logic slow_clk;
	logic PS2_counter;
	logic state_reset;
	logic count_done;
	
	logic [10:0]code;
	
	shiftreg PS2shift(
		.clk(test_clk),//slow_clk),
		.reset(reset_n),
		.serial_data_in(PS2_data),
		
		.parallel_data_out(code)
	);
	
	PS2Decoder decode(
		.code(code),
		//.clk(clk),
		.en(count_done),
		
		.reset(reset_n),
		.value(value)
	);
	
	
	PS2_state state(
		.PS2_data(PS2_data),
		.clk(test_clk),//slow_clk),
		.reset(reset_n),
		.count_done(count_done),
		
		.reset_out(state_reset)
	);
	
	
	OSCH #("14.78"/*"2.08"*/) osc_int (
			.STDBY(1'b0),			
			
			.OSC(clk),				
			.SEDSTDBY()
		);			
		
		PS2_clock clock(
			.clk_i(test_clk),
			.reset_n(reset_n),
			
			.clk_o(slow_clk)
		);
		
		
		clock_counter shift_counter(
			.clk_i(test_clk),//slow_clk),
			.reset_n(state_reset),
			
			.count_done(count_done),
			.clk_o(PS2_counter)
		);
endmodule