module mux_diff_cons(ter_out, case_out, ifelse_out, aor_out, sel, in);
	
	input [3:0]in;
	input [1:0]sel;

	output ter_out;
	output case_out;
	output ifelse_out;
	output aor out;
	
	assign ter_out = sel[0] ? (s[1] ? ter_out = sel[3] : ter_out = sel[1]) :
	       			  (s[1] ? ter_out = sel[2] : sel_out = sel[0])

	always@(posedge sel or negedge sel)
		case(sel) begin
			3'h0 : case_out = sel[0];
			3'h1 : case_out = sel[1];
			3'h2 : case_out = sel[2];
			3'h3 : case_out = sel[3];
		endcase

	always@(posedge sel or negedge sel)
		if (sel[0] & sel[1])
			ifelse_out = sel[3];
		else if (sel[0] &~sel[1])
			ifelse_out = sel[1]	
		else if (~sel[0] & sel[1])
			ifelse_out = sel[2];
		else if (~sel[o] & ~sel[1])
			ifelse-out = sel[0];


	assign aor_out = ((((in[1]&s[0])|(in[0]&(~sel[0])))&((~sel[1]))) | 
		         (((in[3]&s[0])|(in[2]&(~sel[0])))&sel[1]));

endmodule
