`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.06.2024 01:37:55
// Design Name: 
// Module Name: ALU_8_Bit
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ALU_8_Bit(
        input [7:0] a,
        input [7:0] b,
        input [1:0] alu_cont,
        input carry_in,
        output reg [7:0] alu_out,
        output reg carry_out
    );
    reg [8:0] over;
    always@(*) begin
        case(alu_cont)
            2'b00: alu_out = ~(a & b);
            2'b01: alu_out = a | b;
            2'b10: alu_out = a ^ b;
            2'b11: alu_out = a + b + carry_in;
            default: alu_out = ~(a & b);
        endcase
        over = {1'b0,a} + {1'b0,b};
        carry_out = over[8];
    end
endmodule
