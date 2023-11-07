module lfsr_tb;
	
	reg clk;
	reg rst;

	wire [3:0]lfsr_out;

	lfsr lfsr_dut(.clk(clk), .rst(rst), .lfsr_out(lfsr_out));

	initial begin
		$dumpfile("day7.vcd");
		$dumpvars;
		#500 $finish;

	end

	initial 
		clk = 1'b0;
		#10 rst = 1'b1;
		#10 rst = 1'b0;
	end 

	always #5 clk = ~clk;

	

endmodule
