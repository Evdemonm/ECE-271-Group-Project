//////////////////////////////////////////////////////////////////////////////////
// Company:        Oregon State University
// Engineer:       Austin Wilmoth
// 
// Create Date:    08/06/2016 
// Design Name:    N/A
// Module Name:    PS2_testTop
// Project Name:   Design Project
// Target Devices: MachX02
// Tool versions:  Lattice Diamond 3.7
// Description:    This is used to simulate that the PS/2 keyboard is properly
//				   decoded.
//////////////////////////////////////////////////////////////////////////////////
module Top_Level(input  logic PS2_data,
				input logic IR,
				input  logic reset_n,
				input  logic test_clk,
				input [7:0] buttonBoard,
				
				//output logic [3:0] value
				output logic [11:0] snes_out);
	
	//logic clk;
	logic slow_clk;
	logic clock_snes;
	logic state_reset;
	logic count_done;
	logic [3:0]value1;
	logic [3:0]value2;
	logic [3:0]value3;
	logic [3:0]snes_out;
	
	logic [10:0]code;
	
	//serial to parallel converter
	PS2_shiftreg shift(
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
	
	/*recoder snes(
		.button_in(snes_in),
		.clk(test_clk),//clock_snes
		.snes(snes_out)
	);*/
	
	//FPGA oscillator set at 2.08MHZ
	OSCH #("2.08") osc_int (
			.STDBY(1'b0),			
			
			.OSC(clk),				
			.SEDSTDBY()
	);			
	
	//slows the clock to 13KHz
	PS2_clock clock(
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
	snes_clock sclock(
		.clk_i(test_clk),//clk
		.reset_n(reset_n),
		
		.clk_o(clock_snes)		
	);


//IR

	 logic read;
     logic error;
     logic done;
     logic FINISH;
     logic dataSM;	 
     logic [31:0] dataTR;
	 logic IDR;
	 logic [31:0] dataout;


     statemachine SM(
                .clk(test_clk),
				.reset(reset_n),
				.DONE(done),
				.read(read),
                .ERROR(error),				
				.FINISH(FINISH),
				.Idlereset(IDR)); 
		
		

       bitCounter BB(
	             .Idlereset(IDR),
		         .reset(reset_n),
                 .IR(IR),
				 .DONE(done));
        /*
		slowclock SC( 
			     .clk(clk),
				 .reset(reset),
				 .flip(sclk));
		*/
		
       SMCounter Count1( 
		        .clk(test_clk),
                .IR(IR),
				.read(read),
				.data(dataSM),
				.error(error));
    

       shiftregIR Shifty( 
	              .IR(IR),
				  .reset(reset_n), 
				  .serial_data_in(dataSM),
				  .parallel_data_out(dataTR));
      
	  DataOutIR Reg(
	             .clk(test_clk),
				 .reset(reset_n),
				 .FINISH(FINISH),
				 .datain(dataTR),
				 .dataout(dataout));
	  
	  
	  
       irDecoder DECOIR(
		         .code(dataout),
				 .button(value2));
				 
//Button board
	
	buttonBoard_decoder decodeB(
		.buttons(buttonBoard),
		.value(value3)
	);


//cool feature
	logic PS2;
	logic VCR;
	logic Button;
	logic coolState;

	mux1 m1(
		.nes_in(value1),
		.state(coolState),
		
		.nes_out(PS2)
	);

	mux2 m2(
		.nes_in(value2),
		.state(coolState),
		
		.nes_out(VCR)
	);
	
	mux3 m3(
		.nes_in(value3),
		.state(coolState),
		
		.nes_out(Button)
	);
	
	assign_button(
		.button_board(Button),
		.PS2_keyboard(PS2),
		.IR_controller(VCR),
		
		.button_press(snes_out)
	);
	
	buttonState(
		.slowCLK(test_clk),
        
		.State(coolState)
	);
			
endmodule