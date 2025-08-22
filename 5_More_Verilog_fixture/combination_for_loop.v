//Given a 100-bit input vector [99:0], reverse its bit ordering.


module top_module( 
    input [99:0] in,
    output [99:0] out
);
    integer i;
    always @(in) begin
        for (i=0;i<100;i=i+1) begin
            out[i]=in[99-i];
        end
    end
        
endmodule



//A "population count" circuit counts the number of '1's in an input vector. Build a population count circuit for a 255-bit input vector.


module top_module( 
    input [254:0] in,
    output [7:0] out );
    
    
    integer i;
    always@(*) begin
        out=0;
    for(i=0;i<255;i=i+1)begin
        out=out+in[i];
    end
    end
endmodule
