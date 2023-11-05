module shift_register_tb;
	
	reg clk;
	reg rst;
	reg in;

	wire [3:0]sft_out;

	shift_register sft_reg_dut(.clk(clk), .rst(rst), .in(in), .sft_out(sft_out));

	initial begin
		$dumpfile("day6.vcd");
		$dumpvars;

	end
	
	initial begin
		clk = 1'b0;
		rst = 1'b0;
		in = 1'b0;
	end

	always #5 clk = ~clk;
	
	initial begin
		#10 rst = 1'b1;
		#10 rst = 1'b0;
		repeat(20)
			#10 in = $random%2;
		$finish;
	end

endmosule
