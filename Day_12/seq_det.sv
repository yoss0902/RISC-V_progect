//the device return 1 whenever the seriel input was 1110_1101_1011

module seq_det(det_out, clk, rst, ser_in);

	input clk;
	input rst;
	input ser_in;

	output reg det_out;
	reg [3:0]count;
	reg [11:0]temp;

	always@(posedge clk or rst)
		if (rst) begin
			count = 4'h0;
			temp = 12'h0;
		end
		else if (count == 4'hf)
			count = 4'h0;
		else begin
			count <= count + 1'h1;
			temp[count]<= ser_in;
		end
	assign det_out = (temp == 12'hedb) ? 1'h1:1'h0;
endmodule
