module testbench_bth_mlt #(parameter WIDTH=8);

reg clk, rst, load;  //will be assigned to the initial block
reg [WIDTH-1:0] inp_q, inp_m;
wire [WIDTH+WIDTH-1:0] prod;

bth_mlt_gen #(8) bth_mlt_gen (.load(load), .clk(clk), .rst(rst), .inp_q(inp_q), .inp_m(inp_m), .prod(prod));

initial
begin
 clk = 1'b0;
 forever clk = #5 ~clk;
end
 
initial
begin
		$display("First example: inp_q= 20 and inp_m= 20"); //i.e. 20*20
    rst=0; #1 rst=1; inp_q= 20; inp_m= 20; load=1; #10 load=0; 
     $display("First example done");

	


end

endmodule
