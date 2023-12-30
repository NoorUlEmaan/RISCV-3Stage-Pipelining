module en_counter
(
    input logic rst, clk, enable,
    output logic [31:0] count
);

    always_ff @(posedge clk)
    begin
        if (rst)
            count <= 32'h00000000;
        else if (enable)
            count <= count + 1;
    end

endmodule
