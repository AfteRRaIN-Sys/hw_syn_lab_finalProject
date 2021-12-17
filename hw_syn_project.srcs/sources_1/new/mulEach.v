`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/16/2021 05:25:26 PM
// Design Name: 
// Module Name: mulEach
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


module mulEach(
    output wire [47:0] data_out,
    output wire overflo,
    input wire [47:0] data_in,
    input wire [3:0] in_acc,
    input wire [2:0] opcode
    );
    
    wire [47:0] dout1, dout2, dout3, dout4, dout5, dout6, dout7, dout8, dout9;
    reg [47:0] out;
    reg flow;
    
    adder adder1(dout1, overflo1, data_in, 48'h0, opcode);
    adder adder2(dout2, overflo2, data_in, dout1, opcode);
    adder adder3(dout3, overflo3, data_in, dout2, opcode);
    adder adder4(dout4, overflo4, data_in, dout3, opcode);
    adder adder5(dout5, overflo5, data_in, dout4, opcode);
    adder adder6(dout6, overflo6, data_in, dout5, opcode);
    adder adder7(dout7, overflo7, data_in, dout6, opcode);
    adder adder8(dout8, overflo8, data_in, dout7, opcode);
    adder adder9(dout9, overflo9, data_in, dout8, opcode);
     
    always @(dout1 or dout2 or dout3 or dout4 or dout5 or dout6 or dout7 or dout8 or dout9 or in_acc) begin
        case(in_acc)
            4'h1: begin 
                out = dout1;
                flow = overflo1;
                if(overflo1) begin out = 48'h999999999999; end
            end
            4'h2: begin 
                out = dout2;
                flow = overflo2;
                if(overflo2) begin out = 48'h999999999999; end
            end
            4'h3: begin 
                out = dout3; 
                flow = overflo3;
                if(overflo3) begin out = 48'h999999999999; end
            end
            4'h4: begin 
                out = dout4; 
                flow = overflo4;
                if(overflo4) begin out = 48'h999999999999; end
            end
            4'h5: begin 
                out = dout5;
                flow = overflo5;
                if(overflo5) begin out = 48'h999999999999; end
            end
            4'h6: begin 
                out = dout6;
                flow = overflo6;
                if(overflo6) begin out = 48'h999999999999; end
            end
            4'h7: begin 
                out = dout7;
                flow = overflo7;
                if(overflo7) begin out = 48'h999999999999; end
            end
            4'h8: begin 
                out = dout8;
                flow = overflo8;
                if(overflo8) begin out = 48'h999999999999; end
            end
            4'h9: begin 
                out = dout9; 
                flow = overflo9;
                if(overflo9) begin out = 48'h999999999999; end
            end
            default: begin
                out = 0;
                flow = 0;
            end
        endcase
    end
    
    assign data_out = out;
    assign overflo = flow;
endmodule
