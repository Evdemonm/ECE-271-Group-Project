module PS2Decoder(input  logic [10:0] code, 
			//	  input  logic clk,
				  input  logic en,
			//	  input  logic reset_2,
				  output logic reset,
				  output logic [3:0] value);
	always_comb
	begin
		value = 9;
		if(en) begin//add counter!!!!
			case(code)
				11'b10_0001_1100_0: value = 0;//a
				11'b10_0010_0011_0: value = 1;//d
				11'b11_0010_0100_0: value = 2;//e
				11'b11_0010_1011_0: value = 3;//f this
				11'b10_0011_0100_0: value = 4;//g
				11'b11_0010_1101_0: value = 5;//r
				11'b11_0001_1101_0: value = 6;//s		
				11'b10_0010_1100_0: value = 7;//t
				
				//fliped?
				11'b0_0011_1000_01:	value = 0;//a
				11'b0_1100_0100_01: value = 1;//d
				11'b0_0010_0100_11: value = 2;//e
				11'b0_1101_0100_11: value = 3;//f this
				11'b0_0010_1100_01: value = 4;//g
				11'b0_1011_0100_11: value = 5;//r
				11'b0_1011_1000_11: value = 6;//s
				11'b0_0011_0100_01: value = 7;//t
				//11'b0_1011_1000_11: value = 8;//w
				default: value = 9;
			endcase
		end
	end
	
	
endmodule
