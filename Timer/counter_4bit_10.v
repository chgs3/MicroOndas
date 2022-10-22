module counter_4bit_10 (
    output wire [3:0] data_out,
    output wire tc,
    output wire zero,
    input wire loadn, clock, clear, enable,
    input wire [3:0] data_in 
);

    reg [3:0] current_state;
    assign data_out = current_state;

    assign zero = (current_state == 0) ? 1:0; 
    assign tc = ((current_state == 0) & enable) ? 1:0;

    always @(posedge clock)

    begin
        if (enable) begin
            if (current_state == 4'b0000) begin
                current_state <= 4'd9;
            end

            else begin
                current_state <= current_state - 1;
            end

        end

        else begin

            if (!loadn) begin
                current_state <= data_in;
            end

        end  

    end

    always @(negedge clear) begin

        if (!clear) begin
            current_state <= 4'b0000;
        end

    end

endmodule