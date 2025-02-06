`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/04/2025 07:51:57 PM
// Design Name: 
// Module Name: top_tb
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


module top_tb(
    );
    reg[3:0] data_tb;
    reg select_tb;
    wire[2:0] out_tb;
    integer i;
    
    localparam period = 50;
    
    top uut(.data(data_tb), .select(select_tb), .out(out_tb));
    
    initial begin
        select_tb = 0;
        forever begin
            select_tb = ~select_tb;
            #(period/4);
        end
    end
    initial begin
        for(i = 0; i < 16; i = i + 1) begin
            data_tb = i;
            #period;
        end
    end
endmodule
