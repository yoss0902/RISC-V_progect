module rnd_rbn_arb(gnt_out, clk, rst, req_in);

	input clk;
	input rst;
	input [3:0]req_in;

	output [3:0]gnt_out;
	wire [2:0]counter;

	always@(posedge clk or posedge rst)
		if (rst | counter == 2'h4) begin
			gnt_out = 4'h0;
			counter = 3'h0;
		end
		else begin
			counter = counter + 1
		end

	always@(*)
		if (req_in[counter]) begin
			gnt_out = 4'h0;
			gnt_out[counter] = 1'h1;
		end
		else if (counter == 2'h4)
			counter = 3'h0;
		else
			counter = counter +1;



	
endmodule


