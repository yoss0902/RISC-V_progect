
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
  	wire [31:0]pwdata;

	reg [2:0]tmp;

	apb_mst apb_mst_dut(.*);

	initial begin 
		$dumpfile("day16.vcd");
		$dumpvars;
      	#1000 $finish; 
	end

	initial begin
		clk = 1'b0;
		rst = 1'b1;
		pready = 1'b0;
		prdata = 32'b0;
		#5 rst = 1'b0;
		#5 rst = 1'b1;
	end

	always #5 clk = ~clk;

	initial begin
		#5;
      repeat(20) begin
         	pready = 1'b0;
			tmp = $urandom_range(0, 3'h7);
          	while(tmp)
             	#10 tmp = tmp -1;
          	pready = 1'b1;
        	#10;       

		end
    end
	initial 
      #5 repeat(20) begin
			#10 prdata = $urandom_range(0, 4'hf);
			cmd = $random%2 + 1'b1;
        	while(~pready) begin
				#10;
            end
		end


endmodule


	

















