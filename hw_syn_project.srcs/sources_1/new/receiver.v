module receiver(
    input clk, //baud
    input bit_in,
    //output reg received,
    output wire rout,
    output reg [7:0] data_out
    );
    
    reg received = 0;
    wire sr1,sr2;
    singlePulser pulse1(sr1, received, clk);
    singlePulser pulse2(sr2, sr1, clk);
    assign rout = sr1 | sr2;
    
    
    reg last_bit;
    reg receiving = 0;
    reg [7:0] count;
    
    always@(posedge clk) begin
        if (~receiving & last_bit & ~bit_in) begin
                receiving <= 1;
                received <= 0;
                count <= 0;
        end

        last_bit <= bit_in;
      
        if (receiving) 
            count <= count + 1;
        else 
            count <= 0;
        
        case (count)
            8'd24: data_out[0] <= bit_in;
            8'd40: data_out[1] <= bit_in;
            8'd56: data_out[2] <= bit_in;
            8'd72: data_out[3] <= bit_in;
            8'd88: data_out[4] <= bit_in;
            8'd104: data_out[5] <= bit_in;
            8'd120: data_out[6] <= bit_in;
            8'd136: data_out[7] <= bit_in;
            8'd152: begin 
                        received <= 1; 
                        receiving <= 0;
                    end
        endcase
    end
endmodule
