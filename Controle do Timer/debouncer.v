module debouncer (
    input wire clear, 
    input wire clk,
    output reg out = 0
);

    reg [2:0] count = 3'd0;
    reg counting = 0;

    always @ (posedge clear) begin

        if (count == 3'd7)
        begin
            counting = 0;
            count = 3'd0;
            out = 0;
        end

    end

    always @ (negedge clear) begin

        if (count < 3'd7 && counting == 1) 
        begin
            count <= count + 1;
        end

        if (count == 3'd3) 
        begin
            out <= 1;
        end
        
    end
endmodule
