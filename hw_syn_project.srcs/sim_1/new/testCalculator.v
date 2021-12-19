`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/18/2021 03:46:37 PM
// Design Name: 
// Module Name: testCalculator
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


module testCalculator();
    reg clk;
    reg RsRx;
    wire RsTx;
    
    calculator c(clk,RsRx,RsTx);
    
    always #10 clk = ~clk; //period = 20
    initial begin
        #0
        clk = 1'b0;
        RsRx = 1;
        
        #36000000
        
        #65000 //0x31
        RsRx = 0; // start bit
        
        #6500
        RsRx = 0;
        #6500
        RsRx = 0;
        #6500
        RsRx = 1;
        #6500
        RsRx = 1;
        #6500
        RsRx = 0;
        #6500
        RsRx = 0;
        #6500
        RsRx = 0;
        #6500
        RsRx = 1;
        
        //wait
        #10000000
        RsRx = 1;
        #6500
        RsRx = 1;
        #6500
        RsRx = 1;
        
        RsRx = 0; // start bit
        //0x2e
        #6500
        RsRx = 0;
        #6500
        RsRx = 0;
        #6500
        RsRx = 1;
        #6500
        RsRx = 0;
        #6500
        RsRx = 1;
        #6500
        RsRx = 1;
        #6500
        RsRx = 1;
        #6500
        RsRx = 0;
        
        //wait
        #10000000
        RsRx = 1;
        #6500
        RsRx = 1;
        #6500
        RsRx = 1;
        
        RsRx = 0; // start bit
        //0x35
        #6500
        RsRx = 0;
        #6500
        RsRx = 0;
        #6500
        RsRx = 1;
        #6500
        RsRx = 1;
        #6500
        RsRx = 0;
        #6500
        RsRx = 1;
        #6500
        RsRx = 0;
        #6500
        RsRx = 1;
        
        //wait
        #10000000
        RsRx = 1;
        #6500
        RsRx = 1;
        #6500
        RsRx = 1;
        
        RsRx = 0; // start bit
        //0x0a
        #6500
        RsRx = 0;
        #6500
        RsRx = 0;
        #6500
        RsRx = 0;
        #6500
        RsRx = 0;
        #6500
        RsRx = 1;
        #6500
        RsRx = 0;
        #6500
        RsRx = 1;
        #6500
        RsRx = 0;
        
    end
    
endmodule
