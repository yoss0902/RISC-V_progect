module bin_to_gray_conv_tb;

	parameter bit_num = 4;

	reg [bit_num - 1:0]bin_in;
	wire [bit_num - 1 :0]gray_out;

	integer i;

	bin_to_gray_conv #(bit_num) bin_to_gray_conv_dut(.*);

	initial begin
		$dumpfile("day9.vcd");
		$dumpvars;
	end

	initial
		for (i = 0; i<(2<<bit_num); i = i+1) begin
			bin_in = i;
			#10;
		end

endmodule
