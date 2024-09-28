`timescale 1ns / 1ps

module tb_time_clock;

    reg clk;
    reg rst;
    wire [5:0] sec;
    wire [5:0] min;
    wire [4:0] hour;

    time_of_day_clock uut (
        .clk(clk),
        .rst(rst),
        .sec(sec),
        .min(min),
        .hour(hour)
    );

    initial 
    begin

        clk = 0;
        rst = 1;
        #10;
        rst = 0;
        #10;       
    end
    always #1 clk = ~clk; 
endmodule
