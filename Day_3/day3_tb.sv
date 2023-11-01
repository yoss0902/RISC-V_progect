module edge_dect_tb;
	
	reg clk;
	reg rst;
	reg d_in;
	
	
	wire rise_edge;
	wire fall_edge;
	
	edge_dect edge_dect_dut(.clk(clk), .rst(rst), .d_in(d_in), .rise_edge(rise_edge), .fall_edge(fall_edge));

	initial begin
		$dumpfile("Day_3.vcd");
		$dumpvars;

	initial
		$monitor("time =%d, clk = %b, rst = %b, d_in = %b, rise_edge = %b, fall_edge = %b", $time, clk, rst, d_in, rise_edge, fall_edge);

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
		#10 d_in = 1'b1;
		#20 $finish;
	end

endmodule
			
