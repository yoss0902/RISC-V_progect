module bin_to_gray_conv_tb;

	parameter bit_num = 4
	reg [bit_num:0]bin_in;
	wire [bit_num:0]gray_out;

	bin_to_gray_conv #(bit_num) bin_to_gray_conv_dut(.*);

	initial begin
		$dumpfile("day9.vcd");
		$dumpvars;
	end

	initial
		for (i = 0; i<(2<<bit_num); i = i+1)
			#10 bin_in = i;
		end

