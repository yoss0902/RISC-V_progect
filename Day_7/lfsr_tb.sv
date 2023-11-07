module lfsr_tb;
	
	reg clk;
	reg rst;

	wire lfsr_out[3:0];

	lfsr lfsr_dut(.clk(clk), .rst(rst), .lfsr_out(lfsr_out));

	initial begin
		$dumpfile("day7.vcd");
		$dumpvars;
		#500 $finish

	end

	initial 
		clk = 1'b0;

	always #5 clk = ~clk;

	initial 
		#10 rst = 1'b1;

endmodule
