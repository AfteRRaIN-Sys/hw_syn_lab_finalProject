module baudrate_gen(
    input clk,
    output reg baud
    );
    
    integer counter = 0;
    initial begin
        baud <= 0;
    end
    always @(posedge clk)
    begin
        counter = counter + 1;
        if (counter == 325) begin counter = 0; baud = ~baud; end
    end
endmodule