// duty cycle 50% w/o using counter
module clk_div_3 (
    input clk, rst_n,
    output clkout
);
    reg q0,q1,q2;
    wire d0;

    always @(posedge clk or negedge rst_n) begin
        if(!rst_n)begin
            q0 <= 1'b0;
            q1 <= 1'b0;
        end
        else begin
            q0 <= d0;
            q1 <= q0;
        end
    end

    always @(posedge clk or negedge rst_n) begin
        if(!rst_n)
            q2 <= 1'b0;
        else
            q2 <= q1;
    end

    assign d0 = ~q0 & ~q1;
    assign clkout = q1 | q2;
    
endmodule