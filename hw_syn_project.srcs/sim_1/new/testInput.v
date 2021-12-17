`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.12.2021 12:26:10
// Design Name: 
// Module Name: testInput
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


module testInput();
    reg clk;

    reg [7:0]data_in;
    reg ena;
    
    wire [47:0] nums;
    wire [2:0] ops;
    wire calReady;
    
    inputModule n1(clk, data_in, ena, nums, ops, calReady);
    
    always #10 clk = ~clk;
    
    initial begin
        #0
        clk = 0;
        data_in = 8'h00;
        ena = 1'b0;
        
        //send 1.5 then enter
        #50
        data_in = 8'h31;
        ena = 1'b1;
        #20 ena = 1'b0;
        
        #60
        data_in = 8'h39;
        ena = 1'b1;
        #20 ena = 1'b0;
        
        #60 //period
        data_in = 8'h2e;
        ena = 1'b1;
        #20 ena = 1'b0;
        
        #60
        data_in = 8'h35;
        ena = 1'b1;
        #20 ena = 1'b0;
        
        #60
        data_in = 8'h37;
        ena = 1'b1;
        #20 ena = 1'b0;
        
        #60 //enter
        data_in = 8'h0A;
        ena = 1'b1;
        #20 ena = 1'b0;
        
        #60 //minus
        data_in = 8'h2d;
        ena = 1'b1;
        #20 ena = 1'b0;
        
        #60
        data_in = 8'h37;
        ena = 1'b1;
        #20 ena = 1'b0;
        #60
        data_in = 8'h37;
        ena = 1'b1;
        #20 ena = 1'b0;
        #60
        data_in = 8'h37;
        ena = 1'b1;
        #20 ena = 1'b0;
        #60
        data_in = 8'h37;
        ena = 1'b1;
        #20 ena = 1'b0;
        #60
        data_in = 8'h37;
        ena = 1'b1;
        #20 ena = 1'b0;
        #60
        data_in = 8'h37;
        ena = 1'b1;
        #20 ena = 1'b0;

        
        #60 //period
        data_in = 8'h2e;
        ena = 1'b1;
        #20 ena = 1'b0;
        
        #60
        data_in = 8'h39;
        ena = 1'b1;
        #20 ena = 1'b0;
        #60
        data_in = 8'h39;
        ena = 1'b1;
        #20 ena = 1'b0;
        #60
        data_in = 8'h39;
        ena = 1'b1;
        #20 ena = 1'b0;
        #60
        data_in = 8'h39;
        ena = 1'b1;
        #20 ena = 1'b0;
        #60
        data_in = 8'h39;
        ena = 1'b1;
        #20 ena = 1'b0;
        #60
        data_in = 8'h39;
        ena = 1'b1;
        #20 ena = 1'b0;
        
        #60 //enter
        data_in = 8'h0A;
        ena = 1'b1;
        #20 ena = 1'b0;
        
        #60 //minus
        data_in = 8'h2a;
        ena = 1'b1;
        #20 ena = 1'b0;
        
        #60
        data_in = 8'h37;
        ena = 1'b1;
        #20 ena = 1'b0;
        #60
        data_in = 8'h37;
        ena = 1'b1;
        #20 ena = 1'b0;
        #60
        data_in = 8'h37;
        ena = 1'b1;
        #20 ena = 1'b0;
        #60
        data_in = 8'h37;
        ena = 1'b1;
        #20 ena = 1'b0;
        #60
        data_in = 8'h37;
        ena = 1'b1;
        #20 ena = 1'b0;
        #60
        data_in = 8'h37;
        ena = 1'b1;
        #20 ena = 1'b0;

        
        #60 //period
        data_in = 8'h2e;
        ena = 1'b1;
        #20 ena = 1'b0;
        
        #60
        data_in = 8'h39;
        ena = 1'b1;
        #20 ena = 1'b0;
        #60
        data_in = 8'h39;
        ena = 1'b1;
        #20 ena = 1'b0;
        #60
        data_in = 8'h39;
        ena = 1'b1;
        #20 ena = 1'b0;
        #60
        data_in = 8'h39;
        ena = 1'b1;
        #20 ena = 1'b0;
        #60
        data_in = 8'h39;
        ena = 1'b1;
        #20 ena = 1'b0;
        #60
        data_in = 8'h39;
        ena = 1'b1;
        #20 ena = 1'b0;
        
        #60 //enter
        data_in = 8'h0A;
        ena = 1'b1;
        #20 ena = 1'b0;
        
        
        #60
        data_in = 8'h35;
        ena = 1'b1;
        #20 ena = 1'b0;
        #60
        data_in = 8'h37;
        ena = 1'b1;
        #20 ena = 1'b0;
        #60
        data_in = 8'h37;
        ena = 1'b1;
        #20 ena = 1'b0;
        #60
        data_in = 8'h37;
        ena = 1'b1;
        #20 ena = 1'b0;
        #60
        data_in = 8'h37;
        ena = 1'b1;
        #20 ena = 1'b0;
        #60
        data_in = 8'h37;
        ena = 1'b1;
        #20 ena = 1'b0;

        
        #60 //period
        data_in = 8'h2e;
        ena = 1'b1;
        #20 ena = 1'b0;
        
        #60
        data_in = 8'h39;
        ena = 1'b1;
        #20 ena = 1'b0;
        #60
        data_in = 8'h39;
        ena = 1'b1;
        #20 ena = 1'b0;
        #60
        data_in = 8'h39;
        ena = 1'b1;
        #20 ena = 1'b0;
        #60
        data_in = 8'h39;
        ena = 1'b1;
        #20 ena = 1'b0;
        #60
        data_in = 8'h39;
        ena = 1'b1;
        #20 ena = 1'b0;
        #60
        data_in = 8'h39;
        ena = 1'b1;
        #20 ena = 1'b0;
        
        #60 //enter
        data_in = 8'h0A;
        ena = 1'b1;
        #20 ena = 1'b0;
        
    end

endmodule
