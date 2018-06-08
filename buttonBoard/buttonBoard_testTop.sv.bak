//////////////////////////////////////////////////////////////////////////////////
// Company:        Oregon State University
// Engineer:       Austin Wilmoth
// 
// Create Date:    08/06/2016 
// Design Name:    N/A
// Module Name:    buttonboard_testTop
// Project Name:   Design Project
// Target Devices: MachX02
// Tool versions:  Lattice Diamond 3.7
// Description:    This is used to simulate that the button board is properly
//				   decoded.
//////////////////////////////////////////////////////////////////////////////////
module PS2_testTop(input [7:0] buttonBoard,
				   input  logic reset_n,
				   input  logic test_clk,
				
	    			//output logic [3:0] value
				   output logic [11:0] snes_out);
	
	logic clk;
//	logic slow_clk;
	logic clock_snes;
//	logic state_reset;
//	logic count_done;
	logic [3:0]value;
	
//	logic [10:0]code;
	
	buttonBoard_decoder decodeB(
		.buttons(buttonBoard),
		.value(value)
	);
	
	//serial to parallel converter
/*	PS2_shiftreg shift(
		.clk(test_clk),//slow_clk),
		.reset(reset_n),
		.serial_data_in(PS2_data),
		
		.parallel_data_out(code)
	);
	
	//makes the codes more managable
	PS2_decoder decode(
		.code(code),
		.en(count_done),
		
		.value(value)
	);
	
	//switches between looking for 0 and reading state
	PS2_stateMachine state(
		.PS2_data(PS2_data),
		.clk(test_clk),//slow_clk),
		.reset(reset_n),
		.count_done(count_done),
		
		.reset_out(state_reset)
	);
	*/
	recoder snes(
		.button_in(value),
		.clk(test_clk),//clock_snes
		.snes(snes_out)
	);
	
	//FPGA oscillator set at 2.08MHZ
	OSCH #("2.08") osc_int (
			.STDBY(1'b0),			
			
			.OSC(clk),				
			.SEDSTDBY()
	);			
	
	//slows the clock to 13KHz
/*	PS2_clock clock(
		.clk_i(test_clk),//clk;
		.reset_n(reset_n),
			
		.clk_o(slow_clk)
	);
		
	//counts for each clock cycle reading data
	PS2_counter count(
		.clk_i(test_clk),//slow_clk),
		.reset_n(state_reset),
			
		.count_done(count_done)
	);
	*/
	snes_clock sclock(
		.clk_i(test_clk),//clk
		.reset_n(reset_n),
		
		.clk_o(clock_snes)		
	);



endmodule