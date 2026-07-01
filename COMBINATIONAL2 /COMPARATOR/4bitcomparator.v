`timescale 1ns / 1ps

module foutbitcomp(
    input [3:0]a,
    input [3:0]b,
    
    output reg eq,
    output reg gre,
    output reg les
    );
    
    always@(*)begin
    
    if(a>b)
        assign gre = 1;
    else if(a<b)
        assign les = 1;
    else
        assign eq=1;
        
    end
            
    endmodule
