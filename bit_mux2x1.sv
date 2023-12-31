module bit_mux2x1 
(
    input logic sel,
    input logic in1, in2,
    output logic out 
);
    
    always_ff @(sel or in1 or in2) begin
        case (sel)
            1'b0: out <= in1;
            1'b1: out <= in2;
        endcase
    end

endmodule
