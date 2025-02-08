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

module top (
    input clk,
    input submit,
    input nextLevel,
    input [3:0] data,
    output reg[2:0] out
);
    reg [3:0] bram [0:9];
    reg [3:0] addr;
    integer i;
    
    wire nextLevelNew;
    button_debouncer bd1 (.clk(clk), .reset(), .button_in(nextLevel), .button_out(nextLevelNew));
    
    initial begin
        for (i = 0; i < 10; i = i + 1) begin
            bram[i] = (13 * i + 46) % 16; // Assigns sequential values (0000 to 1001)
        end
        out <= 3'b000;
        addr <= 0;
    end
    always @(posedge clk) begin
        if (submit) begin
            if (data == bram[addr])
                out <= 3'b010;
            else
                out <= 3'b001;
        end
        else if (nextLevelNew) begin
            if (addr < 9)
                addr <= addr + 1;
            else
                addr <= 0;
            out <= 3'b000;
        end
    end
endmodule
