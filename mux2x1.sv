module mux2x1 (
    input logic sel,
    input logic [31:0] in1, in2,
    output logic [31:0] out 
);
    
    always_ff @(posedge sel)
    begin
        if (sel)
            out <= in2;
        else
            out <= in1;
    end

endmodule
