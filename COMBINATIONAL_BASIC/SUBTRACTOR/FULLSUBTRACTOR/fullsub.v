module full_subtractor(
	input a,b,c,
	output reg  borrow, difference
);
always @(*) begin
	difference=a^b^c;
	borrow=((~a&b)|(~a&c)|(b&c));
end
endmodule
