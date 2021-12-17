`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/15/2021 10:21:07 PM
// Design Name: 
// Module Name: adder
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


module adder(
    output [47:0] data_out,
    output wire overflo,
    input wire [47:0] data_in,
    input wire [47:0] in_acc,
    input wire [2:0] opcode
    );
    
//    reg busy;
//    reg [47:0] last_data;
    
//    initial begin
//        busy = 0;
//    end
    
    byteAdder Badder1 (D1,   C1,   B1,   A1,  cout1,  data_in [3:0],   in_acc [3:0],   1'b0,   opcode);
    byteAdder Badder2 (D2,   C2,   B2,   A2,  cout2,  data_in [7:4],   in_acc [7:4],   cout1,  opcode);
    byteAdder Badder3 (D3,   C3,   B3,   A3,  cout3,  data_in [11:8],  in_acc [11:8],  cout2,  opcode);
    byteAdder Badder4 (D4,   C4,   B4,   A4,  cout4,  data_in [15:12], in_acc [15:12], cout3,  opcode);
    byteAdder Badder5 (D5,   C5,   B5,   A5,  cout5,  data_in [19:16], in_acc [19:16], cout4,  opcode);
    byteAdder Badder6 (D6,   C6,   B6,   A6,  cout6,  data_in [23:20], in_acc [23:20], cout5,  opcode);
    byteAdder Badder7 (D7,   C7,   B7,   A7,  cout7,  data_in [27:24], in_acc [27:24], cout6,  opcode);
    byteAdder Badder8 (D8,   C8,   B8,   A8,  cout8,  data_in [31:28], in_acc [31:28], cout7,  opcode);
    byteAdder Badder9 (D9,   C9,   B9,   A9,  cout9,  data_in [35:32], in_acc [35:32], cout8,  opcode);
    byteAdder Badder10(D10,  C10,  B10,  A10, cout10, data_in [39:36], in_acc [39:36], cout9,  opcode);
    byteAdder Badder11(D11,  C11,  B11,  A11, cout11, data_in [43:40], in_acc [43:40], cout10, opcode);
    byteAdder Badder12(D12,  C12,  B12,  A12, cout12, data_in [47:44], in_acc [47:44], cout11, opcode);
    
    wire [3:0] DCBA1, DCBA2, DCBA3, DCBA4, DCBA5, DCBA6, DCBA7, DCBA8, DCBA9, DCBA10, DCBA11, DCBA12;
    assign DCBA1 =  {D1, C1, B1, A1};
    assign DCBA2 =  {D2, C2, B2, A2};
    assign DCBA3 =  {D3, C3, B3, A3};
    assign DCBA4 =  {D4, C4, B4, A4};
    assign DCBA5 =  {D5, C5, B5, A5};
    assign DCBA6 =  {D6, C6, B6, A6};
    assign DCBA7 =  {D7, C7, B7, A7};
    assign DCBA8 =  {D8, C8, B8, A8};
    assign DCBA9 =  {D9, C9, B9, A9};
    assign DCBA10 = {D10,C10,B10,A10};
    assign DCBA11 = {D11,C11,B11,A11};
    assign DCBA12 = {D12,C12,B12,A12};
    
    assign data_out = {DCBA12, DCBA11, DCBA10, DCBA9, DCBA8, DCBA7, DCBA6, DCBA5, DCBA4, DCBA3, DCBA2, DCBA1};
    assign overflo = cout12;
//    always @(data_in) begin
//        data_out = {4'h0, out12, out11, out10, out9, out8, out7, out6, out5, out4};
//        last_data = data_out;
//        busy = 1;
//    end
    
//    always @(last_data) begin
        
//    end
    
    
endmodule
