//implementing basic APB master interface which add 1 to the read data value 
// and write this value to the write data register

module apb_mst(psel, 
		penable,
		paddr, 
		pwrite, 
		pwdata,
		clk, 
		rst, 
		cmd, 
		pready, 
		prdata);

	input clk;
	input rst; //activ-low reset
	input [1:0]cmd; //command from sistem: read or write
	input pready; //input from slave
	input [31:0]prdata; //input from slave
	
	output psel; 
	output peneble;
	output [31:0]padrr;
	output pwrite; //1 for write, 0 for read;
	output pwdata;
	
	
	//3 states of the FSM
	parameter IDLE = 2'b00;
	parameter SETUP = 2'b01;
	parameter ACCESS = 2'b10;
	
	reg [1:0]curr_state;
	reg [1:0]nxt_state;
	reg [31:0] read_data;

	//state to state transition
	always@(posedge clk or negedge rst)
		if (!rst)
			curr_state <= IDLE;
		else
			curr_state <= nxt_state;
	
	// actual logic os the FSM
	always(*) begin
		nxt_state = curr_state;
		case(curr_state)
			IDLE: begin
				if (|cmd)
					nxt_state = SETUP;
				else
					nxt_state = IDLE;
			end
			SETUP: nxt_state = ACCESS;
			ACCESS: begin
				if (~pready)
					nxt_state = ACCESS;
				else if (pready&(|cmd))
					nxt_state = SETUP;
				else 
					nxt_state = IDLE;
			end
			default: nxt_state = curr_state;
		endcase
	end

	assign pwdata = cmd[1]; //0 if cmd = 01 and 1 if cmd = 10
	assign penable = (curr_state == ACCESS);
	assign psel = penable | (curr_state == SETUP);
	assign padrr = 32'hdeadcafe;
	assign pwdata = read_data + 1'b1;
	

	always@(posedge clk or negedge rst)
		if (!rst)
			read_data = 32'b0;
		else 
			read_data = prdata;

endmodule




