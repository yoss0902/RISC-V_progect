module piso(srl_o, vld_o, clk, rst, prl_in);

	input clk;
	input rst;
	input [3:0]prl_in;

	output reg vld_o; // will be on if seriel bit is valid
	output reg srl_o; // the desire output

	reg [3:0]data;
	reg [2:0]num;

	always@(posedge clk or posedge rst)
		if (rst) begin //initialize the vars 
			data <= 4'h0;
			num <= 1'h0;
			vld_o <= 1'h0;
		end
		else if ((num == 3'h4)|(num == 3'h0)) begin // if the all data was given out
			data <= prl_in; // data gets the next value
			srl_o <= data[1];
			num <= 1'h1; //initalize the counter
			vld_o <= 1'h1;
		end
		else begin
			srl_o <= data[1];
			data <= {1'h0, data[3:1]}; // sorting data for the next output
			num <= num + 1'h1; //increasing the counter by 1
			vld_o <= 1'h1;
		end
endmodule





	
