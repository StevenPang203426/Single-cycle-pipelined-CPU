`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/12/10 19:16:08
// Design Name: 
// Module Name: testbench
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


module testbench(
    );
    logic CLK100MHZ,BTNC;
    logic BTNL,BTNR;
    logic [15:0] SW;
    logic [7:0] AN;
    logic [6:0] A2G;
    top T(CLK100MHZ,BTNC,BTNL,BTNR,SW,AN,A2G);
    initial
    begin
        #0; BTNC <= 1;
        #2; BTNC <= 0;
        #2; BTNL <= 1; BTNR <= 1;
        #2; SW<=16'b00000100_00001000;
    end
    always
    begin
        CLK100MHZ <= 1; #5; CLK100MHZ <= 0;#5;
    end
        
    /*
    logic  clk;
    logic  reset;
    logic [31:0] writedata,dataadr;
    logic        memwrite;
    
    //instantiate device to be tested
    top dut(clk,reset,writedata,dataadr,memwrite);
    
    //initialize test
    initial
    begin
        reset <=1; # 22 ;reset <=0;
    end
    
    //generate clock to sequence tests
    always
    begin
        clk <=1; # 5 ;clk <=0; # 5;
    end
    
    //check results
    always@(negedge clk)
    begin
        if(memwrite)
        begin
            if(dataadr===84&writedata===7)
            begin
                $display("Simulation succeeded");
                $stop;
            end
            else if(dataadr !==80)
            begin
                $display("Simulation failed");
                $stop;
            end
        end
    end*/
endmodule
