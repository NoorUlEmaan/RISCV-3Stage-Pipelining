module data_cache
(
    input logic rst, clk, dmem_sel, wr,
    input logic [3:0] mask,
    input logic [31:0] addr, dmem_data_wr,
    output logic [31:0] dmem_data_rd
);

    reg [31:0] cache_memory [63:0];

    assign dmem_data_rd = (dmem_sel & ~wr) ? cache_memory[addr[31:2]] : 32'd0;

    always_ff @(negedge clk) 
    begin
        if (dmem_sel && wr)
        begin
            if (mask[0]) cache_memory[addr[31:2]][7:0]   = dmem_data_wr[7:0];
            if (mask[1]) cache_memory[addr[31:2]][15:8]  = dmem_data_wr[15:8];
            if (mask[2]) cache_memory[addr[31:2]][23:16] = dmem_data_wr[23:16];
            if (mask[3]) cache_memory[addr[31:2]][31:24] = dmem_data_wr[31:24];
        end
    end

endmodule
