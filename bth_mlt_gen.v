
module bth_mlt_gen
	    #(parameter WIDTH=4)			
	(
	output [WIDTH+WIDTH-1:0] prod,
	input clk, rst,
	input [WIDTH-1:0] inp_q, inp_m,
	input load
	);
	
reg [WIDTH-1:0] q, m, a;
reg [WIDTH-1:0] count;
reg q_1;
wire [WIDTH-1:0] sum, sub;

always @ (posedge clk or negedge rst)
begin
	if(!rst)
	begin
		q <= 0;
		m <= 0;
		a <= 0;
		q_1 <= 1'd0;
		count <= 0;
	end		
	
	else
	begin		
		if(load)
		begin
			count <= WIDTH;
			q <= inp_q;
			m <= inp_m;
		end
		
		else if (count != 0)
		begin
			case ({q[0], q_1}) 
				2'b0_1 : {a, q, q_1} <= {sum[WIDTH-1], sum, q}; 
				2'b1_0 : {a, q, q_1} <= {sub[WIDTH-1], sub, q}; 
				default: {a, q, q_1} <= {a[WIDTH-1], a, q}; 
			endcase
		    count=count-1;
		end
		else
			count=count;
	    
	end		
end

add_sub_gen #(WIDTH) addition(sum, a, m, 0);
add_sub_gen #(WIDTH) subtraction( sub, a, ~m, 1);
	
assign prod= {a,q};
		
endmodule


	