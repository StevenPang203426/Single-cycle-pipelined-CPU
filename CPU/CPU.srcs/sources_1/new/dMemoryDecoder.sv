`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/12/13 19:54:38
// Design Name: 
// Module Name: dMemoryDecoder
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


module dMemoryDecoder(
    input logic clk,writeEN,
    input logic [7:0]addr,
    input logic [31:0] writeData,
    output logic [31:0] readData,
    input logic reset,btnL,btnR,
    input logic [15:0] switch,
    output logic [7:0]an,
    output logic [6:0] a2g,
    output logic dp
    );
    logic pWrite,mWrite;
    logic [31:0] readdata1,readdata2;
    logic [11:0] led;
    logic [39:0] x;
    
    assign pwrite=writeEN&addr[7];
    assign mwrite=writeEN&(~addr[7]);
    
    dmem dmd(clk,mwrite,addr,writedata,readdata1);
    IO ioread(clk,reset,addr[7],pwrite,addr[3:2],writedata,readdata2,btnL,btnR,switch,led);
    
    assign readdata=addr[7]?readdata2:readdata1;
    
    getx GetX(switch[15:8],switch[7:0],led,x);
    m7seg M7Seg(x,clk,reset,an,a2g,dp);
endmodule
