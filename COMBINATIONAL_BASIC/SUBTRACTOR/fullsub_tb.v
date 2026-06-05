`timescale 1ns/1ps

module full_subtractor_tb;
reg a,b,c;
wire borrow, difference;

full_subtractor uut(
	.a(a),
	.b(b),
	.c(c),
	.borrow(borrow),
	.difference(difference)
);

initial begin 
	$dumpfile("sim.vcd");
	$dumpvars(0, full_subtractor_tb);
	$monitor("Time=%0t | a=%b b=%b c=%b | borrow=%b difference=%b", $time, a, b, c, borrow, difference);

	a=0;b=0;c=0;#10;
	a=0;b=0;c=1;#10;
	a=0;b=1;c=0;#10;
	a=0;b=1;c=1;#10;
	a=1;b=0;c=0;#10;
	a=1;b=0;c=1;#10;
	a=1;b=1;c=0;#10;
	a=1;b=1;c=1;#10;
	$finish;
end
endmodule
