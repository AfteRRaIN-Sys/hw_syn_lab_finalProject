`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.12.2021 12:53:17
// Design Name: 
// Module Name: testAscii
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


module testAscii();
    reg [3:0]in;
    wire [7:0]ascii;
    ToAscii t1(in,ascii);
    initial begin
        #0
        in = 4'd0;
        #10
        in = 4'd1;
        #10
        in = 4'd2;
        #10
        in = 4'd3;
        #10
        in = 4'd4;
        #10
        in = 4'd5;
        #10
        in = 4'd6;
        #10
        in = 4'd7;
        #10
        in = 4'd8;
        #10
        in = 4'd9;
    end
endmodule
