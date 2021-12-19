`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/16/2021 05:29:34 PM
// Design Name: 
// Module Name: mulAll
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


module mulAll(
    output wire [47:0] data_out,
    output wire overflo,
    input wire [47:0] data_in,
    input wire [47:0] in_acc,
    input wire [2:0] opcode
    );
    
    wire [47:0] dout1, dout2, dout3, dout4, dout5, dout6, dout7, dout8, dout9, dout10, dout11, dout12;
    wire [47:0] Dou1, Dou2, Dou3, Dou4, Dou5, Dou6, Dou7, Dou8, Dou9, Dou10, Dou11, Dou12;
    wire overflo1, overflo2, overflo3, overflo4, overflo5, overflo6, overflo7, overflo8, overflo9, overflo10, overflo11, overflo12;
    wire flo1, flo2, flo3, flo4, flo5, flo6, flo7, flo8, flo9, flo10, flo11, flo12;
    
    reg [47:0] out;
    reg f;
    
    //multiply for each in_acc value
    mulEach mule1( dout1,  overflo1,  data_in, in_acc [3:0],   opcode);// fp 6
    mulEach mule2( dout2,  overflo2,  data_in, in_acc [7:4],   opcode);// fp 5
    mulEach mule3( dout3,  overflo3,  data_in, in_acc [11:8],  opcode);// fp 4
    mulEach mule4( dout4,  overflo4,  data_in, in_acc [15:12], opcode);// fp 3
    mulEach mule5( dout5,  overflo5,  data_in, in_acc [19:16], opcode);// fp 2
    mulEach mule6( dout6,  overflo6,  data_in, in_acc [23:20], opcode);// fp 1
    mulEach mule7( dout7,  overflo7,  data_in, in_acc [27:24], opcode);// int 1
    mulEach mule8( dout8,  overflo8,  data_in, in_acc [31:28], opcode);// int 2
    mulEach mule9( dout9,  overflo9,  data_in, in_acc [35:32], opcode);// int 3
    mulEach mule10(dout10, overflo10, data_in, in_acc [39:36], opcode);// int 4
    mulEach mule11(dout11, overflo11, data_in, in_acc [43:40], opcode);// int 5
    mulEach mule12(dout12, overflo12, data_in, in_acc [47:44], opcode);// int 6
    
    //sum the multiply
    adder adder1( Dou1,  flo1,  dout12,      48'h0,      opcode); // front
    adder adder2( Dou2,  flo2,  dout11,      Dou1  << 4, opcode);
    adder adder3( Dou3,  flo3,  dout10,      Dou2  << 4, opcode);
    adder adder4( Dou4,  flo4,  dout9,       Dou3  << 4, opcode);
    adder adder5( Dou5,  flo5,  dout8,       Dou4  << 4, opcode);
    adder adder6( Dou6,  flo6,  dout7,       Dou5  << 4, opcode);
    adder adder7( Dou7,  flo7,  dout6 >> 4,  Dou6,       opcode);
    adder adder8( Dou8,  flo8,  dout5 >> 8,  Dou7,       opcode);
    adder adder9( Dou9,  flo9,  dout4 >> 12, Dou8,       opcode);
    adder adder10(Dou10, flo10, dout3 >> 16, Dou9,       opcode);
    adder adder11(Dou11, flo11, dout2 >> 20, Dou10,      opcode);
    adder adder12(Dou12, flo12, dout1 >> 24, Dou11,      opcode); // back
    
    
    always @(Dou12) begin
        out = Dou12;
        f = 0;
        if (Dou1[47:28] > 4'h0 || Dou2[47:32] > 4'h0 || Dou3[47:36] > 4'h0 || Dou4[47:40] > 4'h0 || Dou5[47:44] > 4'h0) begin
            out = 48'h999999999999;
            f = 1;
        end
    end
    
    assign overflo = f;
    assign data_out = out;
endmodule
