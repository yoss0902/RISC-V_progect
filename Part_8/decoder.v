module decoder(out, in);
	
	parameter bin_in = 4;
	parameter one_hot_out = 16;

	input [bin_in-1:0]in;

	output [one_hot_out-1:0]out;

	assign out = 1'b1 << in;

endmodule
