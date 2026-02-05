module alu #(
    parameter WIDTH = 32
)(
    input  logic                 clk,
    input  logic                 rst_n,
    input  logic [WIDTH-1:0]     operand_a,
    input  logic [WIDTH-1:0]     operand_b,
    input  logic [3:0]           alu_ctrl,
    output logic [WIDTH-1:0]     alu_result,
    output logic                 zero_flag
);

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            alu_result <= '0;
        end else begin
            case (alu_ctrl)
                4'b0000: alu_result <= operand_a + operand_b; // ADD
                4'b0001: alu_result <= operand_a - operand_b; // SUB
                4'b0010: alu_result <= operand_a & operand_b; // AND
                4'b0011: alu_result <= operand_a | operand_b; // OR
                4'b0100: alu_result <= operand_a ^ operand_b; // XOR
                4'b0101: alu_result <= operand_a << operand_b[4:0]; // SLL
                4'b0110: alu_result <= operand_a >> operand_b[4:0]; // SRL
                default: alu_result <= '0;
            endcase
        end
    end

    assign zero_flag = (alu_result == 0);

endmodule

