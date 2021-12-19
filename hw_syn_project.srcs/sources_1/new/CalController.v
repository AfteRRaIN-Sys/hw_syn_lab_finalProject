`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/15/2021 10:22:03 PM
// Design Name: 
// Module Name: CalController
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


module CalController(
    output [48:0] data_out,
    output done,
    output overflow,
    input wire [47:0] data_in,
    input wire [2:0] opcode,
    input wire sended,
    input wire clk
    );
    
    reg [48:0] out;
    reg [48:0] acc;
    reg [48:0] buff;
    
    reg isflow;
    
    wire overflo;
    
    initial begin 
        acc = 0;
    end
    

    wire [47:0] adout;
    wire overflo;
    adder adder1(adout, overflo, data_in, acc, opcode);
    
    // subtract section
    byteSubtract Bsub1 (H1,   G1,   F1,   E1,  bout1,  data_in [3:0],   acc [3:0],   1'b0,   opcode);
    byteSubtract Bsub2 (H2,   G2,   F2,   E2,  bout2,  data_in [7:4],   acc [7:4],   bout1,  opcode);
    byteSubtract Bsub3 (H3,   G3,   F3,   E3,  bout3,  data_in [11:8],  acc [11:8],  bout2,  opcode);
    byteSubtract Bsub4 (H4,   G4,   F4,   E4,  bout4,  data_in [15:12], acc [15:12], bout3,  opcode);
    byteSubtract Bsub5 (H5,   G5,   F5,   E5,  bout5,  data_in [19:16], acc [19:16], bout4,  opcode);
    byteSubtract Bsub6 (H6,   G6,   F6,   E6,  bout6,  data_in [23:20], acc [23:20], bout5,  opcode);
    byteSubtract Bsub7 (H7,   G7,   F7,   E7,  bout7,  data_in [27:24], acc [27:24], bout6,  opcode);
    byteSubtract Bsub8 (H8,   G8,   F8,   E8,  bout8,  data_in [31:28], acc [31:28], bout7,  opcode);
    byteSubtract Bsub9 (H9,   G9,   F9,   E9,  bout9,  data_in [35:32], acc [35:32], bout8,  opcode);
    byteSubtract Bsub10(H10,  G10,  F10,  E10, bout10, data_in [39:36], acc [39:36], bout9,  opcode);
    byteSubtract Bsub11(H11,  G11,  F11,  E11, bout11, data_in [43:40], acc [43:40], bout10, opcode);
    byteSubtract Bsub12(H12,  G12,  F12,  E12, bout12, data_in [47:44], acc [47:44], bout11, opcode);
    
    //data_in - acc
    byteSubtract bsub1 (h1,   g1,   f1,   e1,  Bout1,  acc [3:0],   data_in [3:0],   1'b0,   opcode);
    byteSubtract bsub2 (h2,   g2,   f2,   e2,  Bout2,  acc [7:4],   data_in [7:4],   Bout1,  opcode);
    byteSubtract bsub3 (h3,   g3,   f3,   e3,  Bout3,  acc [11:8],  data_in [11:8],  Bout2,  opcode);
    byteSubtract bsub4 (h4,   g4,   f4,   e4,  Bout4,  acc [15:12], data_in [15:12], Bout3,  opcode);
    byteSubtract bsub5 (h5,   g5,   f5,   e5,  Bout5,  acc [19:16], data_in [19:16], Bout4,  opcode);
    byteSubtract bsub6 (h6,   g6,   f6,   e6,  Bout6,  acc [23:20], data_in [23:20], Bout5,  opcode);
    byteSubtract bsub7 (h7,   g7,   f7,   e7,  Bout7,  acc [27:24], data_in [27:24], Bout6,  opcode);
    byteSubtract bsub8 (h8,   g8,   f8,   e8,  Bout8,  acc [31:28], data_in [31:28], Bout7,  opcode);
    byteSubtract bsub9 (h9,   g9,   f9,   e9,  Bout9,  acc [35:32], data_in [35:32], Bout8,  opcode);
    byteSubtract bsub10(h10,  g10,  f10,  e10, Bout10, acc [39:36], data_in [39:36], Bout9,  opcode);
    byteSubtract bsub11(h11,  g11,  f11,  e11, Bout11, acc [43:40], data_in [43:40], Bout10, opcode);
    byteSubtract bsub12(h12,  g12,  f12,  e12, Bout12, acc [47:44], data_in [47:44], Bout11, opcode);
    
    wire [47:0] HGFE, hgfe;
    assign HGFE = {H12,G12,F12,E12, H11,G11,F11,E11, H10,G10,F10,E10, H9,G9,F9,E9, H8,G8,F8,E8, H7,G7,F7,E7, H6,G6,F6,E6, H5,G5,F5,E5, H4,G4,F4,E4, H3,G3,F3,E3, H2,G2,F2,E2, H1,G1,F1,E1};
    assign hgfe = {h12,g12,f12,e12, h11,g11,f11,e11, h10,g10,f10,e10, h9,g9,f9,e9, h8,g8,f8,e8, h7,g7,f7,e7, h6,g6,f6,e6, h5,g5,f5,e5, h4,g4,f4,e4, h3,g3,f3,e3, h2,g2,f2,e2, h1,g1,f1,e1};
    
    // multiply section
    wire [47:0] mDout;
    wire overf2;
    mulAll mul(mDout, overf2, data_in, acc[47:0], opcode);
    
    singlePulser pulse(sigout, !sended, clk);
    singlePulser pulse2(sigout2, sigout, clk);
    
    always @(negedge sended) begin
        isflow = 0;
        case ({opcode, acc[48]})
            4'b0000: begin // adder and acc is positive
                //out = {1'h0, DCBA12, DCBA11, DCBA10, DCBA9, DCBA8, DCBA7, DCBA6, DCBA5, DCBA4, DCBA3, DCBA2, DCBA1};
                out = {1'h0, adout};
                if (overflo) begin out = 49'h0999999999999; isflow = 1; end
                acc = out;
            end
            4'b0001: begin // adder but acc is negative
                out = {1'h0, hgfe};
                if (data_in < acc[47:0]) out = {1'h1, HGFE};
                acc = out;
            end
            4'b0010: begin // subt but acc is positive
                out = {1'h0, HGFE};
                if (data_in > acc[47:0]) out = {1'h1, hgfe};
                acc = out;
            end
            4'b0011: begin // subt but acc is negative
                out = {1'h1, adout};
                //out = {1'h1, DCBA12, DCBA11, DCBA10, DCBA9, DCBA8, DCBA7, DCBA6, DCBA5, DCBA4, DCBA3, DCBA2, DCBA1};
                if (overflo) begin out = 49'h1999999999999; isflow = 1; end
                acc = out;
            end
            4'b0100: begin // mul pos
                out = {1'h0, mDout};
                isflow = overf2;
                acc = out;
            end
            4'b0101: begin // mul neg
                out = {1'h1, mDout};
                isflow = overf2;
                acc = out;
            end
            default: begin // reset
                out = 49'h0;
                acc = 49'h0;
            end
        endcase
    end
    
    assign overflow = isflow;
    assign done = sigout | sigout2;
    assign data_out = out;
endmodule
