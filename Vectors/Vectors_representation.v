//1Build a circuit that has one 3-bit input, then outputs the same vector, and also splits it into three separate 1-bit outputs. Connect output o0 to the input vector's position 0, o1 to position 1, etc.
In a diagram, a tick mark with a number next to it indicates the width of the vector (or "bus"), rather than drawing a separate line for each bit in the vector.*/


module top_module ( 
    input wire [2:0] vec,
    output wire [2:0] outv,
    output wire o2,
    output wire o1,
    output wire o0  ); // Module body starts after module declaration
assign outv=vec;
    assign o2=vec[2];
    assign o1=vec[1];
    assign o0=vec[0];
endmodule


//2.Build a combinational circuit that splits an input half-word (16 bits, [15:0] ) into lower [7:0] and upper [15:8] bytes.

`default_nettype none     // Disable implicit nets. Reduces some types of bugs.
module top_module( 
    input wire [15:0] in,
    output wire [7:0] out_hi,
    output wire [7:0] out_lo );
    assign out_hi=in[15:8];
    assign out_lo=in[7:0];
endmodule


/*3.A 32-bit vector can be viewed as containing 4 bytes (bits [31:24], [23:16], etc.). Build a circuit that will reverse the byte ordering of the 4-byte word.

AaaaaaaaBbbbbbbbCcccccccDddddddd => DdddddddCcccccccBbbbbbbbAaaaaaaa
This operation is often used when the endianness of a piece of data needs to be swapped, for example between little-endian x86 systems and the big-endian formats used in many Internet protocols.*/

module top_module( 
    input [31:0] in,
    output [31:0] out );//

    assign out[31:24] =in[7:0];
    assign out[23:16] =in[15:8];
    assign out[15:8] =in[23:16];
    assign out[7:0] =in[31:24];

endmodule


/*4.Build a circuit that has two 3-bit inputs that computes the bitwise-OR of the two vectors, the logical-OR of the two vectors, and the inverse (NOT) of both vectors. Place the inverse of b in the upper half of out_not (i.e., bits [5:3]), and the inverse of a in the lower half.*/



module top_module( 
    input [2:0] a,
    input [2:0] b,
    output [2:0] out_or_bitwise,
    output out_or_logical,
    output [5:0] out_not
);
assign out_or_bitwise=a|b;
    assign out_or_logical=a||b;
    assign out_not={~b,~a};
endmodule



/*5.Build a combinational circuit with four inputs, in[3:0].

There are 3 outputs:

out_and: output of a 4-input AND gate.
out_or: output of a 4-input OR gate.
out_xor: output of a 4-input XOR gate.*/


module top_module( 
    input [3:0] in,
    output out_and,
    output out_or,
    output out_xor
);
assign out_and=&in;
    assign out_or=|in;
    assign out_xor=in[0]^in[1]^in[2]^in[3];
endmodule


