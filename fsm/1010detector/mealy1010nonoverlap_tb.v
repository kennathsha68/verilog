module tb;

reg clk;
reg rst;
reg x;
wire y;

mealy_1010_nonoverlap dut(
    .clk(clk),
    .rst(rst),
    .x(x),
    .y(y)
);

always #5 clk = ~clk;

task send_bit;
input bit_in;
begin
    x = bit_in;
    #10;
end
endtask

initial
begin
    clk = 0;
    rst = 1;
    x   = 0;

    #12 rst = 0;

    // Sequence: 1010 -> detect
    send_bit(1);
    send_bit(0);
    send_bit(1);
    send_bit(0);

    // Sequence: 101010
    
    send_bit(1);
    send_bit(0);

    // invalid
    send_bit(1);
    send_bit(1);
    send_bit(1);
    send_bit(0);

    #20;
    $finish;
end

initial
begin
    $monitor("Time=%0t x=%b y=%b state=%b",
              $time,x,y,dut.state);
end

endmodule
