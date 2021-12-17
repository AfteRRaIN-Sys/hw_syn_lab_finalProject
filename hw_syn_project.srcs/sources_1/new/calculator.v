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
    
    wire [111:0] o_dout;
    
    baudrate_gen br_gen(clk, baud);
    receiver receiver(baud, RsRx, received, data_out);
    transmitter transmitter(baud, 
    data_in, ena, sent, RsTx);
    
    //input converter - buffer
    //buffer 14 bytes
    //input : baud, [7:0]data_in, ena
    //out : [47:0] nums, [2:0]ops, calReady
    inputModule n1(baud, data_out, received, nums, ops, calReady);
   
    //cmd controller == state machine
    //out : [48:0]cal_num(signed),
    CalController c1(cal_num, done,overflow,nums,ops,calReady,baud);
    
    //output converter - buffer
    outputModule o1(baud, cal_num, done, overflow, o_dout);
    
    reg [5:0]send_counter = 0;
    always @(done or sent or clk) begin
        if (send_counter > 6'd0 && send_counter < 6'd15  && sent) begin
            send_counter = send_counter +6'b1;
        end
        else if (send_counter >= 6'd15 && send_counter < 6'd17 && clk == 1'b1) begin
            send_counter = send_counter +6'b000001;
        end
        else if (send_counter == 6'd17) begin
            send_counter = 6'd0;
        end
        else if (done == 5'd1) begin
            send_counter = 6'b01;
        end
    end
    //transmitter
    always @(posedge baud) begin
        if (ena == 1) ena = 0;
        if (~last_rec & received) begin
            case (send_counter)
                5'd1 : data_in <= o_dout[111:111-7];
                5'd2 : data_in <= o_dout[111-8:111-8-7];
                5'd3 : data_in <= o_dout[111-16:111-16-7];
                5'd4 : data_in <= o_dout[111-24:111-24-7];
                5'd5 : data_in <= o_dout[111-32:111-32-7];
                5'd6 : data_in <= o_dout[111-40:111-40-7];
                5'd7 : data_in <= o_dout[111-48:111-48-7];
                5'd8 : data_in <= o_dout[111-56:111-56-7];
                5'd9 : data_in <= o_dout[111-64:111-64-7];
                5'd10 : data_in <= o_dout[111-72:111-72-7];
                5'd11 : data_in <= o_dout[111-80:111-80-7];
                5'd12 : data_in <= o_dout[111-88:111-88-7];
                5'd13 : data_in <= o_dout[111-96:111-96-7];
                5'd14 : data_in <= o_dout[111-104:111-104-7];
                5'd15 : data_in <= 8'h0a;
                5'd16 : data_in <= 8'h0d;
                default : data_in <= data_out;
            endcase
            if (data_in != 8'hFF) ena = 1;
        end
        last_rec = received;
    end
    
endmodule
