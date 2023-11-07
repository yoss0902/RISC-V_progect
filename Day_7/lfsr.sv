module lfsr(lfsr_out, clk, rst);
	
	input clk;
	input rst;

	output reg [3:0]lfsr_out;

	always@(posedge clk or posedge rst)
		if (rst)
			lfsr_out <= 4'hf;
		else
			lfsr_out <= {(lfsr_out[1]^lfsr_out[3]), lfsr_out[3:1]};

endmodule	
