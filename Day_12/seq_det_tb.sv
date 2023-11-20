module seq_det_tb;

	reg clk;
	reg rst;
	reg ser_in;

	wire det_out;

	seq_det seq_det_dut(.*);

	initial begin
		$dumpfile("day12.vcd");
		$dumpvars;
	end

	initial begin
		clk = 1'h0;
		rst = 1'h1;
		ser_in = 0;
	end

	always #5 clk = ~clk;

	initial begin
		#10 rst = 1'h0;
		repeat(3) begin
			#10 ser_in = 1'h1;
			#20 ser_in = 1'h0;
		end
		#10 ser_in = 1'h1;
		#40;
		repeat(1000)
			#10 ser_in = $random%2;
		$finish;
	end
endmodule
