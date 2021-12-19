`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/15/2021 10:21:07 PM
// Design Name: 
// Module Name: byteAdder
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: hard code isreal
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module byteAdder(
    output wire d, c, b, a,
    output reg cout,
    input wire [3:0] A,
    input wire [3:0] B,
    input wire cin,
    input wire [2:0] opcode 
    );
    
    reg [3:0] value_out;
    assign {d,c,b,a} = value_out;
    
    always @(A or B or cin or opcode) begin
        if (opcode != 3'h0 && opcode != 3'h1 && opcode != 3'h2) begin
            value_out = 4'h0; 
            cout = 1'h0;
        end else if (cin) begin // cin = 1
            case (A)
                4'b0001 : begin // 1
                    case (B)
                        4'h1 : begin value_out = 4'h3; cout = 1'h0; end
                        4'h2 : begin value_out = 4'h4; cout = 1'h0; end
                        4'h3 : begin value_out = 4'h5; cout = 1'h0; end
                        4'h4 : begin value_out = 4'h6; cout = 1'h0; end
                        4'h5 : begin value_out = 4'h7; cout = 1'h0; end
                        4'h6 : begin value_out = 4'h8; cout = 1'h0; end
                        4'h7 : begin value_out = 4'h9; cout = 1'h0; end
                        4'h8 : begin value_out = 4'h0; cout = 1'h1; end
                        4'h9 : begin value_out = 4'h1; cout = 1'h1; end
                        default: begin value_out = 4'h2; cout = 1'h0; end
                    endcase
                end
                4'b0010 : begin // 2
                    case (B)
                        4'h1 : begin value_out = 4'h4; cout = 1'h0; end
                        4'h2 : begin value_out = 4'h5; cout = 1'h0; end
                        4'h3 : begin value_out = 4'h6; cout = 1'h0; end
                        4'h4 : begin value_out = 4'h7; cout = 1'h0; end
                        4'h5 : begin value_out = 4'h8; cout = 1'h0; end
                        4'h6 : begin value_out = 4'h9; cout = 1'h0; end
                        4'h7 : begin value_out = 4'h0; cout = 1'h1; end
                        4'h8 : begin value_out = 4'h1; cout = 1'h1; end
                        4'h9 : begin value_out = 4'h2; cout = 1'h1; end
                        default: begin value_out = 4'h3; cout = 1'h1; end
                    endcase
                end
                4'b0011 : begin // 3
                    case (B)
                        4'h1 : begin value_out = 4'h5; cout = 1'h0; end
                        4'h2 : begin value_out = 4'h6; cout = 1'h0; end
                        4'h3 : begin value_out = 4'h7; cout = 1'h0; end
                        4'h4 : begin value_out = 4'h8; cout = 1'h0; end
                        4'h5 : begin value_out = 4'h9; cout = 1'h0; end
                        4'h6 : begin value_out = 4'h0; cout = 1'h1; end
                        4'h7 : begin value_out = 4'h1; cout = 1'h1; end
                        4'h8 : begin value_out = 4'h2; cout = 1'h1; end
                        4'h9 : begin value_out = 4'h3; cout = 1'h1; end
                        default: begin value_out = 4'h4; cout = 1'h0; end
                    endcase
                end
                4'b0100 : begin // 4
                    case (B)
                        4'h1 : begin value_out = 4'h6; cout = 1'h0; end
                        4'h2 : begin value_out = 4'h7; cout = 1'h0; end
                        4'h3 : begin value_out = 4'h8; cout = 1'h0; end
                        4'h4 : begin value_out = 4'h9; cout = 1'h0; end
                        4'h5 : begin value_out = 4'h0; cout = 1'h1; end
                        4'h6 : begin value_out = 4'h1; cout = 1'h1; end
                        4'h7 : begin value_out = 4'h2; cout = 1'h1; end
                        4'h8 : begin value_out = 4'h3; cout = 1'h1; end
                        4'h9 : begin value_out = 4'h4; cout = 1'h1; end
                        default: begin value_out = 4'h5; cout = 1'h0; end
                    endcase
                end
                4'b0101 : begin // 5
                    case (B)
                        4'h1 : begin value_out = 4'h7; cout = 1'h0; end
                        4'h2 : begin value_out = 4'h8; cout = 1'h0; end
                        4'h3 : begin value_out = 4'h9; cout = 1'h0; end
                        4'h4 : begin value_out = 4'h0; cout = 1'h1; end
                        4'h5 : begin value_out = 4'h1; cout = 1'h1; end
                        4'h6 : begin value_out = 4'h2; cout = 1'h1; end
                        4'h7 : begin value_out = 4'h3; cout = 1'h1; end
                        4'h8 : begin value_out = 4'h4; cout = 1'h1; end
                        4'h9 : begin value_out = 4'h5; cout = 1'h1; end
                        default: begin value_out = 4'h6; cout = 1'h0; end
                    endcase
                end
                4'b0110 : begin // 6
                    case (B)
                       4'h1 : begin value_out = 4'h8; cout = 1'h0; end
                        4'h2 : begin value_out = 4'h9; cout = 1'h0; end
                        4'h3 : begin value_out = 4'h0; cout = 1'h1; end
                        4'h4 : begin value_out = 4'h1; cout = 1'h1; end
                        4'h5 : begin value_out = 4'h2; cout = 1'h1; end
                        4'h6 : begin value_out = 4'h3; cout = 1'h1; end
                        4'h7 : begin value_out = 4'h4; cout = 1'h1; end
                        4'h8 : begin value_out = 4'h5; cout = 1'h1; end
                        4'h9 : begin value_out = 4'h6; cout = 1'h1; end
                        default: begin value_out = 4'h7; cout = 1'h0; end
                    endcase
                end
                4'b0111 : begin // 7
                    case (B)
                        4'h1 : begin value_out = 4'h9; cout = 1'h0; end
                        4'h2 : begin value_out = 4'h0; cout = 1'h1; end
                        4'h3 : begin value_out = 4'h1; cout = 1'h1; end
                        4'h4 : begin value_out = 4'h2; cout = 1'h1; end
                        4'h5 : begin value_out = 4'h3; cout = 1'h1; end
                        4'h6 : begin value_out = 4'h4; cout = 1'h1; end
                        4'h7 : begin value_out = 4'h5; cout = 1'h1; end
                        4'h8 : begin value_out = 4'h6; cout = 1'h1; end
                        4'h9 : begin value_out = 4'h7; cout = 1'h1; end
                        default: begin value_out = 4'h8; cout = 1'h0; end
                    endcase
                end
                4'b1000 : begin // 8
                    case (B)
                        4'h1 : begin value_out = 4'h0; cout = 1'h1; end
                        4'h2 : begin value_out = 4'h1; cout = 1'h1; end
                        4'h3 : begin value_out = 4'h2; cout = 1'h1; end
                        4'h4 : begin value_out = 4'h3; cout = 1'h1; end
                        4'h5 : begin value_out = 4'h4; cout = 1'h1; end
                        4'h6 : begin value_out = 4'h5; cout = 1'h1; end
                        4'h7 : begin value_out = 4'h6; cout = 1'h1; end
                        4'h8 : begin value_out = 4'h7; cout = 1'h1; end
                        4'h9 : begin value_out = 4'h8; cout = 1'h1; end
                        default: begin value_out = 4'h9; cout = 1'h0; end
                    endcase
                end
                4'b1001 : begin // 9
                    case (B)
                        4'h1 : begin value_out = 4'h1; cout = 1'h1; end
                        4'h2 : begin value_out = 4'h2; cout = 1'h1; end
                        4'h3 : begin value_out = 4'h3; cout = 1'h1; end
                        4'h4 : begin value_out = 4'h4; cout = 1'h1; end
                        4'h5 : begin value_out = 4'h5; cout = 1'h1; end
                        4'h6 : begin value_out = 4'h6; cout = 1'h1; end
                        4'h7 : begin value_out = 4'h7; cout = 1'h1; end
                        4'h8 : begin value_out = 4'h8; cout = 1'h1; end
                        4'h9 : begin value_out = 4'h9; cout = 1'h1; end
                        default: begin value_out = 4'h0; cout = 1'h1; end
                    endcase
                end
                default : begin // 0
                    case (B)
                        4'h1 : begin value_out = 4'h2; cout = 1'h0; end
                        4'h2 : begin value_out = 4'h3; cout = 1'h0; end
                        4'h3 : begin value_out = 4'h4; cout = 1'h0; end
                        4'h4 : begin value_out = 4'h5; cout = 1'h0; end
                        4'h5 : begin value_out = 4'h6; cout = 1'h0; end
                        4'h6 : begin value_out = 4'h7; cout = 1'h0; end
                        4'h7 : begin value_out = 4'h8; cout = 1'h0; end
                        4'h8 : begin value_out = 4'h9; cout = 1'h0; end
                        4'h9 : begin value_out = 4'h0; cout = 1'h1; end
                        default: begin value_out = 4'h1; cout = 1'h0; end
                    endcase
                end
            endcase
        end else begin
            case (A)
                4'h1 : begin // 1
                    case (B)
                        4'h1 : begin value_out = 4'h2; cout = 1'h0; end
                        4'h2 : begin value_out = 4'h3; cout = 1'h0; end
                        4'h3 : begin value_out = 4'h4; cout = 1'h0; end
                        4'h4 : begin value_out = 4'h5; cout = 1'h0; end
                        4'h5 : begin value_out = 4'h6; cout = 1'h0; end
                        4'h6 : begin value_out = 4'h7; cout = 1'h0; end
                        4'h7 : begin value_out = 4'h8; cout = 1'h0; end
                        4'h8 : begin value_out = 4'h9; cout = 1'h0; end
                        4'h9 : begin value_out = 4'h0; cout = 1'h1; end
                        default: begin value_out = 4'h1; cout = 1'h0; end
                    endcase
                end
                4'h2 : begin
                    case (B)
                        4'h1 : begin value_out = 4'h3; cout = 1'h0; end
                        4'h2 : begin value_out = 4'h4; cout = 1'h0; end
                        4'h3 : begin value_out = 4'h5; cout = 1'h0; end
                        4'h4 : begin value_out = 4'h6; cout = 1'h0; end
                        4'h5 : begin value_out = 4'h7; cout = 1'h0; end
                        4'h6 : begin value_out = 4'h8; cout = 1'h0; end
                        4'h7 : begin value_out = 4'h9; cout = 1'h0; end
                        4'h8 : begin value_out = 4'h0; cout = 1'h1; end
                        4'h9 : begin value_out = 4'h1; cout = 1'h1; end
                        default: begin value_out = 4'h2; cout = 1'h0; end
                    endcase
                end
                4'h3 : begin
                    case (B)
                        4'h1 : begin value_out = 4'h4; cout = 1'h0; end
                        4'h2 : begin value_out = 4'h5; cout = 1'h0; end
                        4'h3 : begin value_out = 4'h6; cout = 1'h0; end
                        4'h4 : begin value_out = 4'h7; cout = 1'h0; end
                        4'h5 : begin value_out = 4'h8; cout = 1'h0; end
                        4'h6 : begin value_out = 4'h9; cout = 1'h0; end
                        4'h7 : begin value_out = 4'h0; cout = 1'h1; end
                        4'h8 : begin value_out = 4'h1; cout = 1'h1; end
                        4'h9 : begin value_out = 4'h2; cout = 1'h1; end
                        default: begin value_out = 4'h3; cout = 1'h0; end
                    endcase
                end
                4'h4 : begin
                    case (B)
                        4'h1 : begin value_out = 4'h5; cout = 1'h0; end
                        4'h2 : begin value_out = 4'h6; cout = 1'h0; end
                        4'h3 : begin value_out = 4'h7; cout = 1'h0; end
                        4'h4 : begin value_out = 4'h8; cout = 1'h0; end
                        4'h5 : begin value_out = 4'h9; cout = 1'h0; end
                        4'h6 : begin value_out = 4'h0; cout = 1'h1; end
                        4'h7 : begin value_out = 4'h1; cout = 1'h1; end
                        4'h8 : begin value_out = 4'h2; cout = 1'h1; end
                        4'h9 : begin value_out = 4'h3; cout = 1'h1; end
                        default: begin value_out = 4'h4; cout = 1'h0; end
                    endcase
                end
                4'h5 : begin
                    case (B)
                        4'h1 : begin value_out = 4'h6; cout = 1'h0; end
                        4'h2 : begin value_out = 4'h7; cout = 1'h0; end
                        4'h3 : begin value_out = 4'h8; cout = 1'h0; end
                        4'h4 : begin value_out = 4'h9; cout = 1'h0; end
                        4'h5 : begin value_out = 4'h0; cout = 1'h1; end
                        4'h6 : begin value_out = 4'h1; cout = 1'h1; end
                        4'h7 : begin value_out = 4'h2; cout = 1'h1; end
                        4'h8 : begin value_out = 4'h3; cout = 1'h1; end
                        4'h9 : begin value_out = 4'h4; cout = 1'h1; end
                        default: begin value_out = 4'h5; cout = 1'h0; end
                    endcase
                end
                4'h6 : begin
                    case (B)
                        4'h1 : begin value_out = 4'h7; cout = 1'h0; end
                        4'h2 : begin value_out = 4'h8; cout = 1'h0; end
                        4'h3 : begin value_out = 4'h9; cout = 1'h0; end
                        4'h4 : begin value_out = 4'h0; cout = 1'h1; end
                        4'h5 : begin value_out = 4'h1; cout = 1'h1; end
                        4'h6 : begin value_out = 4'h2; cout = 1'h1; end
                        4'h7 : begin value_out = 4'h3; cout = 1'h1; end
                        4'h8 : begin value_out = 4'h4; cout = 1'h1; end
                        4'h9 : begin value_out = 4'h5; cout = 1'h1; end
                        default: begin value_out = 4'h6; cout = 1'h0; end
                    endcase
                end
                4'h7 : begin
                    case (B)
                       4'h1 : begin value_out = 4'h8; cout = 1'h0; end
                        4'h2 : begin value_out = 4'h9; cout = 1'h0; end
                        4'h3 : begin value_out = 4'h0; cout = 1'h1; end
                        4'h4 : begin value_out = 4'h1; cout = 1'h1; end
                        4'h5 : begin value_out = 4'h2; cout = 1'h1; end
                        4'h6 : begin value_out = 4'h3; cout = 1'h1; end
                        4'h7 : begin value_out = 4'h4; cout = 1'h1; end
                        4'h8 : begin value_out = 4'h5; cout = 1'h1; end
                        4'h9 : begin value_out = 4'h6; cout = 1'h1; end
                        default: begin value_out = 4'h7; cout = 1'h0; end
                    endcase
                end
                4'h8 : begin
                    case (B)
                        4'h1 : begin value_out = 4'h9; cout = 1'h0; end
                        4'h2 : begin value_out = 4'h0; cout = 1'h1; end
                        4'h3 : begin value_out = 4'h1; cout = 1'h1; end
                        4'h4 : begin value_out = 4'h2; cout = 1'h1; end
                        4'h5 : begin value_out = 4'h3; cout = 1'h1; end
                        4'h6 : begin value_out = 4'h4; cout = 1'h1; end
                        4'h7 : begin value_out = 4'h5; cout = 1'h1; end
                        4'h8 : begin value_out = 4'h6; cout = 1'h1; end
                        4'h9 : begin value_out = 4'h7; cout = 1'h1; end
                        default: begin value_out = 4'h8; cout = 1'h0; end
                    endcase
                end
                4'h9 : begin
                    case (B)
                        4'h1 : begin value_out = 4'h0; cout = 1'h1; end
                        4'h2 : begin value_out = 4'h1; cout = 1'h1; end
                        4'h3 : begin value_out = 4'h2; cout = 1'h1; end
                        4'h4 : begin value_out = 4'h3; cout = 1'h1; end
                        4'h5 : begin value_out = 4'h4; cout = 1'h1; end
                        4'h6 : begin value_out = 4'h5; cout = 1'h1; end
                        4'h7 : begin value_out = 4'h6; cout = 1'h1; end
                        4'h8 : begin value_out = 4'h7; cout = 1'h1; end
                        4'h9 : begin value_out = 4'h8; cout = 1'h1; end
                        default: begin value_out = 4'h9; cout = 1'h0; end
                    endcase
                end
                default : begin // 0
                    case (B)
                        4'h1 : begin value_out = 4'h1; cout = 1'h0; end
                        4'h2 : begin value_out = 4'h2; cout = 1'h0; end
                        4'h3 : begin value_out = 4'h3; cout = 1'h0; end
                        4'h4 : begin value_out = 4'h4; cout = 1'h0; end
                        4'h5 : begin value_out = 4'h5; cout = 1'h0; end
                        4'h6 : begin value_out = 4'h6; cout = 1'h0; end
                        4'h7 : begin value_out = 4'h7; cout = 1'h0; end
                        4'h8 : begin value_out = 4'h8; cout = 1'h0; end
                        4'h9 : begin value_out = 4'h9; cout = 1'h0; end
                        default: begin value_out = 4'h0; cout = 1'h0; end
                    endcase
                end
            endcase
        end
    end
endmodule
