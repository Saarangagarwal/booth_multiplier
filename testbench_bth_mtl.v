
module testbench_bth_mlt;

reg clk, rst, load;  //will be assigned to the initial block
reg [3:0] inp_q, inp_m;
wire [7:0] prod;

bth_mlt dut1 (.load(load), .clk(clk), .rst(rst), .inp_q(inp_q), .inp_m(inp_m), .prod(prod));

initial
begin
 clk = 1'b0;
 forever clk = #5 ~clk;
end
 
initial
begin
	$display("First example: inp_q= 3 and inp_m= 5"); //i.e. 5*3
	rst=0; #1 rst=1; inp_q= 3; inp_m= 5; load=1; #10 load=0; 
	#40 $display("First example done");
	
	$display("Second example: inp_q= 4 and inp_m= 3"); //i.e. 3*4
	rst=0; #1 rst=1; inp_q= 4; inp_m= -3; load=1; #10 load=0; 
	#80 $display("Second example done");
	
$finish;
end

endmodule