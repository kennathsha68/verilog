`timescale 1ns / 1ps

module foutbitcomp_tb;

    reg  [3:0] a;
    reg  [3:0] b;

    wire eq;
    wire gre;
    wire les;
    foutbitcomp uut (
        .a(a),
        .b(b),
        .eq(eq),
        .gre(gre),
        .les(les)
    );

    initial begin
        $display("Time\tA\tB\tGRE\tEQ\tLES");
        $monitor("%0t\t%d\t%d\t%b\t%b\t%b",
                 $time, a, b, gre, eq, les);

        a = 4'd0;  b = 4'd0;   #10;
        a = 4'd5;  b = 4'd3;   #10;
        a = 4'd2;  b = 4'd7;   #10;
        a = 4'd15; b = 4'd15;  #10;
        a = 4'd8;  b = 4'd4;   #10;
        a = 4'd1;  b = 4'd9;   #10;
        a = 4'd10; b = 4'd10;  #10;
        a = 4'd14; b = 4'd13;  #10;
        a = 4'd6;  b = 4'd12;  #10;

        $finish;
    end

endmodule
