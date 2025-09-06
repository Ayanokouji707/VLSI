`timescale 1ns / 1ps

module ALU #(
    parameter WIDTH = 4               // Width of inputs/outputs
)(
    input  [WIDTH-1:0] A, B,          // ALU inputs
    input  [2:0]       ALU_Sel,       // Operation select
    output reg [WIDTH-1:0] ALU_Out,   // ALU output
    output reg CarryOut               // Carry/borrow flag
);

    always @(*) begin
        case (ALU_Sel)
            3'b000: {CarryOut, ALU_Out} = A + B;          // ADD
            3'b001: {CarryOut, ALU_Out} = A - B;          // SUB
            3'b010: begin ALU_Out = A & B; CarryOut = 0; end // AND
            3'b011: begin ALU_Out = A | B; CarryOut = 0; end // OR
            3'b100: begin ALU_Out = ~A;   CarryOut = 0; end // NOT
            3'b101: begin ALU_Out = A ^ B; CarryOut = 0; end // XOR
            3'b110: begin ALU_Out = A << 1; CarryOut = A[WIDTH-1]; end // Shift Left
            3'b111: begin ALU_Out = A >> 1; CarryOut = A[0]; end      // Shift Right
            default: begin ALU_Out = {WIDTH{1'b0}}; CarryOut = 0; end
        endcase
    end

endmodule