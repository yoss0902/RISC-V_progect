module fix_prio_arb(gran_out, req_in);
	
	parameter PORTS_NUM = 4;

	input [PORTS_NUM-1:0]req_in;
	output reg [PORTS_NUM-1:0]gran_out;

	
	genvar i;
	for (i = PORTS_NUM - 1, i > 0  i = i-1)
		if (req_in[i])
			gran_out = 4'h0;
			gran_out[i] = 1'h1;
			i = 0;
endmodule


		
	

