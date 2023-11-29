//Part 5
//8 bit odd counter

module odd_cntr(cntr_out, clk, rst);
	
	input clk;
	input rst;

	output reg [7:0]cntr_out;

	always@(posedge clk or posedge rst)
		if (rst | cntr_out == 8'hff)
			cntr_out <= 8'd1;
		else
			cntr_out <= cntr_out + 8'd2;
	
endmodule
