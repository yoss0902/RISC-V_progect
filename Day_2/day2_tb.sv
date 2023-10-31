module D_FF_tb;
	
	reg clk;
	reg d_in;
	reg rst;
	wire q_non_rst;
	wire q_sncr_rst;
	wire q_asncr_rst;

	D_FF d_ff_dut(.clk(clk), .d_in(d_in), .rst(rst), .q_non_rst(q_non_rst), .q_sncr_rst(q_sncr_rst), .q_asncr_rst(q_asncr_rst));

	initial begin
		$dumpfile("day2.vcd");
		$dumpvars;
	end

	initial
		$monitor("time = %d, clk = %b, d_in =%b, rst = %b, q_non_rst = %b, q_sncr_rst = %b, q_asncr_rst = %b", $time, clk, d_in, rst, q_non_rst, q_sncr_rst, q_asncr_rst);

	initial begin
		clk = 1'b0;
		rst = 1'b0;
		d_in = 1'b0;
	end

	always #5 clk = ~clk;

	initial begin
		#10 d_in = 1'b1;
		#10 rst = 1'b1;
		#10 rst = 1'b0;
		#10 d_in = 1'b0;
		#10 rst = 1'b1;
	       	d_in = 1'b1;
		#10 rst = 1'b0;
		#20 $finish;
	end
endmodule



			
	
