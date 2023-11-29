module mux_diff_cons_tb;

	reg [3:0]in;
	reg [1:0]sel;

	wire ter_out;
	wire case_out;
	wire ifelse_out;
	wire aor_out;

	mux_diff_cons mux_diff_cons_dut(.*);

	initial begin
		$dumofile("day13.vcd");
		$dumpvars;
	end

	initial
		repeat(10) begin
			in = $urandom_range(4'h0, 4'hf);
		       	sel = $random%2;
			#10;
		end
		
endmodule	
