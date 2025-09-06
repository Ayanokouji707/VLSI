`timescale 1ns / 1ps

module ALU_tb;

    parameter WIDTH = 4;

    // Testbench signals
    reg  [WIDTH-1:0] A, B;
    reg  [2:0]       ALU_Sel;
    wire [WIDTH-1:0] ALU_Out;
    wire CarryOut;

    // Instantiate Unit Under Test (UUT)
    ALU #(.WIDTH(WIDTH)) uut (
        .A(A),
        .B(B),
        .ALU_Sel(ALU_Sel),
        .ALU_Out(ALU_Out),
        .CarryOut(CarryOut)
    );

    integer i; // loop variable

    initial begin
        $display("----------------------------------------------------");
        $display(" TIME |   A   |   B   | SEL |  OUT  | CARRY ");
        $display("----------------------------------------------------");

        // Example test values
        A = 4'b1011;  // 11 in decimal
        B = 4'b0101;  // 5 in decimal

        // Loop through all 8 ALU operations (000 to 111)
        for (i = 0; i < 8; i = i + 1) begin
            ALU_Sel = i[2:0];
            #10; // wait 10 ns between operations
        end

        $display("----------------------------------------------------");
        $finish;
    end

    // Monitor signal changes
    initial begin
        $monitor(" %4t | %b | %b | %03b | %b |   %b ",
                 $time, A, B, ALU_Sel, ALU_Out, CarryOut);
    end

endmodule