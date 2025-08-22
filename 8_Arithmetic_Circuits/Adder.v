//Implement the following circuit: https://hdlbits.01xz.net/wiki/File:Exams_m2014q4j.png

module top_module (
    input [3:0] x,
    input [3:0] y, 
    output [4:0] sum);
assign sum=x+y;
endmodule
