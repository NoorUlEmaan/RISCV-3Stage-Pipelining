module uart_datapath (
    input logic reset_i, clk_i,
    input logic [7:0] data_in,
    input logic load_xmt_dreg_o, load_xmt_shftreg_o, start_o, clear_o, clear_baud_o, shift_o,
    output logic counter_baud_of_i, counter_of_i, tx
);

    logic [31:0] bit_count, baud_count;

    logic [7:0] dreg;

    always_ff @(posedge clk_i) begin
        if (reset_i) begin
            dreg <= 0;
        end else if (load_xmt_dreg_o) begin
            dreg <= data_in;
        end
    end

    shift_register shft (
        .clk_i(clk_i),
        .load_byte_i(load_xmt_shftreg_o),
        .shift_i(shift_o),
        .reset_i(reset_i),
        .data_i(dreg),
        .serial_out_o(tx)
    );

    bit_mux2x1 mx1 (
        .sel(start_o),
        .in1(1'b1),
        .in2(tx)
    );

    counter baudcount (
        .clear_baud_o(clear_baud_o),
        .clk_i(clk_i),
        .count(baud_count)
    );

    comparator baudcmp (
        .op1(baud_count),
        .op2(32'd5),
        .eq(counter_baud_of_i)
    );

    en_counter bitcount (
        .rst(clear_o),
        .clk(clk_i),
        .enable(counter_baud_of_i),
        .count(bit_count)
    );

    comparator bitcmp (
        .op1(bit_count),
        .op2(32'd8),
        .eq(counter_of_i)
    );

endmodule
