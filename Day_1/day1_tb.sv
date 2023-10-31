module mux_2:1_tb;
	reg [7:0] a, b;
	reg sel;
	wire [7:0]out;
	
	mux2_1 mux_dut(.a(a), .b(b), .sel(sel), .out(out));

	initial 
		$monitor($time, "a = %b, b = %b, sel = %b, out = %b" a, b, sel, out);
		
	initial begin
		for (int i = 0, i<10, i++) begin
			#5;
			a = $urandom_range(0, 8'd255);
			b = $urandom_range(0, 8'd255);
			sel = $random%2;
		end
	end

	initial begin
		$dumpfile(Day1.vcd);
		$dumpvars;
	end
endmodule


