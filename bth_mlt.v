// how will the register count know that inp is the input for that register i.e. the count register?
// if i have a separate module, then does it mean that it is for a different circuit
// en should be declared as a wire because it does not have any connection with the external world (input or output)
// one signal cannot have 2 broken if statements
// one signal cannot be used in two always blocks
module bth_mlt(
	output [7:0] prod,
	input clk, rst,
	input [3:0] inp_q, inp_m, //we declared these because we can't directly assign the multiplier and multiplicand to q amd m respectively
	input load
	);
	
reg [3:0] a, q, m;
reg [2:0] count;
reg q_1;
wire [3:0] sum, sub;

always @ (posedge clk or negedge rst)
begin
	if(!rst)
	begin
		q <= 4'd0;
		m <= 4'd0;
		a <= 4'd0;
		q_1 <= 1'd0;
		count <= 3'd0;
	end		
	
	else
	begin		
		if(load)
		begin
			count <= 3'b100;
			q <= inp_q;
			m <= inp_m;
		end
		
		else if (count != 3'b000)
		begin
			case ({q[0], q_1}) 
				2'b0_1 : {a, q, q_1} <= {sum[3], sum, q}; 
				2'b1_0 : {a, q, q_1} <= {sub[3], sub, q}; 
				default: {a, q, q_1} <= {a[3], a, q}; 
			endcase
		    count=count-1;
		end
		else
			count=count;
	    
	end		
end

sum_sub addition(sum, a, m, 4'd0);
sum_sub subtraction( sub, a, ~m, 4'b0001);
	
assign prod= {a,q};
		
endmodule


	