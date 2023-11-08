module bin_to_gray_conv(bin_in, gray_out);

	parameter bit_num = 4;

	input [bit_num:0]bin_in;

	output [bit_num:0]gray_out;

	for (i = bit_num -2, i>=0, i = i-1)
		assign gray_out[i] = bin_in[i+1]^bin_in[i];
	end

endmodule

