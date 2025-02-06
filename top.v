`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CSULB
// Engineer: Kenneth Vuong
// 
// Create Date: 02/04/2025 07:39:08 PM
// Design Name: 
// Module Name: top
// Project Name: Lab 1
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


module top(
    input [3:0] data,
    input select,
    input reset,
    input clk,
    output reg[2:0] out
    );
    parameter val1 = 4'b0101;
    parameter val2 = 4'b1011;
    parameter val3 = 4'b0001;
    parameter val4 = 4'b1000;
    
    reg select_ff1, select_ff2;
    wire select_negedge;

    always @(posedge clk) begin
        select_ff1 <= select;      // Synchronize button press
        select_ff2 <= select_ff1;  // Second-stage flip-flop
    end

    assign select_negedge = select_ff2 & ~select_ff1; // Detect falling edge

    always @(posedge clk or posedge reset) begin
        if (reset)
            out <= 3'b000;
        else if (select_negedge) begin
            out <= 3'b000;
            case (data)
                4'b0101, 4'b1011, 4'b0001, 4'b1000: out <= 3'b010;
                default: out <= 3'b100;
            endcase
        end
    end
endmodule
