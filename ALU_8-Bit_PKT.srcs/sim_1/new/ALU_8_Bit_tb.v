`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.06.2024 01:42:32
// Design Name: 
// Module Name: ALU_8_Bit_tb
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

module ALU_8_Bit_tb;
    // Inputs
    reg [7:0] a;
    reg [7:0] b;
    reg [1:0] alu_cont;
    reg carry_in;

    // Outputs
    wire [7:0] alu_out;
    wire carry_out;
    
    //clock untuk test bench
    reg clk;
    reg [18:0] counter; //[0] carry_in, [8:1]b, [16:9]a, [18:17] alu_cont
    
    // Instantiate the Unit Under Test (UUT)
    ALU_8_Bit uut (
        .a(a),
        .b(b),
        .alu_cont(alu_cont),
        .carry_in(carry_in),
        .alu_out(alu_out),
        .carry_out(carry_out)
    );
    
    initial begin
        // Initialize Inputs
        a = 8'd0;
        b = 8'd0;
        alu_cont = 2'b00;
        carry_in = 1'b0;
        clk = 0;
        counter = 19'd0;
    end
    
    always #1 clk = ~clk;
    
    always @(posedge clk)begin
        counter <= counter + 1;
        carry_in <= counter[0];
        b <= counter[8:1];
        a <= counter[16:9];
        alu_cont <= counter[18:17];
    end
   endmodule
