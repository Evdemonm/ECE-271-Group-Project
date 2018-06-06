module test_Top(input  logic PS2Keyboard,
				input  logic reset_n,
				input  logic test_clk,
				output logic [3:0] value);
	
	logic clk;		//used for the oscillator's 2.08 MHz clock
	logic clk_slow;	//used for slowed down, 5 Hz clock???
	
	logic [10:0]code;
	logic reset_shift;
	logic reset_shift_2;
	
	shiftreg PS2shift(
		.clk(test_clk),
		.reset(reset_n),
		.serial_data_in(PS2Keyboard),
		
		//.reset_out(reset_shift_2),
		.parallel_data_out(code)
	);
	
	/*shiftreg#(11) PS2shift(
		.clk(clk_slow),
		.reset(n_reset),
		//.load(), 
		.sin(PS2Keyboard),
		//.d(code),
		
		.q(code)//,
		//.sout()
	);*/
	
	PS2Decoder decode(
		.code(code),
		.clk(clk),
		//.reset_2(reset_shift_2),
		
		.reset(),
		.value(value)
	);
	
	
	
	//This is an instance of a special, built in module that accesses our chip's oscillator
		OSCH #("2.08") osc_int (	//"2.08" specifies the operating frequency, 2.08 MHz.
									//Other clock frequencies can be found in the MachX02's documentation
			.STDBY(1'b0),			
			.OSC(clk),				
			.SEDSTDBY()
		);			
			
		//slows the clock to what ever speed we need
		clock_counter counter_1(
			.clk_i(clk),
			.reset_n(reset_n),
			
			.clk_o(clk_slow)
		);
endmodule