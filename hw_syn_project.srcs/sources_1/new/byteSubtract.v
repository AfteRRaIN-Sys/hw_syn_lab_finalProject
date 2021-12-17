`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/15/2021 10:21:07 PM
// Design Name: 
// Module Name: byteSubtract
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


module byteSubtract( // B(acc) - A(input) - bin
    output wire d, c, b, a,
    output reg bout,
    input wire [3:0] A,
    input wire [3:0] B,
    input wire bin,
    input wire [2:0] opcode 
    );
    
    reg [3:0] value_out;
    assign {d,c,b,a} = value_out;
    
    always @(A or B or bin or opcode) begin
        if (opcode != 3'h1 && opcode != 3'h0) begin
            value_out = 4'h0; 
            bout = 1'h0;
        end else if (bin) begin
            case (A)
                4'h1 : begin
                    case(B) 
                        4'h1: begin value_out = 4'h9; bout = 1'h1; end
                        4'h2: begin value_out = 4'h0; bout = 1'h0; end
                        4'h3: begin value_out = 4'h1; bout = 1'h0; end
                        4'h4: begin value_out = 4'h2; bout = 1'h0; end
                        4'h5: begin value_out = 4'h3; bout = 1'h0; end
                        4'h6: begin value_out = 4'h4; bout = 1'h0; end
                        4'h7: begin value_out = 4'h5; bout = 1'h0; end
                        4'h8: begin value_out = 4'h6; bout = 1'h0; end
                        4'h9: begin value_out = 4'h7; bout = 1'h0; end
                        default: begin value_out = 4'h8; bout = 1'h1; end
                    endcase
                end
                4'h2 : begin
                    case(B) 
                        4'h1: begin value_out = 4'h8; bout = 1'h1; end
                        4'h2: begin value_out = 4'h9; bout = 1'h1; end
                        4'h3: begin value_out = 4'h0; bout = 1'h0; end
                        4'h4: begin value_out = 4'h1; bout = 1'h0; end
                        4'h5: begin value_out = 4'h2; bout = 1'h0; end
                        4'h6: begin value_out = 4'h3; bout = 1'h0; end
                        4'h7: begin value_out = 4'h4; bout = 1'h0; end
                        4'h8: begin value_out = 4'h5; bout = 1'h0; end
                        4'h9: begin value_out = 4'h6; bout = 1'h0; end
                        default: begin value_out = 4'h7; bout = 1'h1; end
                    endcase
                end
                4'h3 : begin
                    case(B) 
                        4'h1: begin value_out = 4'h7; bout = 1'h1; end
                        4'h2: begin value_out = 4'h8; bout = 1'h1; end
                        4'h3: begin value_out = 4'h9; bout = 1'h1; end
                        4'h4: begin value_out = 4'h0; bout = 1'h0; end
                        4'h5: begin value_out = 4'h1; bout = 1'h0; end
                        4'h6: begin value_out = 4'h2; bout = 1'h0; end
                        4'h7: begin value_out = 4'h3; bout = 1'h0; end
                        4'h8: begin value_out = 4'h4; bout = 1'h0; end
                        4'h9: begin value_out = 4'h5; bout = 1'h0; end
                        default: begin value_out = 4'h6; bout = 1'h1; end
                    endcase
                end
                4'h4 : begin
                    case(B) 
                        4'h1: begin value_out = 4'h6; bout = 1'h1; end
                        4'h2: begin value_out = 4'h7; bout = 1'h1; end
                        4'h3: begin value_out = 4'h8; bout = 1'h1; end
                        4'h4: begin value_out = 4'h9; bout = 1'h1; end
                        4'h5: begin value_out = 4'h0; bout = 1'h0; end
                        4'h6: begin value_out = 4'h1; bout = 1'h0; end
                        4'h7: begin value_out = 4'h2; bout = 1'h0; end
                        4'h8: begin value_out = 4'h3; bout = 1'h0; end
                        4'h9: begin value_out = 4'h4; bout = 1'h0; end
                        default: begin value_out = 4'h5; bout = 1'h1; end
                    endcase
                end
                4'h5 : begin
                    case(B) 
                        4'h1: begin value_out = 4'h5; bout = 1'h1; end
                        4'h2: begin value_out = 4'h6; bout = 1'h1; end
                        4'h3: begin value_out = 4'h7; bout = 1'h1; end
                        4'h4: begin value_out = 4'h8; bout = 1'h1; end
                        4'h5: begin value_out = 4'h9; bout = 1'h1; end
                        4'h6: begin value_out = 4'h0; bout = 1'h0; end
                        4'h7: begin value_out = 4'h1; bout = 1'h0; end
                        4'h8: begin value_out = 4'h2; bout = 1'h0; end
                        4'h9: begin value_out = 4'h3; bout = 1'h0; end
                        default: begin value_out = 4'h4; bout = 1'h1; end
                    endcase
                end
                4'h6 : begin
                    case(B) 
                        4'h1: begin value_out = 4'h4; bout = 1'h1; end
                        4'h2: begin value_out = 4'h5; bout = 1'h1; end
                        4'h3: begin value_out = 4'h6; bout = 1'h1; end
                        4'h4: begin value_out = 4'h7; bout = 1'h1; end
                        4'h5: begin value_out = 4'h8; bout = 1'h1; end
                        4'h6: begin value_out = 4'h9; bout = 1'h1; end
                        4'h7: begin value_out = 4'h0; bout = 1'h0; end
                        4'h8: begin value_out = 4'h1; bout = 1'h0; end
                        4'h9: begin value_out = 4'h2; bout = 1'h0; end
                        default: begin value_out = 4'h3; bout = 1'h1; end
                    endcase
                end
                4'h7 : begin
                    case(B) 
                        4'h1: begin value_out = 4'h3; bout = 1'h1; end
                        4'h2: begin value_out = 4'h4; bout = 1'h1; end
                        4'h3: begin value_out = 4'h5; bout = 1'h1; end
                        4'h4: begin value_out = 4'h6; bout = 1'h1; end
                        4'h5: begin value_out = 4'h7; bout = 1'h1; end
                        4'h6: begin value_out = 4'h8; bout = 1'h1; end
                        4'h7: begin value_out = 4'h9; bout = 1'h1; end
                        4'h8: begin value_out = 4'h0; bout = 1'h0; end
                        4'h9: begin value_out = 4'h1; bout = 1'h0; end
                        default: begin value_out = 4'h2; bout = 1'h1; end
                    endcase
                end
                4'h8 : begin
                    case(B) 
                        4'h1: begin value_out = 4'h2; bout = 1'h1; end
                        4'h2: begin value_out = 4'h3; bout = 1'h1; end
                        4'h3: begin value_out = 4'h4; bout = 1'h1; end
                        4'h4: begin value_out = 4'h5; bout = 1'h1; end
                        4'h5: begin value_out = 4'h6; bout = 1'h1; end
                        4'h6: begin value_out = 4'h7; bout = 1'h1; end
                        4'h7: begin value_out = 4'h8; bout = 1'h1; end
                        4'h8: begin value_out = 4'h9; bout = 1'h1; end
                        4'h9: begin value_out = 4'h0; bout = 1'h0; end
                        default: begin value_out = 4'h1; bout = 1'h1; end
                    endcase
                end
                4'h9 : begin
                    case(B) 
                        4'h1: begin value_out = 4'h1; bout = 1'h1; end
                        4'h2: begin value_out = 4'h2; bout = 1'h1; end
                        4'h3: begin value_out = 4'h3; bout = 1'h1; end
                        4'h4: begin value_out = 4'h4; bout = 1'h1; end
                        4'h5: begin value_out = 4'h5; bout = 1'h1; end
                        4'h6: begin value_out = 4'h6; bout = 1'h1; end
                        4'h7: begin value_out = 4'h7; bout = 1'h1; end
                        4'h8: begin value_out = 4'h8; bout = 1'h1; end
                        4'h9: begin value_out = 4'h9; bout = 1'h1; end
                        default: begin value_out = 4'h0; bout = 1'h1; end
                    endcase
                end
                default : begin
                    case(B) 
                        4'h1: begin value_out = 4'h0; bout = 1'h0; end
                        4'h2: begin value_out = 4'h1; bout = 1'h0; end
                        4'h3: begin value_out = 4'h2; bout = 1'h0; end
                        4'h4: begin value_out = 4'h3; bout = 1'h0; end
                        4'h5: begin value_out = 4'h4; bout = 1'h0; end
                        4'h6: begin value_out = 4'h5; bout = 1'h0; end
                        4'h7: begin value_out = 4'h6; bout = 1'h0; end
                        4'h8: begin value_out = 4'h7; bout = 1'h0; end
                        4'h9: begin value_out = 4'h8; bout = 1'h0; end
                        default: begin value_out = 4'h9; bout = 1'h1; end
                    endcase
                end
            endcase
        end else begin
            case (A)
                4'h1 : begin
                    case(B) 
                        4'h1: begin value_out = 4'h0; bout = 1'h0; end
                        4'h2: begin value_out = 4'h1; bout = 1'h0; end
                        4'h3: begin value_out = 4'h2; bout = 1'h0; end
                        4'h4: begin value_out = 4'h3; bout = 1'h0; end
                        4'h5: begin value_out = 4'h4; bout = 1'h0; end
                        4'h6: begin value_out = 4'h5; bout = 1'h0; end
                        4'h7: begin value_out = 4'h6; bout = 1'h0; end
                        4'h8: begin value_out = 4'h7; bout = 1'h0; end
                        4'h9: begin value_out = 4'h8; bout = 1'h0; end
                        default: begin value_out = 4'h9; bout = 1'h1; end
                    endcase
                end
                4'h2 : begin
                    case(B) 
                        4'h1: begin value_out = 4'h9; bout = 1'h1; end
                        4'h2: begin value_out = 4'h0; bout = 1'h0; end
                        4'h3: begin value_out = 4'h1; bout = 1'h0; end
                        4'h4: begin value_out = 4'h2; bout = 1'h0; end
                        4'h5: begin value_out = 4'h3; bout = 1'h0; end
                        4'h6: begin value_out = 4'h4; bout = 1'h0; end
                        4'h7: begin value_out = 4'h5; bout = 1'h0; end
                        4'h8: begin value_out = 4'h6; bout = 1'h0; end
                        4'h9: begin value_out = 4'h7; bout = 1'h0; end
                        default: begin value_out = 4'h8; bout = 1'h1; end
                    endcase
                end
                4'h3 : begin
                    case(B) 
                        4'h1: begin value_out = 4'h8; bout = 1'h1; end
                        4'h2: begin value_out = 4'h9; bout = 1'h1; end
                        4'h3: begin value_out = 4'h0; bout = 1'h0; end
                        4'h4: begin value_out = 4'h1; bout = 1'h0; end
                        4'h5: begin value_out = 4'h2; bout = 1'h0; end
                        4'h6: begin value_out = 4'h3; bout = 1'h0; end
                        4'h7: begin value_out = 4'h4; bout = 1'h0; end
                        4'h8: begin value_out = 4'h5; bout = 1'h0; end
                        4'h9: begin value_out = 4'h6; bout = 1'h0; end
                        default: begin value_out = 4'h7; bout = 1'h1; end
                    endcase
                end
                4'h4 : begin
                    case(B) 
                        4'h1: begin value_out = 4'h7; bout = 1'h1; end
                        4'h2: begin value_out = 4'h8; bout = 1'h1; end
                        4'h3: begin value_out = 4'h9; bout = 1'h1; end
                        4'h4: begin value_out = 4'h0; bout = 1'h0; end
                        4'h5: begin value_out = 4'h1; bout = 1'h0; end
                        4'h6: begin value_out = 4'h2; bout = 1'h0; end
                        4'h7: begin value_out = 4'h3; bout = 1'h0; end
                        4'h8: begin value_out = 4'h4; bout = 1'h0; end
                        4'h9: begin value_out = 4'h5; bout = 1'h0; end
                        default: begin value_out = 4'h6; bout = 1'h1; end
                    endcase
                end
                4'h5 : begin
                    case(B) 
                        4'h1: begin value_out = 4'h6; bout = 1'h1; end
                        4'h2: begin value_out = 4'h7; bout = 1'h1; end
                        4'h3: begin value_out = 4'h8; bout = 1'h1; end
                        4'h4: begin value_out = 4'h9; bout = 1'h1; end
                        4'h5: begin value_out = 4'h0; bout = 1'h0; end
                        4'h6: begin value_out = 4'h1; bout = 1'h0; end
                        4'h7: begin value_out = 4'h2; bout = 1'h0; end
                        4'h8: begin value_out = 4'h3; bout = 1'h0; end
                        4'h9: begin value_out = 4'h4; bout = 1'h0; end
                        default: begin value_out = 4'h5; bout = 1'h1; end
                    endcase
                end
                4'h6 : begin
                    case(B) 
                        4'h1: begin value_out = 4'h5; bout = 1'h1; end
                        4'h2: begin value_out = 4'h6; bout = 1'h1; end
                        4'h3: begin value_out = 4'h7; bout = 1'h1; end
                        4'h4: begin value_out = 4'h8; bout = 1'h1; end
                        4'h5: begin value_out = 4'h9; bout = 1'h1; end
                        4'h6: begin value_out = 4'h0; bout = 1'h0; end
                        4'h7: begin value_out = 4'h1; bout = 1'h0; end
                        4'h8: begin value_out = 4'h2; bout = 1'h0; end
                        4'h9: begin value_out = 4'h3; bout = 1'h0; end
                        default: begin value_out = 4'h4; bout = 1'h1; end
                    endcase
                end
                4'h7 : begin
                    case(B) 
                        4'h1: begin value_out = 4'h4; bout = 1'h1; end
                        4'h2: begin value_out = 4'h5; bout = 1'h1; end
                        4'h3: begin value_out = 4'h6; bout = 1'h1; end
                        4'h4: begin value_out = 4'h7; bout = 1'h1; end
                        4'h5: begin value_out = 4'h8; bout = 1'h1; end
                        4'h6: begin value_out = 4'h9; bout = 1'h1; end
                        4'h7: begin value_out = 4'h0; bout = 1'h0; end
                        4'h8: begin value_out = 4'h1; bout = 1'h0; end
                        4'h9: begin value_out = 4'h2; bout = 1'h0; end
                        default: begin value_out = 4'h3; bout = 1'h1; end
                    endcase
                end
                4'h8 : begin
                    case(B) 
                        4'h1: begin value_out = 4'h3; bout = 1'h1; end
                        4'h2: begin value_out = 4'h4; bout = 1'h1; end
                        4'h3: begin value_out = 4'h5; bout = 1'h1; end
                        4'h4: begin value_out = 4'h6; bout = 1'h1; end
                        4'h5: begin value_out = 4'h7; bout = 1'h1; end
                        4'h6: begin value_out = 4'h8; bout = 1'h1; end
                        4'h7: begin value_out = 4'h9; bout = 1'h1; end
                        4'h8: begin value_out = 4'h0; bout = 1'h0; end
                        4'h9: begin value_out = 4'h1; bout = 1'h0; end
                        default: begin value_out = 4'h2; bout = 1'h1; end
                    endcase
                end
                4'h9 : begin
                    case(B) 
                        4'h1: begin value_out = 4'h2; bout = 1'h1; end
                        4'h2: begin value_out = 4'h3; bout = 1'h1; end
                        4'h3: begin value_out = 4'h4; bout = 1'h1; end
                        4'h4: begin value_out = 4'h5; bout = 1'h1; end
                        4'h5: begin value_out = 4'h6; bout = 1'h1; end
                        4'h6: begin value_out = 4'h7; bout = 1'h1; end
                        4'h7: begin value_out = 4'h8; bout = 1'h1; end
                        4'h8: begin value_out = 4'h9; bout = 1'h1; end
                        4'h9: begin value_out = 4'h0; bout = 1'h0; end
                        default: begin value_out = 4'h1; bout = 1'h1; end
                    endcase
                end
                default : begin
                    case(B) 
                        4'h1: begin value_out = 4'h1; bout = 1'h0; end
                        4'h2: begin value_out = 4'h2; bout = 1'h0; end
                        4'h3: begin value_out = 4'h3; bout = 1'h0; end
                        4'h4: begin value_out = 4'h4; bout = 1'h0; end
                        4'h5: begin value_out = 4'h5; bout = 1'h0; end
                        4'h6: begin value_out = 4'h6; bout = 1'h0; end
                        4'h7: begin value_out = 4'h7; bout = 1'h0; end
                        4'h8: begin value_out = 4'h8; bout = 1'h0; end
                        4'h9: begin value_out = 4'h9; bout = 1'h0; end
                        default: begin value_out = 4'h0; bout = 1'h0; end
                    endcase
                end
            endcase
        end
    end
endmodule
