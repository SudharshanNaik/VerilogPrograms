/*In this exercise, you are provided with the same module add16 as the previous exercise, which adds two 16-bit numbers with carry-in and produces a carry-out and 16-bit sum. You must instantiate three of these to build the carry-select adder, using your own 16-bit 2-to-1 multiplexer.

Connect the modules together as shown in the diagram below. The provided module add16 has the following declaration:

module add16 ( input[15:0] a, input[15:0] b, input cin, output[15:0] sum, output cout );*/

module mux16 (
    input  [15:0] in0,
    input  [15:0] in1,
    input         sel,
    output [15:0] out
);
    assign out = sel ? in1 : in0;
endmodule


module top_module (
    input  [31:0] a,
    input  [31:0] b,
    output [31:0] sum,
    output        cout
);

    wire sel;           
    wire [15:0] sum0, sum1;  
    wire c0, c1;      

    add16 adder1 (.a(a[15:0]),.b(b[15:0]),.cin(1'b0),.sum(sum[15:0]),.cout(sel));

    add16 adder2 (.a(a[31:16]),.b(b[31:16]),.cin(1'b0),.sum(sum0),.cout(c0));

    add16 adder3 (.a(a[31:16]),.b(b[31:16]),.cin(1'b1),.sum(sum1),.cout(c1));

    mux16 mux_upper (.in0(sum0),.in1(sum1),.sel(sel),.out(sum[31:16]));

    assign cout = sel ? c1 : c0;

endmodule
