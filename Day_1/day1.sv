// Day 1
// a simple mux

module 2:1_mux(out, sel, a, b);
	input [7:0] a,b;
	input sel;
	output [7:0] out;

	assign out = sel ? b : a;

endmodule
