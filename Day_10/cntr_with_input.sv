module cntr_with_input(count_out, clk, rst, ld_in, ld_val);

	input clk;
	input rst;
	input ld_in;
	input [3:0]ld_val;

	output reg [3:0]count_out;
	wire [3:0]temp;

	always@(posedge clk or posedge rst)
		if (rst) begin	
			count_out <= 4'h0;
			temp <= 4'h0;
		end
		else if (ld_in) begin
			count_out <= ld_val;
			temp <= ld_val;
		end
		else if (count_out == 4'hf)
	 		count_out <= temp;
		else 
		count_out <= count_out + 1'h1;	

endmodule	
