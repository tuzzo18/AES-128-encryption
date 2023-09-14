module g_function_tb;

reg [31:0] in;
wire [31:0] out;

g_function g (in, out);

initial begin
    $monitor("in= %h, out = %h", in, out);
    in=32'h_aa_bb_cc_dd;
end

endmodule