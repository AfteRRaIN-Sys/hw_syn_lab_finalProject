`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.12.2021 12:39:59
// Design Name: 
// Module Name: ToAscii
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


module ToAscii(input [3:0]bcd, output [7:0]ascii_out);
    
    reg [7:0]ascii;
    assign ascii_out = ascii; 
    always @(bcd) begin
        case (bcd)
            4'd0  : ascii <=  8'h30 ;
            4'd1  : ascii <=  8'h31 ;
            4'd2  : ascii <=  8'h32 ;
            4'd3  : ascii <=  8'h33 ;
            4'd4  : ascii <=  8'h34 ;
            4'd5  : ascii <=  8'h35 ;
            4'd6  : ascii <=  8'h36 ;
            4'd7  : ascii <=  8'h37 ;
            4'd8  : ascii <=  8'h38 ;
            4'd9  : ascii <=  8'h39 ;
            //add minus
            4'hA  : ascii <=  8'h2b ;
            4'hB  : ascii <=  8'h2d ;
            //period
            4'hE  : ascii <=  8'h2e ;
            default : ascii <=  8'hff ;
        endcase
    end
endmodule

