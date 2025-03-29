`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/12/13 20:29:35
// Design Name: 
// Module Name: getx
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


module getx(
    input logic [7:0]a,b,
    input logic [11:0]c,
    output logic [39:0]x
    );
    logic [11:0] A,B,C;
    Bin2BCD8bit a_({4'b0000,a},A);
    Bin2BCD8bit b_({4'b0000,b},B);
    Bin2BCD8bit c_(c,C);
    assign x=  {1'b0,A[7:4],1'b0,A[3:0],
                1'B0,B[7:4],1'b0,B[3:0],
                5'b10000,1'b0,C[11:8],
                1'b0,C[7:4],1'b0,C[3:0]
                };
    
    
endmodule
