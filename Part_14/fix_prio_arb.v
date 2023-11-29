module fix_prio_arb(gran_out, req_in);
	
	parameter PORTS_NUM = 4;

	input [PORTS_NUM-1:0]req_in;
	output reg [PORTS_NUM-1:0]gran_out;
	reg [PORTS_NUM-1:0]temp;
	
	integer i;
	always@(*) begin
		temp = req_in;
		for (i = 0; i < PORTS_NUM ;  i = i+1)
			if (temp[i]) begin
				gran_out = 4'h0;
				gran_out[i] = 1'h1;
				temp = 0;
			end
	end
endmodule


		
	

