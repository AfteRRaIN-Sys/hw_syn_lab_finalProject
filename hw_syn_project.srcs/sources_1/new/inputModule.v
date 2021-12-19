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


module inputModule(
    input clk,
    input [7:0]data_in,
    input ena,
    //output wire [47:0]nums, //48 bit
    output wire [47:0]mock_num,
    //output [2:0]ops_out,
    output wire [2:0]mock_ops,
//    output cal_out
    output wire mock_calout
);

    assign mock_num = 48'h000000000010;
    assign mock_ops = 3'b001;
    
    reg m = 0;
    integer j = 0;
    always @(posedge clk) begin
        j <= j+1;
        if (j >= 2000) begin
            m = ~m;
            j<=0;
        end
    end
    assign mock_calout = m;
    
    reg [23:0] int_buffer;
    reg [23:0] fp_buffer;
    
    reg [47:0] nums_buffer;
    assign nums = nums_buffer;
    
    reg state;
    
    reg [5:0]fp_counter ;
    reg [3:0]translated;
    
    reg calReady;
    wire cal_out1;
    singlePulser pulse1(cal_out1, calReady, clk);
    singlePulser pulse2(cal_out2, cal_out1, clk);
    assign cal_out = cal_out1 | cal_out2;
    
    reg [2:0]ops;
    assign ops_out = ops;
    
    reg last_ena;
    
    reg change_state;
    
    reg write_en;
    
    reg n_clk;
    
    reg [1:0]period_counter;
    
    //reg send_state;
    
    wire isNum;
    assign isNum = translated == 4'd0 || translated == 4'd1 || translated == 4'd2 || translated == 4'd3 || translated == 4'd4 || translated == 4'd5 || translated == 4'd6 || translated == 4'd7 || translated == 4'd8 || translated == 4'd9;
    
//    wire [23:0]tmp_int;
//    assign tmp_int = ()
    
    //reg next_clk;
    //translator(data_in, [4:0]translated)
    
    initial begin
        //change_state <=1'b0;
        n_clk <= 1'b0;
        period_counter <= 2'b00;
        write_en <= 1'b0;
        calReady <= 1'b0;
        ops <= 3'd0;
        state <= 1'b0;   
        fp_buffer <= 24'd0;
        int_buffer <= 24'd0;
        translated <= 4'd0;
        nums_buffer <= 48'd0;
        //last_ena <= 1'b0;
        fp_counter <= 6'd0;
    end
    always @(data_in) begin
        case (data_in)
            8'h30 : translated <=4'd0;
            8'h31 : translated <=4'd1;
            8'h32 : translated <=4'd2;
            8'h33 : translated <=4'd3;
            8'h34 : translated <=4'd4;
            8'h35 : translated <=4'd5;
            8'h36 : translated <=4'd6;
            8'h37 : translated <=4'd7;
            8'h38 : translated <=4'd8;
            8'h39 : translated <=4'd9;
            //operand
            8'h2b : translated <=4'hA;
            8'h2d : translated <=4'hB;
            8'h2a : translated <=4'hC;
            //clear
            8'h63 : translated <=4'hD;
            //period
            8'h2e : translated <=4'hE;
            //enter
            8'h0d : translated <=4'hF;
            
            default : translated <=4'h0; 
        endcase
    end
    
//    always @(posedge clk) begin
//        if last_ena <= ena;
//    end

    always @(posedge clk) begin
        n_clk = ~n_clk;
    end
    
    integer i;
    always @(posedge clk) begin
//        if (change_state) begin
//            change_state = 1'b0;
//        end
        period_counter <= period_counter + 2'd1;
        if (write_en == 1'b1) begin
            write_en <= 1'b0;
        end
        if (calReady == 1'b1) begin
            calReady <= 1'b0;
            //ops <= 2'b000;
        end
//        if (ena) begin
            if (translated == 4'hE) begin
                //get period
                state <= 1'b1;
                fp_counter <= 6'd0;
                write_en <= 1'b1;
            end
            else if (translated == 4'hf) begin
                //get enter key
                nums_buffer[23:0] <= fp_buffer;
                nums_buffer[47:24] <= int_buffer;
                if (calReady == 1'b0) begin calReady <= 1'b1; end
                state <= 1'b0;   
                fp_buffer <= 24'd0;
                int_buffer <= 24'd0;
                translated <= 4'd0; //might cause trouble
                period_counter <= 2'd0;
            end
            else if (translated == 4'hA) begin
                //get plus
                ops <= 3'd0;
                write_en <= 1'b1;
            end
            else if (translated == 4'hB) begin
                //get sub
                ops <= 3'd1; 
                write_en <= 1'b1;
            end
            else if (translated == 4'hC) begin
                //get mult
                ops <= 3'd2;
                write_en <= 1'b1;
            end
            else if (translated == 4'hD) begin
                //get clear
                ops <= 3'd3;
            end
            else if (ena) begin
                write_en <= 1'b1;
            end
            if (isNum) begin
                if (state==1'b0 && write_en) begin
                    //int input
                    for (i=16;i>=0;i=i-4) begin
                        int_buffer[i+3+4] <= int_buffer[i+3];
                        int_buffer[i+2+4] <= int_buffer[i+2];
                        int_buffer[i+1+4] <= int_buffer[i+1];
                        int_buffer[i+4] <= int_buffer[i];
                    end
                    int_buffer[3:0] <=  translated[3:0];
                end
                else if (state==1'b1 && write_en)begin
                    //fp input
                    case (fp_counter)
                        6'd0 : fp_buffer[23:20] <=  translated[3:0];
                        6'd4 : fp_buffer[23-4:20-4] <=  translated[3:0];
                        6'd8 : fp_buffer[23-8:20-8] <=  translated[3:0];
                        6'd12 : fp_buffer[23-12:20-12] <=  translated[3:0];
                        6'd16 : fp_buffer[23-16:20-16] <=  translated[3:0];
                        6'd20 : fp_buffer[23-20:20-20] <=  translated[3:0];
                    endcase
                    fp_counter <= fp_counter + 6'd4;
                end
            end
        //end
    end
    
//    always @(posedge )

endmodule
