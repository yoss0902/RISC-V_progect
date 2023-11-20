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
		rst = 1'h1;
		prl_in = 4'h8;
	end

	always #5 clk = ~clk;

	initial
		#10 rst = 1'h0;
		repeat(10)
			#40 prl_in = $urandom_range(1'h0, 4'hf);
		$finish;
	end
endmodule

	


