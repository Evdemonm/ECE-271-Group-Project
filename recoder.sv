module recoder(input logic[4:0] nes_1,
			   input logic[4:0] nes_2,
			   input logic[4:0] nes_3,
			  output logic[12:0] button_press);
	
	if(nes_2 == 12 && nes_3 == 12)
		assign button_press = nes_1;
	else if(nes_1 == 12 && nes_3 == 12)
		assign button_press = nes_2;
	else if(nes_1 == 12 && nes_2 == 12)
		assign button_press = nes_2;
		
endmodule