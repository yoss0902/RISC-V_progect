// Day 2
// various kinds of D-ff

module d_ff(q_non_rst,
       		q_sncr_rst,
	       	q_asncr_rst,
	       	d_in,
	       	clk,
	       	rst);

	input d_in; 
	input clk;
	input rst;

	output reg q_non_rst; 
	output reg q_sncr_rst; 
	output reg q_asncr_rst;

	// no reset
	always@(posedge clk)
		q_non_rst <= d_in;

	//synchronize reset
	always@(posedge clk)
		if (rst)
			q_sncr_rst <= 1'b0;
		else
			q_sncr_rst <= d_in;
	
	//asynchronize reset
	always@(posedge clk or posedge rst)
		if (rst)
			q_asncr_rst <= 1'b0;
		else
			q_asncr_rst <= d_in;
	
endmodule
				
