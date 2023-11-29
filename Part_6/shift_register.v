module shift_register(sft_out, in, clk, rst);
	
	input in;
	input clk;
	input rst;

	output reg [3:0]sft_out;
	
	always@(posedge clk or posedge rst)
		if (rst) 
			sft_out <= 4'b0;
		else
			sft_out <= {in, sft_out[3:1]};
	

endmodule
