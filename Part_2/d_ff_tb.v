module d_ff_tb;
	
	reg clk;
	reg d_in;
	reg rst;
	wire q_non_rst;
	wire q_sncr_rst;
	wire q_asncr_rst;

	d_ff d_ff_dut(.clk(clk), .d_in(d_in), .rst(rst), .q_non_rst(q_non_rst), .q_sncr_rst(q_sncr_rst), .q_asncr_rst(q_asncr_rst));

	//creating the waves file
	initial begin
		$dumpfile("day2.vcd");
		$dumpvars;
	end
	
	//printing the variables
	initial
		$monitor("time = %d, clk = %b, d_in =%b, rst = %b, q_non_rst = %b, q_sncr_rst = %b, q_asncr_rst = %b", $time, clk, d_in, rst, q_non_rst, q_sncr_rst, q_asncr_rst);

	//initializing the variables
	initial begin
		clk = 1'b0;
		rst = 1'b0;
		d_in = 1'b0;
	end

	//creating clock
	always #5 clk = ~clk;

	//the simulation
	initial begin
		#10 d_in = 1'b1;
		#10 rst = 1'b1;
		#10 rst = 1'b0;
		#10 d_in = 1'b0;
		#10 d_in = 1'b1;
		#20 $finish;

	end
endmodule
