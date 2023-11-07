module decoder_tb;

	parameter bin_in = 4;
	parameter one_hot_out = 16;

	input reg [bin_in -1:0]in;

	output [one_hot_out:0]out;

	decoder decoder_dut(.in(in), .out(out));

	initial begin
		$dumpfile("day8.vcd");
		$dumpvars;

	end

	initial begin
		repeat(32) 
			#10
			in = $urandom_range(0, 4'h7);
		

	end
endmodule

	


