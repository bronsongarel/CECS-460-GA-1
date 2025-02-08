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
    reg submit_tb, nextLevel_tb, clk_tb, reset_tb;
    wire[2:0] out_tb;
    integer i;
    
    localparam period = 10;
    
    top uut(.clk(clk_tb), .submit(submit_tb), .nextLevel(nextLevel_tb), .data(data_tb), .reset(reset_tb), .out(out_tb));
    
    initial begin
        clk_tb = 0;
        forever begin
            clk_tb = ~clk_tb;
            #(period/4);
        end
    end
    initial begin
        for(i = 0; i < 128; i = i + 1) begin
            {data_tb, submit_tb, nextLevel_tb, reset_tb} = i;
            #period;
        end
    end
endmodule
