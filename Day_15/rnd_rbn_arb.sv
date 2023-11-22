module rnd_rbn_arb(gnt_out, clk, rst, req_in);

	input clk;
	input rst;
	input [3:0]req_in;

	output [3:0]gnt_out;
	wire [1:0]counter;

	always@(posedge clk or posedge rst)
		if (rst or counter == 2'h4)
			counter <= 1'h0;
		else begin
			while (~req_in[counter]) begin
				counter <= counter + 1'h1;
				if (counter == 2'h5)
					counter <= 1'h0;
			end
			gnt_out <= req_in[counter]; 
		end
	
endmodule


