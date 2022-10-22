`include "Sistemas - MicroOndas/Controle do Timer/debouncer.v"
`include "Sistemas - MicroOndas/Controle do Timer/dividerby100.v"
`include "Sistemas - MicroOndas/Controle do Timer/p_encoder.v"
`include "Sistemas - MicroOndas/Controle do Timer/multiplexador.v"
module encoder (
    input wire [9:0] key,
    input wire clk,
    input wire enablen,
    output wire [3:0] D,
    output wire pgt_1hz,
    output wire loadn
);

    wire int_clr, mux_a, mux_b;

    p_encoder p_enc (.keypad(key), .enablen(enablen), .D(D), .all_off(int_clr));
    debouncer dbc (.clk(clk), .clear(int_clr), .out(mux_a));
    dividerby100 div (.clk(clk), .clk_div(mux_b));
    mux2to1 mux (.a(mux_a), .b(mux_b), .sel(enablen), .out(pgt_1hz));

    assign loadn = int_clr;

endmodule