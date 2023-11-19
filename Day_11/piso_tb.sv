module piso_tb;
	
	reg clk; 
	reg rst;
	reg [3:0]prl_in;

	output vld_o;
	output srl_o;

	piso piso_dut(.*);

	initial begin
		$dumpfile("day11.vcd");
		$dumpvars;
	end
	
	initial begin
		clk = 1'h0;
		rst = 1'h0;
		prl_in = 4'h0;
	end

	always #5 clk = ~clk;

	initial
		#10 prl_in = 4'ha;
		#50 rst = 1'h1;
		#10 rst = 1'h0;
		#10 prl_in = 4'hc;
		#40;
	end
endmodule

	


