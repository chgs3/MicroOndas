module decoder (
    input wire [3:0] sec_ones,
    input wire [3:0] sec_tens,
    input wire [3:0] min,
    output wire [6:0] sec_ones_segs ,
    output wire [6:0] sec_tens_segs ,
    output wire [6:0] min_segs    
);

    assign sec_ones_segs =(sec_ones == 4'b0000)? 7'b1111110: // 0 
                          (sec_ones == 4'b0001)? 7'b0110000: // 1
                          (sec_ones == 4'b0010)? 7'b1101101: // 2 
                          (sec_ones == 4'b0011)? 7'b1111001: // 3
                          (sec_ones == 4'b0100)? 7'b0110011: // 4
                          (sec_ones == 4'b0101)? 7'b1011011: // 5
                          (sec_ones == 4'b0110)? 7'b1011111: // 6
                          (sec_ones == 4'b0111)? 7'b1110000: // 7
                          (sec_ones == 4'b1000)? 7'b1111111: // 8
                          (sec_ones == 4'b1001)? 7'b1110011: // 9
                          8'bXXXX_XXXX ;
    assign sec_tens_segs =(sec_tens == 4'b0000)? 7'b1111110: // 0 
                          (sec_tens == 4'b0001)? 7'b0110000: // 1
                          (sec_tens == 4'b0010)? 7'b1101101: // 2 
                          (sec_tens == 4'b0011)? 7'b1111001: // 3
                          (sec_tens == 4'b0100)? 7'b0110011: // 4
                          (sec_tens == 4'b0101)? 7'b1011011: // 5
                          (sec_tens == 4'b0110)? 7'b1011111: // 6
                          (sec_tens == 4'b0111)? 7'b1110000: // 7
                          (sec_tens == 4'b1000)? 7'b1111111: // 8
                          (sec_tens == 4'b1001)? 7'b1110011: // 9
                          8'bXXXX_XXXX ;

    assign min_segs =     (min == 4'b0000)? 7'b1111110: // 0 
                          (min == 4'b0001)? 7'b0110000: // 1
                          (min == 4'b0010)? 7'b1101101: // 2 
                          (min == 4'b0011)? 7'b1111001: // 3
                          (min == 4'b0100)? 7'b0110011: // 4
                          (min == 4'b0101)? 7'b1011011: // 5
                          (min == 4'b0110)? 7'b1011111: // 6
                          (min == 4'b0111)? 7'b1110000: // 7
                          (min == 4'b1000)? 7'b1111111: // 8
                          (min == 4'b1001)? 7'b1110011: // 9
                          8'bXXXX_XXXX ; 
    
endmodule