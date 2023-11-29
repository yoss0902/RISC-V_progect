module fix_prio_arb_tb;

	parameter PORTS_NUM = 4;
	reg  [PORTS_NUM-1:0]req_in;

	wire [PORTS_NUM-1:0]gran_out;

	fix_prio_arb #(PORTS_NUM) fix_prio_num(.*);
	
	initial begin
		$dumpfile("day14.vcd");
		$dumpvars;
	end

	initial 
		repeat(20) begin
			#10 req_in = $urandom_range(0, 4'hf);
			
		end
endmodule
