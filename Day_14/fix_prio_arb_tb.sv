module fix_prio_arb_tb;

	parameter PORTS_NUM = 4;
	reg req_in;

	wire gran_out;

	fix_prio_arb #(PORTS_NUM) fix_prio_num(.*);
	
	initial begin
		$dumpfile("day14.vcd");
		$dumpvars;
	end

	initial 
		repeat(20) begin
			req_in = $urandom_range(0, 4'hf);
			#10;
		end
endmodule
