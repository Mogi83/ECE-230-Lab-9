module mux_4to1_8b(
    input [7:0] A,
	input [7:0] B,
	input [7:0] C,
    input [7:0] D,
    input [1:0] sel,
    output [7:0] Y
    );
    
    // X ? P : Q ---> "if X is true, use P, otherwise use Q"
    
    // Main difference from the last lab is no enable input and our Y is now 8 bits
	assign Y = (sel == 2'b00) ? A :
               (sel == 2'b01) ? B :
               (sel == 2'b10) ? C :
                                D;
                      	
endmodule