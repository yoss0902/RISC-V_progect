module mux2_1_tb;
	reg [7:0] a, b;
	reg sel;
	wire [7:0]out;
	
	mux2_1 mux_dut(.a(a), .b(b), .sel(sel), .out(out));

	initial 
		$monitor("time = %d, a = %b, b = %b, sel = %b, out = %b", $time a, b, sel, out);
		
	initial begin
		repeat(10) begin
			#5;
			a = $urandom_range(0, 8'd255);
			b = $urandom_range(0, 8'd255);
			sel = $random%2;
		end
	end

	initial begin
		$dumpfile("Day1.vcd");
		$dumpvars;
	end
endmodule


