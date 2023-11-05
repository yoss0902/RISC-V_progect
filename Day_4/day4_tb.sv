module ALU_tb;
	
	reg [7:0]a, b;
	reg cout;
	reg [2:0]op_code;
	wire [7:0]alu_out;

	ALU ALU_dut(.a(a), .b(b), .op_code(op_code), .alu_out(alu_out));

	initial begin
		$dumpfile("day4.vcd");
		$dumpvars;
		#250
		$finish;
	end
	
	initial begin
		repeat(3) begin
			for (int i = 0; i<8; i++) begin
				a = $urandom_range(0, 8'hff);
				b = $urandom_range(0, 8'hff);
				cout = $random%2;
				op_code = i;
				#5;
			end
		end
	end

endmodule



