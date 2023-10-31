// Day 1
// a simple mux

module mux2_1(out, sel, a, b);
	input [7:0] a,b;
	input sel;
	output [7:0] out;

	assign out = sel ? b : a;

endmodule
