module apb_mst_tb;

	reg clk;
	reg rst;
	reg [1:0]cmd;
	reg pready;
	reg [31:0]prdata;

	wire psel;
	wire penable;
	wire [31:0]paddr;
	wire pwrite;
	wire pwdata;

	wire [2:0]tmp;

	apb_mst apb_mst_dut(.*);

	initial begin
		clk = 1'b0;
		rst = 1'b1;
		pready = 1'b0;
		prdata = 32'b0;
		#5 rst = 1'b0;
	//	#5 rst = 1'b1;
	end

	always #5 clk = ~clk;

	initial
		repeat(10) begin
			tmp = $urandom_range(0, 3'h7);
			#tmp pready = 1'b1;
		end
	initial 
		repeat(10) begin
			prdata = $urandom_range(0, 4'hff);
			cmd = $random%2 + 1;
			while(~pready)
				#10;
		$finish
		end


endmodule


	
