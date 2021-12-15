`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/14/2021 03:44:31 PM
// Design Name: 
// Module Name: calculator
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


module calculator(
    input clk,
    input RsRx,
    output RsTx
    );

    reg ena, last_rec;
    reg [7:0] data_in;
    wire [7:0] data_out;
    wire sent, received, baud;
    
    baudrate_gen br_gen(clk, baud);
    receiver receiver(baud, RsRx, received, data_out);
    transmitter transmitter(baud, data_in, ena, sent, RsTx);
    
    //input converter - buffer
    
    //cmd controller == state machine
    
    //output converter - buffer

    always @(posedge baud)
    begin
        if (ena == 1) ena = 0;
        
        if (~last_rec & received) begin
            data_in = data_out+1'b1;
            if (data_in != 8'hFF) ena = 1;
        end
        last_rec = received;
    end
    
endmodule
