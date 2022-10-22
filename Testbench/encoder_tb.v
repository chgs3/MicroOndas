`timescale 1us/1ps

module encoder_tb ();
    reg [9:0] key;
    reg clk;
    reg enablen;

    encoder DUT(.key(key), .clk(clk), .enablen(enablen));

    reg mux_a, mux_b;
    mux2to1 DUT2 (.sel(clk), .a(mux_a), .b(mux_b));

    initial 

    begin
        $dumpfile ("Sistemas - MicroOndas/Testbench/encoder_tb.vcd");
        $dumpvars (0, encoder_tb);

        clk = 1;
        enablen = 0;
        key = 9'b00000000;
    end

    initial

    begin
        #1000 key = 0;
        #100000 key = 1;
        #200000 key = 0;
        #120000 key = 1;
        #1000 key = 0;
        #3000 key = 1;
        #5000 key = 0;
        #2000 key = 1;
        #8000 key = 0;
        #9000 key = 1;
        #500000 key = 0;
        
        enablen = 1;
        #10000000;
    end

initial

begin
    mux_a = 0;
    mux_b = 0;

    #1000 mux_a = 0;
    #1000 mux_b = 0;
    #1000 mux_a = 0;
    #1000 mux_b = 1;
    #1000 mux_a = 1;
    #1000 mux_b = 0;
    #1000 mux_a = 1;
    #1000 mux_b = 1;

    #100;
end
endmodule


