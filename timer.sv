module timer
(
    input logic rst, clk,
    input logic [3:0] match,
    output logic timer_int,
    output logic [3:0] count
);

    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            count <= 4'b0;
        end else begin
            count <= count + 1;
        end
    end

    assign timer_int = (count == match) ? 1 : 0;

endmodule
