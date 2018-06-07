module TOPTESTIR(
            input logic IR,
			input logic reset,
			
			output logic [3:0] dataF

);
     logic clk;
     logic read;
     logic error;
     logic done;
     logic finish;
     logic dataSM;	 
     logic [32:0] dataTR;


     statemachine SM(
                .clk(clk),
				.reset(reset),
				.DONE(done),
				.read(read),
                .ERROR(error),				
				.FINISH(finish)) 
		
		

       bitCounter BB(
		         .reset(reset),
                 .IR(IR),
				 .DONE(done));
        
		slowclock SC( 
			     .clk(clk),
				 .reset(reset),
				 .flip(sclk));
		
       SMCounter Count( 
		        .clk(sclk),
                .IR(IR),
				.read(read),
				.data(dataSM),
				.error(error));
    

       shiftregIR Shifty( 
	              .clk(clk),
				  .reset(reset), 
				  .serial_data_in(dataSM),
				  .parallel_data_out(dataTR));
      
       irDecoder DECOIR(
		         .code(dataTR),
				 .button(dataF));	  


OSCH #("2.08") osc_int (			
			.STDBY(1'b0),			
			.OSC(clk),				
			.SEDSTDBY());			


endmodule