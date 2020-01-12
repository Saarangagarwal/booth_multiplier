
module add_sub_gen
	#(parameter WIDTH=4)
	(
	output [WIDTH-1:0] out,
	input [WIDTH-1:0] a, b, cin
	);
	
assign out = a+b+cin;

endmodule