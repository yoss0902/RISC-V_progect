module cntr_with_input_tb;

	reg clk;
	reg rst;
	reg ld_in;
	reg [3:0]ld_val;

	wire [3:0]count_out;

	cntr_with_input dut(.*);

	initial begin 
		$dumpfile("day10.vcd");
		$dumpvars;

	end

	initial begin
		clk = 1'b0;
		rst = 1'b1;
		ld_in = 1'b0;
		ld_val = 4'b0;
	end

	always #5 clk = ~clk;

	initial begin
		#10 rst = 1'b0
		#50 ld_in = 1'b1;
		ld_val = 4'hc;
		#10 ld_in = 1'b0;
		#50 rst = 1'b1;
		#10 rst = 1'b0;
		#170 $finish;
	end
endmodule

