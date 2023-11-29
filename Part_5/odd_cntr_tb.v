module odd_cntr_tb;
	
	reg clk;
	reg rst;

	wire [7:0]cntr_out;

	//intantiating the odd counter
	odd_cntr odd_cntr_dut(.clk(clk), .rst(rst), .cntr_out(cntr_out));

	//creating the waves file
	initial begin
		$dumpfile("day5.vcd");
		$dumpvars;

	end

	// initializing the variables
	initial begin
		clk = 1'b0;
		rst = 1'b0;
	end

	//creating clock
	always #5 clk = ~clk;

	//the simulation
	initial begin
		#30 rst = 1'b1;
		#10 rst = 1'b0;
		repeat(140)
	       		#10;
		$finish;
	end	
endmodule

