`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/12/09 15:09:30
// Design Name: 
// Module Name: maindec
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


module maindec(
    input  logic [5:0] op,
    output logic       memtoreg,memwrite,
    output logic       branch,alusrc,
    output logic       regdst,regwrite,
    output logic       jump,
    output logic [2:0] aluop
    );
    logic[9:0]controls;
    assign {regwrite,regdst,alusrc,branch,memwrite,memtoreg,jump,aluop}=controls;
    always_comb
        case(op)
            6'b000000: controls<=10'b1100000010;//R
            6'b100011: controls<=10'b1010010000;//lw
            6'b101011: controls<=10'b0010100000;//sw
            6'b000100: controls<=10'b0001000001;//beq
            6'b001000: controls<=10'b1010000000;//addi
            6'b000010: controls<=10'b0000001000;//jump
            6'b000101: controls<=10'b0000000001;//bne
            6'b001101: controls<=10'b1010000011;//ori
            6'b001100: controls<=10'b1010000100;//andi
            default:   controls<=10'bxxxxxxxxxx;
        endcase
endmodule
