module forwarding_unit (
    input logic rf_wr, br_taken,
    input logic [4:0] rs1, rs2, rd,
    output logic fwd_op1, fwd_op2, flush
);

    // Flags indicating whether register values are valid
    logic rs1_valid = |rs1;
    logic rs2_valid = |rs2;

    // Forwarding logic for operand 1
    assign fwd_op1 = (rs1 == rd) && rf_wr && rs1_valid;

    // Forwarding logic for operand 2
    assign fwd_op2 = (rs2 == rd) && rf_wr && rs2_valid;

    // Control signal for flushing pipeline due to branch
    assign flush = br_taken;

endmodule
