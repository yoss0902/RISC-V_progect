//the device return 1 whenever the seriel input is 1110_1101_1011

module seq_det(det_out, clk, rst, ser_in);

	input clk;
	input rst;
	input ser_in;

	output reg det_out;

	reg [11:0]temp;

	always@(posedge clk or rst)
		if (rst) 
			temp = 12'h0;
		else
			temp <= {ser_in, temp[11:1]};
		
	assign det_out = (temp == 12'hedb) ? 1'h1:1'h0;
endmodule
