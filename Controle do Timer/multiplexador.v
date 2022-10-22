module mux2to1 (
    input wire sel,
    input wire a, 
    input wire b,
    output wire out
);

    assign out = (sel == 0 ? a : b);

endmodule