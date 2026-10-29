module demux_1to4_8b(
    input [7:0] data,
    input [1:0] sel,
    output reg [7:0] A,
    output reg [7:0] B,
    output reg [7:0] C,
    output reg [7:0] D
    );
    
    
    always @(*) begin 
        case(sel)
            2'b00: {D, C, B, A} <= {8'b0, 8'b0, 8'b0, data}; // sel 0 goes to A
            2'b01: {D, C, B, A} <= {8'b0, 8'b0, data, 8'b0}; // sel 1 goes to B
            2'b10: {D, C, B, A} <= {8'b0, data, 8'b0, 8'b0}; // sel 2 goes to C
            2'b11: {D, C, B, A} <= {data, 8'b0, 8'b0, 8'b0}; // sel 3 goes to D
        endcase
    end

endmodule
