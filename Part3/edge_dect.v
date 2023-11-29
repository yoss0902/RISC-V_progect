// part 3 
//a rising edge and a falling edge detector

module edge_dect(fall_edge,
       		rise_edge,
	       	clk,
	       	rst,
	       	d_in);
	
	input clk;
	input rst;
	input d_in;

	output fall_edge;
	output rise_edge;

	reg q;

	always@(posedge clk, posedge rst)
		if (rst)
			q <= 1'b0;
		else
			q <= d_in;

	//positive edge detector
	assign rise_edge = ~q & d_in;

	//negative edge detector
	assign fall_edge = q & ~d_in;

endmodule

