module rnd_rbn_arb_tb;

	reg clk;
	reg rst;
	reg [3:0]req_in;

	wire [3:0]gnt_out;

	rnd_rbn_arb rnd_rbn_arb_dut(.*);

	initial begin 
		$dumpfile("day15.vcd");
		$dumpvars;
	end

	initial begin
		clk = 1'h0;
		rst = 1'h1;
		req_in = 4'h0;
	end

	always #10 clk = ~clk;

	initial begin
		#10 rst = 1'h0;
		repeat(100)
			#20 req_in = $urandom_range(0, 4'hff);
		$finish;
	end
endmodule
