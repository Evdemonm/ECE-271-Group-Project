module test_Top(input  logic PS2_data,
				input  logic PS2_reset,
				input  logic PS2_clk,
				output logic [3:0] value);
	
	logic clk;		//used for the oscillator's 2.08 MHz clock
	logic clk_slow;	//used for slowed down, 5 Hz clock???
	
	logic [10:0]code;
	
	shiftreg PS2shift(
		.clk(PS2_clk),
		.reset(PS2_reset),
		.serial_data_in(PS2_data),
		
		.parallel_data_out(code)
	);
	
	PS2Decoder decode(
		.code(code),
		.clk(clk),
		.en(clk_slow),
		
		.reset(PS2_reset),
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
			.clk_i(PS2_clk),
			.reset_n(PS2_reset),
			
			.clk_o(clk_slow)
		);
endmodule