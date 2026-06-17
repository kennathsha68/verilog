module mealy_1010_nonoverlap(
    input clk,
    input rst,
    input x,
    output reg y
);

reg [1:0] state, next_state;

parameter S0 = 2'b00,
          S1 = 2'b01,
          S2 = 2'b10,
          S3 = 2'b11;

always @(posedge clk or posedge rst)
begin
    if(rst)
        state <= S0;
    else
        state <= next_state;
end

always @(*)
begin
    next_state = state;

    case(state)
        S0: next_state = x ? S1 : S0;
        S1: next_state = x ? S1 : S2;
        S2: next_state = x ? S3 : S0;
        S3: next_state = x ? S1 : S0;
        default: next_state = S0;
    endcase
end

always @(*)
begin
    y = 1'b0;

    case(state)
        S3: if(x == 1'b0)
                y = 1'b1;
    endcase
end

endmodule
