`timescale 1ns / 1ps

module fulladder(
    input a,
    input b,
    input cin,
    output reg sum,
    output reg carry
    );
    
    always@(*)begin
        {carry,sum} = a + b + cin;
    end
    
    
endmodule
