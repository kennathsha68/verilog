module half_subtractor(
	input a,
	input b,
	output reg difference, borrow
);
always @(*) begin
	difference=a^b;
	borrow=(~a)&b;
end
endmodule
