module decoder_tb;

	parameter bin_in = 4;
	parameter one_hot_out = 16;

	reg [bin_in -1:0]in;

	wire [one_hot_out-1:0]out;

	decoder #(bin_in, one_hot_out) decoder_dut(.in(in), .out(out));

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

	


