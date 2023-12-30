module counter
(
    input logic rst, clk,
    output logic [31:0] count
);

    always_ff @(posedge clk)
    begin
        if (rst)
            count <= 32'h00000000;
        else
            count <= count + 1;
    end

endmodule
