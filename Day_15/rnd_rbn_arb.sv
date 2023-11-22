module rnd_rbn_arb(gnt_out, clk, rst, req_in);
	
	parameter PORTS_NUM = 4
	input clk;
	input rst;
	input [3:0]req_in;

	output reg [3:0]gnt_out;
	reg [3:0]temp;
	reg [3:0]mask;
	reg [3:0]gnt_fix;
	reg [3:0]gnt_rnd;
	


	always@(posedge clk or posedge rst)
		if (rst)
			mask = 4'hf;
		else if (gnt_out[0])
			mask <= 4'b1110;
		else if (gnt_out[1])
			mask <= 4'b1100;
		else if (gnt_out[2])
			mask <= 4'b1000;
		else if (gnt_out[3])
			mask <= 4'hf;
	
	
	assign temp = req_in & mask;

	fix_prio_arb #(PORTS_NUM) f1(.req_in(req_in), .gran_out(gnt_fix));
	fix_prio_arb #(PORTS_NUM) f2(.req_in(temp), .gran_out(gnt_rnd));

	assign gnt_out = &mask ? gnt_fix:gnt_rnd;


	
endmodule


