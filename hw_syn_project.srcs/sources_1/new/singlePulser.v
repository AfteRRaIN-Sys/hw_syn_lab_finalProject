`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/10/2021 04:27:03 PM
// Design Name: 
// Module Name: singlePulser
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

module singlePulser(sig_out, sig_in, clock);
    output sig_out;
    input sig_in;
    input clock;
    
    reg sig_out;
    reg signaled;
    
    initial
    begin
        signaled = 0;
    end
    
    always @(posedge clock)
    begin
        sig_out = 0;
        case({sig_in, signaled})
            2'b01: signaled = 0;
            2'b10: 
                begin
                    signaled = 1;
                    sig_out = 1;
                end
        endcase
    end

endmodule
