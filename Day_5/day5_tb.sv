module odd_cntr_tb;
	
	reg clk;
	reg rst;

	wire [7:0]cntr_out;

	odd_cntr odd_cntr_dut(.clk(clk), .rst(rst), .cntr_out(cntr_out));

	initial begin
		$dumpfile("day5.vcd");
		$dumpvars;

	end

	initial begin
		clk = 1'b0;
		rst = 1'b0;
	end

	always #5 clk = ~clk;

	initial begin
		#30 rst = 1'b1;
		#10 rst = 1'b0;
		repeat(140)
	       		#10;
		$finish;
	end	
endmodule

