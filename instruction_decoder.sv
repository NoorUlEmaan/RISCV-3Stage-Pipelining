module instruction_decoder (
    input [31:0] instruction,
    output logic [2:0] funct3,
    output logic [4:0] rs1, rs2, rd,
    output logic [6:0] funct7, opcode,
    output logic [31:0] imm
);

localparam R_TYPE = 7'b0110011;
localparam I_TYPE = 7'b0010011;
localparam S_TYPE = 7'b0100011;
localparam B_TYPE = 7'b1100011;
localparam J_TYPE = 7'b1101111;
localparam LOAD   = 7'b0000011;
localparam JALR   = 7'b1100111;
localparam LUI    = 7'b0110111;
localparam AUIPC  = 7'b0010111;
localparam CSRRW  = 7'b1110011;

assign opcode = instruction[6:0];

always_comb begin
    case (opcode)
        R_TYPE, I_TYPE, LOAD, JALR, S_TYPE, CSRRW: 
            begin
                funct3 = instruction[14:12];
                rs1 = instruction[19:15];
                rs2 = (opcode == R_TYPE) ? instruction[24:20] : 5'd0;
                rd = instruction[11:7];
                imm = $signed((opcode == I_TYPE || opcode == LOAD || opcode == JALR || opcode == CSRRW) ? instruction[31:20] : 32'd0);
            end

        S_TYPE: 
            begin
                funct3 = instruction[14:12];
                rs1 = instruction[19:15];
                rs2 = instruction[24:20];
                imm = $signed({instruction[31:25], instruction[11:7]});
            end

        B_TYPE: 
            begin
                funct3 = instruction[14:12];
                rs1 = instruction[19:15];
                rs2 = instruction[24:20];
                imm = $signed({instruction[31], instruction[7], instruction[30:25], instruction[11:8], 1'b0});
            end

        J_TYPE: 
            begin
                rd = instruction[11:7];
                imm = $signed({instruction[31], instruction[19:12], instruction[20], instruction[30:21], 1'b0});
            end

        LUI, AUIPC: 
            begin
                rd = instruction[11:7];
                imm = {instruction[31:12], 12'b0};
            end

        default: 
            begin
                funct3 = 3'd0;
                funct7 = 7'd0;
                rs1 = 5'd0;
                rs2 = 5'd0;
                rd = 5'd0;
                imm = 32'd0;
            end
    endcase
end

endmodule
