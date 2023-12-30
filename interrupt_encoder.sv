module interrupt_encoder (
    input logic timer_int,
    output logic [31:0] cause
);

    always_comb begin
        cause = (timer_int) ? 32'h80000000 : 32'h00000000;
    end

endmodule
