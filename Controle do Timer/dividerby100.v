module dividerby100 (
    input wire clk,
    output wire clk_div
);

    reg [6:0] count = 0;
    reg is10 = 0;
    assign clk_div = is10;

    always @ (posedge clk) begin
        count <= count + 1;

        if (count == 7'd99) 
        begin
            is10 <= 1;
            count <= 0;
        end

        else
        begin
            is10 <= 0;
        end
    end
endmodule