module time_of_day_clock (
    input wire clk,         
    input wire rst,         
    output reg [5:0] sec,   
    output reg [5:0] min,  
    output reg [4:0] hour   
    );

    reg [31:0] clk_div;     
    reg clk_1hz;            

    always @(posedge clk or posedge rst) 
    begin
        if (rst) 
            begin
                clk_div <= 32'd0;
                clk_1hz <= 1'b0;
            end 
        else if (clk_div == 32'd25_000_000) 
            begin
                clk_div <= 32'd0;
                clk_1hz <= ~clk_1hz;
            end 
        else 
            begin
                clk_div <= clk_div + 1;
            end
    end

    always @(posedge clk_1hz or posedge rst) 
    begin
        if (rst) 
            begin
                sec <= 6'd0;
                min <= 6'd0;
                hour <= 5'd0;
            end 
        else if (sec == 6'd59) 
        begin
            sec <= 6'd0;
            if (min == 6'd59) 
            begin
                min <= 6'd0;
                if (hour == 5'd23) 
                    begin
                        hour <= 5'd0;
                    end 
                else 
                    begin
                        hour <= hour + 1;
                    end
            end 
            else 
                begin
                    min <= min + 1;
                end
        end 
            else 
                begin
                    sec <= sec + 1;
                end
    end
endmodule
