`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/12/10 19:24:28
// Design Name: 
// Module Name: top
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


module top(
    input  logic        CLK100MHZ,
    input  logic        BTNC,
    input  logic        BTNL,
    input  logic        BTNR,
    input  logic [15:0] SW,
    output logic [7:0]  AN,
    output logic [6:0]  A2G
    );
    logic [31:0] pc,instr;
    
    //instantiate processor and memories
    imem imem(.a(pc[7:2]),.rd(instr));
    logic Write;
    logic [31:0] dataAdr,writeData,readData;
     mips mips(.clk(CLK100MHZ),.reset(BTNC),.pc(pc),
                .instr(instr),.memwrite(Write),.aluout(dataadr),
                .writedata(writeData),.readdata(readData));
    dMemoryDecoder  dmd(.clk(CLK100MHZ),
                        .writeEN(Write),
                        .addr(dataAdr[7:0]),
                        .writeData(writeData),
                        .readData(readData),
                        .reset(BTNC),
                        .btnL(BTNL),
                        .btnR(BTNR),
                        .switch(SW),
                        .an(AN),
                        .a2g(A2G));
endmodule
