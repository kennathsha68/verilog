`timescale 1ns / 1ps

module foutbitcomp(
    input [3:0]a,
    input [3:0]b,
    
    output reg eq,
    output reg gre,
    output reg les
    );
    
    always@(*)begin
    
    gre =0;les=0;eq=0;
    
    if(a>b)
        gre = 1;
    else if(a<b)
        les = 1;
    else
        eq=1;
        
    end
            
    endmodule
