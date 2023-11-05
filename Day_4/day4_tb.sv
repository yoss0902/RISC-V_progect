module 8bit_ALU_tb;
	
	reg [7:0]a, b;
	reg cout;
	reg [2:0]op_code;
	wire [7:0]alu_out;

	8bit_ALU 8bit_ALU_dut(.a(a), .b(b), .op_code(op_code), .alu_out(alu_out));

	initial begin
		$dumpfile("day4.vcd");
		$dumpvars;
		#1000
		$finish;
	end
	
	initial 
		repeat(3) begin
			for (i = 0; i<8; i++) begin
				a = $urandom_range(0, 8'hff);
				b = $urandom_range(0, 8'hff);
				cout = $random%2;
				op_code = i;
			end
		end
	end

endmodule



