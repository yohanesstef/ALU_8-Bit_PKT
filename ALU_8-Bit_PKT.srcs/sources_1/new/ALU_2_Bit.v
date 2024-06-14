`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.06.2024 02:29:03
// Design Name: 
// Module Name: ALU_2_Bit
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


module ALU_2_Bit(
        input [1:0] a,b,
        input [1:0] alu_cont,
        input carry_in,
        output reg [1:0] alu_out,
        output reg carry_out
    );
    reg [2:0] over;
    
    always@(*) begin
        case(alu_cont)
            2'b00: alu_out = ~(a & b);
            2'b01: alu_out = a | b;
            2'b10: alu_out = a ^ b;
            2'b11: alu_out = a + b + carry_in;
            default: alu_out = ~(a & b);
        endcase
        over = {1'b0,a} + {1'b0,b};
        carry_out = over[2];
    end
endmodule
