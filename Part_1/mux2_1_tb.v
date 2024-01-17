module mux2_1_tb;
	reg [7:0] a;
       	reg [7:0] b;
	reg sel;
	wire [7:0]out;
	
	//instantiation of the mux for the TB
	mux2_1 mux_dut(.a(a), .b(b), .sel(sel), .out(out));

	//printing the variables
	initial 
		$monitor("time = %d, a = %b, b = %b, sel = %b, out = %b", $time, a, b, sel, out);

	//the simulation	
	initial begin
		repeat(10) begin
			#5;
			a = $random % 8'd255;
			b = $random % 8'd255;
			sel = $random%2;
		end
	end
	
	//creating the waves file
	initial begin
		$dumpfile("Day1.vcd");
		$dumpvars;
	end
endmodule


