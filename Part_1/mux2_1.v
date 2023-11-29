// Part 1
// a simple mux

module mux2_1(out,
       		sel,
	       	a,
	       	b);

	input [7:0] a; // left leg
	input[7:0] b; // right leg
	input sel;
	output [7:0] out;
	
	// out will be determined according to select wire
	// if sel is 1, out will be b, otherwise a.
	assign out = sel ? b : a;

endmodule
