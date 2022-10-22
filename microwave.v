`include "Sistemas - MicroOndas/Controle do Magnetron/control_magn.v"
`include "Sistemas - MicroOndas/Controle do Timer/encoder.v"
`include "Sistemas - MicroOndas/Decoder 7 Segmentos/decoder.v"
`include "Sistemas - MicroOndas/Timer/timer.v"
module microwave (
    input wire startn, clearn, stopn, door_closed,
    input wire [9:0] keypad,
    input wire clock,
    output wire [6:0] sec_ones_seg,
    output wire [6:0] sec_tens_seg,
    output wire [6:0] mins_seg,
    output wire mag_on
);

wire mag_output;
assign mag_on = mag_output;

wire timer_loadn;
wire timer_clk;
wire [3:0] timer_data;
wire timer_done;

wire [3:0] sec_ones;
wire [3:0] sec_tens;
wire [3:0] mins;

encoder keyboardEncoder (.key(keypad), .clk(clock), .enablen(mag_output), .D(timer_data), .pgt_1hz(timer_clk), .loadn(timer_loadn));
timer main_timer(.data_in(timer_data), .loadn(timer_loadn), .clock(timer_clk), .clear(clearn), .enable(mag_on), .sec_ones(sec_ones), .sec_tens(sec_tens), .mins(min), .zero(timer_done));
control_magn mainControl(.startn(startn), .stopn(stopn), .clearn(clearn), .door_closed(door_closed), .mag_on(mag_output), .timer_done(timer_done));
decoder decoderDisplay(.sec_ones(sec_ones), .sec_tens(sec_tens), .min(min), .sec_ones_segs(sec_ones_seg), .sec_tens_segs(sec_tens_seg), .min_segs(mins_seg));

endmodule