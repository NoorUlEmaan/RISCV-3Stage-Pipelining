module hazard_detection_unit (
    input logic [4:0] rs1, rs2, rd,
    input logic [6:0] opcode,
    output logic stall
);

    // Hazard detection logic for load-use hazard
    assign stall = (|rd) && (opcode == 7'b0000011) && (rd == rs1 || rd == rs2);

endmodule
