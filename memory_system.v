module memory_system(
    input [7:0] data,
    input store,
    input [1:0] addr,
    output [7:0] memory
);
    // Given instructions
    ///////////////////////////////////////////
    // This should instantiate 4 instances of
    // byte_memory, and then demultiplex
    // data and store into the one selected by
    // addr
    
    // It should then multiplex the output of the
    // memory specified by addr into the memory
    // output for display on the LEDs

    // you will need 2 demultiplexers:
    // 1. Demultiplex data -> selected byte
    // 2. Demultiplex store -> selected byte

    // and one multiplexer:
    // 1. Multiplex selected byte -> memory
    //
    //////////////////////////////////////////////
    
    wire [7:0] data_to_byte [3:0]; // data routed to each slot (only saved if that slot's store is high)
    wire store_to_byte [3:0];  // the signal telling what slot should save data
    wire [7:0] byte_out [3:0]; // what is held in that current slot with mux selecting which one to read 
    
    // Sending data to a selected slot
    demux_1to4_8b data_demux (
        .data(data),
        .sel(addr),
        .A(data_to_byte[0]),
        .B(data_to_byte[1]),
        .C(data_to_byte[2]),
        .D(data_to_byte[3])
    );
    
    // Tell whichever selected slot to save data
    demux_1to4_1b store_demux (
        .data(store),
        .sel(addr),
        .A(store_to_byte[0]),
        .B(store_to_byte[1]),
        .C(store_to_byte[2]),
        .D(store_to_byte[3])
    );
    
    // loop to build memory slots and wire them
    genvar i;
    generate
        for (i = 0; i < 4; i = i + 1) begin : slots
            byte_memory slot (
                .data(data_to_byte[i]),
                .store(store_to_byte[i]),
                .memory(byte_out[i])
            );
        end
    endgenerate
    
    // Show the data on the LEDs
    mux_4to1_8b out_mux (
        .A(byte_out[0]),
        .B(byte_out[1]),
        .C(byte_out[2]),
        .D(byte_out[3]),
        .sel(addr),
        .Y(memory)
    );
    
endmodule