module mux_diff_cons(ter_out, case_out, ifelse_out, aor_out, sel, in);
	
	input [3:0]in;
	input [1:0]sel;

	output ter_out;
	output reg case_out;
	output reg ifelse_out;
	output aor_out;
	
	assign ter_out = sel[0] ? (sel[1] ? in[3] : in[1]) :
	       			  (sel[1] ? in[2] : in[0]) ;

	always@(*) begin
		case(sel) 
			3'h0 : case_out = in[0];
			3'h1 : case_out = in[1];
			3'h2 : case_out = in[2];
			3'h3 : case_out = in[3];
		endcase
	end

	always@(*)
		if (sel[0] & sel[1])
			ifelse_out = in[3];
		else if (sel[0] &~sel[1])
			ifelse_out = in[1];	
		else if (~sel[0] & sel[1])
			ifelse_out = in[2];
		else if (~sel[0] & ~sel[1])
			ifelse_out = in[0];


	assign aor_out = ((((in[1]&sel[0])|(in[0]&(~sel[0])))&((~sel[1]))) | 
		         (((in[3]&sel[0])|(in[2]&(~sel[0])))&sel[1]));

endmodule
