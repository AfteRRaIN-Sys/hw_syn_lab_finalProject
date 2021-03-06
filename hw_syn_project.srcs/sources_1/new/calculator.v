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
    //buffer 14 bytes
    //input : baud, [7:0]data_in, ena
    //out : [47:0] nums, [2:0]ops, calReady
    wire [47:0]nums;
    wire [2:0]ops;
    inputModule n1(baud, data_out, received, nums, ops, calReady);
   
    //cmd controller == state machine
    //out : [48:0]cal_num(signed),
    wire [48:0]cal_num;
    CalController c1(cal_num, done,overflow,nums,ops,calReady,baud);
    
    //output converter - buffer
    wire [111:0] o_dout;
    outputModule o1(baud, cal_num, done, overflow, o_dout);
    
    reg [7:0]send_counter = 8'd1;
    
    initial begin
        send_counter = 8'd1;
    end
    always @(posedge baud) begin
        if (send_counter > 8'd0 && send_counter < 8'd70  && sent == 1'b1) begin
            send_counter = send_counter +8'b1;
            //ena <= 1'b1;
        end
        else if (send_counter >= 8'd70 && send_counter < 8'd74) begin
            send_counter <= send_counter +8'b1;
        end
        else if (send_counter >= 8'd74) begin
            send_counter <= 8'd0;
        end
        else if (send_counter == 8'd0 && data_out == 8'h0d) begin
            send_counter <= 8'd1;
        end
    end
    
    //transmitter
    always @(posedge baud) begin
        if (ena == 1) ena = 0;
        if (send_counter > 8'd0) begin
            case (send_counter)
                8'd1 : data_in = 8'h0a;
                8'd5 : data_in = 8'h0d;
                8'd9 : data_in = o_dout[111:111-7];
                8'd13 : data_in = o_dout[111-8:111-8-7];
                8'd17 : data_in = o_dout[111-16:111-16-7];
                8'd21 : data_in = o_dout[111-24:111-24-7];
                8'd25 : data_in = o_dout[111-32:111-32-7];
                8'd29 : data_in = o_dout[111-40:111-40-7];
                8'd33 : data_in = o_dout[111-48:111-48-7];
                8'd37 : data_in = o_dout[111-56:111-56-7];
                8'd41 : data_in = o_dout[111-64:111-64-7];
                8'd45 : data_in = o_dout[111-72:111-72-7];
                8'd49 : data_in = o_dout[111-80:111-80-7];
                8'd53 : data_in = o_dout[111-88:111-88-7];
                8'd57 : data_in = o_dout[111-96:111-96-7];
                8'd61 : data_in = o_dout[111-104:111-104-7];
                8'd65 : data_in = 8'h0a;
                8'd69 : data_in = 8'h0d;
                default : data_in = 8'hFF;
            endcase
            if (data_in != 8'hFF) ena = 1;
        end
        else if (send_counter == 8'd0 && ~last_rec && received) begin
            case (data_out)
                8'h30 : data_in <= data_out;
                8'h31 : data_in <= data_out;
                8'h32 : data_in <= data_out;
                8'h33 : data_in <= data_out;
                8'h34 : data_in <= data_out;
                8'h35 : data_in <= data_out;
                8'h36 : data_in <= data_out;
                8'h37 : data_in <= data_out;
                8'h38 : data_in <= data_out;
                8'h39 : data_in <= data_out;
                //operand
                8'h2b : data_in <= data_out;
                8'h2d : data_in <= data_out;
                8'h2a : data_in <= data_out;
                //clear
                8'h63 : data_in <= data_out;
                //period
                8'h2e : data_in <= data_out;
                //enter
                8'h0d : data_in <= data_out;
                default : data_in <=8'hFF; 
            endcase
              //data_in = 8'h79;
            if (data_in != 8'hFF) ena = 1;
        end
        if (send_counter == 8'd0) begin
            last_rec = received;
        end
    end
    
endmodule
