module d_latch(
    input D, E,
    output reg Q,
    output NotQ
);

    // E = 0, D = 0, Q holds (no change)
    // E = 0, D = 1, Q holds (no change)
    // E = 1, D = 0, Q is 0
    // E = 1, D = 1, Q is 1
    
    always @(D, E) begin
        // if E is high (1) then we set Q to val D
        if (E)
            Q <= D;
    end
    
    assign NotQ = ~Q;

endmodule