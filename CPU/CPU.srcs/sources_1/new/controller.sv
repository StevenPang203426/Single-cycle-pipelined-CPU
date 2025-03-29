`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/12/09 12:57:03
// Design Name: 
// Module Name: controller
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


module controller(
    input  logic [5:0] op,funct,
    input  logic       zero,
    output logic       memtoreg,memwrite,
    output logic       pcsrc,alusrc,
    output logic       regdst,regwrite,
    output logic       jump,
    output logic [2:0] alucontrol
    );
    logic [2:0] aluop;
    logic       branch;
    logic       branchBne;
    maindec md(op,memtoreg,memwrite,branch,
                alusrc,regdst,regwrite,jump,aluop);
    aludec ad(funct,aluop,alucontrol);
    assign branchBne = (!op[3])&op[2]&op[0];//bne:000101²ÅµÃµ½1
    assign pcsrc = (branch & zero)&(branchBne);
endmodule
