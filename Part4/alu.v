//Part 4 
//a simple ALU

module ALU(alu_out, a, b, op_code);
	
	input [7:0]a, b;
	input [2:0]op_code;

	output reg [7:0]alu_out;

	//the operation codes
	parameter ADD = 3'b000,
		SUB = 3'b001,
		SLL = 3'b010,
		SRL = 3'b011,
		AND = 3'b100,
		OR = 3'b101,
		XOR = 3'b110,
		EQL = 3'b111;
	
	reg carry;

	
	//assinging actions according to op-code
	always@(*) begin
		case(op_code)
			ADD: {carry, alu_out} = a+b;
			SUB: alu_out = a - b;
			SLL: alu_out = a << 1;
			SRL: alu_out = a >> 1;
			AND: alu_out = a & b;
			OR: alu_out = a | b;
			XOR: alu_out = a ^ b;
			EQL: alu_out = (a==b) ? 8'd1: 8'd0;
		endcase
	end

endmodule
		       	





