`timescale 1ns/1ps

module half_subtractor_tb;
reg a,b;
wire difference, borrow, not_out ;

half_subtractor uut(
	.a(a),
	.b(b),
	.difference(difference),
	.borrow(borrow)
);

initial begin
	$dumpfile("sim.vcd");
	$dumpvars(0, half_subtractor_tb);
	$monitor("Time=%0t| a=%b b=%b | difference=%b borrow=%b",$time, a, b, difference, borrow);

	a=0;b=0;#10;
	a=0;b=1;#10;
	a=1;b=0;#10;
	a=1;b=1;#10;
	$finish;
end
endmodule
