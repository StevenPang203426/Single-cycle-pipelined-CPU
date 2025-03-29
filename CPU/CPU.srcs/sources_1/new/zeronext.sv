`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/12/13 15:48:52
// Design Name: 
// Module Name: zeronext
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


module zeronext(
    input  logic [15:0] a,
    output logic [31:0] y
    );
    assign y={{16{1'b0}},a};
endmodule
