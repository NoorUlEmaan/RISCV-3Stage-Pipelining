module branch_condition
(
    input   logic [2:0] br_op,
    input   logic [31:0] operand1, operand2,
    output  logic br_taken
);
 
localparam NB = 3'b000;   
localparam BEQ = 3'b001;
localparam BNE = 3'b010;
localparam BLT = 3'b011;
localparam UC = 3'b100;

always_comb
begin
    br_taken = 1'b0;

    case (br_op)
        BEQ: br_taken = ($signed(operand1) == $signed(operand2)) ? 1'b1 : 1'b0;
        BNE: br_taken = ($signed(operand1) != $signed(operand2)) ? 1'b1 : 1'b0;
        BLT: br_taken = ($signed(operand1) < $signed(operand2)) ? 1'b1 : 1'b0;
        UC:  br_taken = 1'b1;
        NB:  br_taken = 1'b0;
    endcase
end

endmodule
