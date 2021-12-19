`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.12.2021 22:06:28
// Design Name: 
// Module Name: inputModule
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


module outputModule(
    input baud,
    input [48:0] cal_num,
    input done,
    input overflow,
    output [111:0] o_dout);
    
    reg [111:0] res_buffer = 111'd0;
    assign o_dout = res_buffer;
    reg startCount = 0;
    
    wire [111:0]translated;
    
    wire [7:0]ascii1;
    wire [7:0]ascii2;
    wire [7:0]ascii3;
    wire [7:0]ascii4;
    wire [7:0]ascii5;
    wire [7:0]ascii6;
    wire [7:0]ascii7;
    wire [7:0]ascii8;
    wire [7:0]ascii9;
    wire [7:0]ascii10;
    wire [7:0]ascii11;
    wire [7:0]ascii12;
    
    ToAscii t1(cal_num[47:44],ascii1);
    ToAscii t2(cal_num[47-4:44-4],ascii2);
    ToAscii t3(cal_num[47-8:44-8],ascii3);
    ToAscii t4(cal_num[47-12:44-12],ascii4);
    ToAscii t5(cal_num[47-16:44-16],ascii5);
    ToAscii t6(cal_num[47-20:44-20],ascii6);
    ToAscii t7(cal_num[47-24:44-24],ascii7);
    ToAscii t8(cal_num[47-28:44-28],ascii8);
    ToAscii t9(cal_num[47-32:44-32],ascii9);
    ToAscii t10(cal_num[47-36:44-36],ascii10);
    ToAscii t11(cal_num[47-40:44-40],ascii11);
    ToAscii t12(cal_num[47-44:44-44],ascii12);
    
    
    always @(posedge done) begin
        if (overflow == 1'b0) begin
            //byte0
            if (cal_num[48] == 1'b0) begin
                res_buffer[111:104] <= 8'h2B;
            end
            else begin
                res_buffer[111:104] <= 8'h2D;
            end
            //byte1
            res_buffer[111-8:104-8] <= ascii1;
            //byte2
            res_buffer[111-16:104-16] <= ascii2;
            //byte3
            res_buffer[111-24:104-24] <= ascii3;
            //byte4
            res_buffer[111-32:104-32] <= ascii4;
            //byte5
            res_buffer[111-40:104-40] <= ascii5;
            //byte6
            res_buffer[111-(8*6):104-(8*6)] <= ascii6;
            //byte7
            res_buffer[111-56:104-56] <= 8'h2E;
            //byte8
            res_buffer[111-64:104-64]<= ascii7;
            //byte9
            res_buffer[111-72:104-72]<= ascii8;
            //byte10
            res_buffer[111-80:104-80]<= ascii9;
            //byte11
            res_buffer[111-88:104-88]<= ascii10;
            //byte12
            res_buffer[111-96:104-96]<= ascii11;
            //byte13        
            res_buffer[111-104:104-104]<= ascii12;
        end
        else begin
            //overflow
            res_buffer[111:111-23] <= 24'h4E2F41; //N/A
            res_buffer[111-24:0] <= 88'd0;
        end
    end
    
endmodule

//reg [5:0]om_counter = 6'd0;
//    wire isModuleSending;
    
//    reg [48:0]calResult = 48'd0;
    
//    assign isModuleSending = (om_counter != 6'd0);
    
//    always @(posedge done) begin
//        calResult[48:0] <= cal_num[48:0];
//    end
    
//    always @(posedge baud) begin
//        if (done == 1'b1) begin
//            om_counter <= 6'd1;
//        end
//        else if (om_counter == 6'd15) begin
//            om_counter <= 6'd0;
//        end
//        else if (om_counter < 6'd15) begin
//            om_counter <= om_counter+1'b1;
//        end
//    end
    
//    always @(posedge baud) begin
//        if (isModuleSending) begin
//            case (om_counter) 
//                6'd1 : data_in_buffer[6:0] <= 
//            endcase
//        end
//        else begin
//            data_in_buffer[6:0] <=  data_out[6:0];
//        end
//    end