module alu_tb;

    logic clk;
    logic rst_n;
    logic [31:0] a, b;
    logic [3:0] alu_ctrl;
    logic [31:0] result;
    logic zero;

    alu dut (
        .clk(clk),
        .rst_n(rst_n),
        .operand_a(a),
        .operand_b(b),
        .alu_ctrl(alu_ctrl),
        .alu_result(result),
        .zero_flag(zero)
    );

    always #5 clk = ~clk;

    initial begin
        // waveform dump
        $dumpfile("dump.vcd");
        $dumpvars(0, alu_tb);

        clk = 0;
        rst_n = 0;
        #10 rst_n = 1;

        // ADD
        a = 10; b = 20; alu_ctrl = 4'b0000;
        #10;

        // SUB
        a = 30; b = 10; alu_ctrl = 4'b0001;
        #10;

        // AND
        a = 32'hF0F0; b = 32'h0FF0; alu_ctrl = 4'b0010;
        #10;

        // SHIFT LEFT
        a = 32'h1; b = 5; alu_ctrl = 4'b0101;
        #10;

        $finish;
    end

endmodule

