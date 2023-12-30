module comparator
(
    input logic [31:0] op1, op2,
    output logic eq
);

    always_comb begin
        eq = (op1 == op2);
    end

endmodule
