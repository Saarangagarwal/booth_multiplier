
module sum_sub(
	output [3:0] out,
	input [3:0] a, b, cin
	);
	
assign out = a+b+cin;

endmodule