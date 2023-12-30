module instruction_cache (
    input logic [31:0] addr,
    output logic [31:0] instruction
);

    reg [31:0] cache_memory [1023:0];

    assign instruction = cache_memory[addr[31:2]];

endmodule
