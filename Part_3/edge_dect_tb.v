module edge_dect_tb;
	
	reg clk;
	reg rst;
	reg d_in;
	
	
	wire rise_edge;
	wire fall_edge;

	//ctreating the insuntiation	
	edge_dect edge_dect_dut(.clk(clk), .rst(rst), .d_in(d_in), .rise_edge(rise_edge), .fall_edge(fall_edge));

	//creating waves file
	initial begin
		$dumpfile("Day_3.vcd");
		$dumpvars;
	end

	//printong the variables
	initial
		$monitor("time =%d, clk = %b, rst = %b, d_in = %b, rise_edge = %b, fall_edge = %b", $time, clk, rst, d_in, rise_edge, fall_edge);

	// initializing the variables
	initial begin
		clk = 1'b0;
		rst = 1'b0;
		d_in = 1'b0;
	end

	// creating clock with T of 10 time units
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
			
