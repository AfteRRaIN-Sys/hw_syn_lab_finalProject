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
    
    wire [48:0]cal_num;
    CalController c1(cal_num, done,overflow,nums,ops,calReady,clk);
    
    //output converter - buffer
    wire [111:0] o_dout;
    outputModule o1(clk, cal_num, done, overflow, o_dout);
    
    
    //wire sent;
    //wire RsTx;
    //transmitter transmitter(baud, data_in, ena, sent, RsTx);
    
    
    //--------------------------------------------------------
//    reg [5:0]send_counter = 6'd0;
//    always @(posedge clk) begin
//        if (send_counter > 6'd0 && send_counter < 6'd15  && sent) begin
//            send_counter = send_counter +6'b1;
//        end
//        else if (send_counter >= 6'd15 && send_counter < 6'd17) begin
//            send_counter <= send_counter +6'b1;
//        end
//        else if (send_counter >= 6'd17) begin
//            send_counter <= 6'd0;
//        end
//        else if (done == 1'd0 && send_counter == 6'd0) begin
//            send_counter <= 6'd1;
//        end
//    end
    
//    //transmitter
//    always @(posedge clk) begin
//        if (ena == 1) ena = 0;
//        if (~last_rec & received) begin
//            case (send_counter)
//                5'd1 : data_in <= o_dout[111:111-7];
//                5'd2 : data_in <= o_dout[111-8:111-8-7];
//                5'd3 : data_in <= o_dout[111-16:111-16-7];
//                5'd4 : data_in <= o_dout[111-24:111-24-7];
//                5'd5 : data_in <= o_dout[111-32:111-32-7];
//                5'd6 : data_in <= o_dout[111-40:111-40-7];
//                5'd7 : data_in <= o_dout[111-48:111-48-7];
//                5'd8 : data_in <= o_dout[111-56:111-56-7];
//                5'd9 : data_in <= o_dout[111-64:111-64-7];
//                5'd10 : data_in <= o_dout[111-72:111-72-7];
//                5'd11 : data_in <= o_dout[111-80:111-80-7];
//                5'd12 : data_in <= o_dout[111-88:111-88-7];
//                5'd13 : data_in <= o_dout[111-96:111-96-7];
//                5'd14 : data_in <= o_dout[111-104:111-104-7];
//                5'd15 : data_in <= 8'h0a;
//                5'd16 : data_in <= 8'h0d;
//                default : data_in = data_out;
//            endcase
//            if (data_in != 8'hFF) ena = 1;
//        end
//        last_rec = received;
//    end
    //--------------------------------------------------------
    
    always #10 clk = ~clk;
    
    initial begin
        #0
        clk = 0;
        data_in = 8'h00;
        ena = 1'b0;
        //send_counter = 6'd0;
        
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
        data_in = 8'h0d;
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
        data_in = 8'h0d;
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
        data_in = 8'h0d;
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
        data_in = 8'h0D;
        ena = 1'b1;
        #20 ena = 1'b0;
        
        
        //clear
        #60 //enter
        data_in = 8'h63;
        ena = 1'b1;
        #20 ena = 1'b0;
        
        #60 //enter
        data_in = 8'h0D;
        ena = 1'b1;
        #20 ena = 1'b0;
        
        
        
        //+102003.040506
        #60
        data_in = 8'h2b;
        ena = 1'b1;
        #20 ena = 1'b0;
        #60
        data_in = 8'h31;
        ena = 1'b1;
        #20 ena = 1'b0;
        #60
        data_in = 8'h30;
        ena = 1'b1;
        #20 ena = 1'b0;
        #60
        data_in = 8'h32;
        ena = 1'b1;
        #20 ena = 1'b0;
        #60
        data_in = 8'h30;
        ena = 1'b1;
        #20 ena = 1'b0;
        #60
        data_in = 8'h30;
        ena = 1'b1;
        #20 ena = 1'b0;
        #60
        data_in = 8'h33;
        ena = 1'b1;
        #20 ena = 1'b0;
        
        #60 //period
        data_in = 8'h2e;
        ena = 1'b1;
        #20 ena = 1'b0;
        
        #60
        data_in = 8'h30;
        ena = 1'b1;
        #20 ena = 1'b0;
        #60
        data_in = 8'h34;
        ena = 1'b1;
        #20 ena = 1'b0;
        #60
        data_in = 8'h30;
        ena = 1'b1;
        #20 ena = 1'b0;
        #60
        data_in = 8'h35;
        ena = 1'b1;
        #20 ena = 1'b0;
        #60
        data_in = 8'h30;
        ena = 1'b1;
        #20 ena = 1'b0;
        #60
        data_in = 8'h36;
        ena = 1'b1;
        #20 ena = 1'b0;
  
        #60 //enter
        data_in = 8'h0D;
        ena = 1'b1;
        #20 ena = 1'b0;
        
        //*1.5
        #60 //mult
        data_in = 8'h2a;
        ena = 1'b1;
        #20 ena = 1'b0;
        
        #60
        data_in = 8'h31;
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
        
        #60 //enter
        data_in = 8'h0D;
        ena = 1'b1;
        #20 ena = 1'b0;
        
        
        
          
        
        
    end

endmodule
