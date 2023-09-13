module mixcolumn_tb;

reg [127:0] in;
wire [127:0] out;

mixcolumn m (in, out);

initial begin
    $monitor("in= %h, out = %h", in, out);
    in=128'h_d4bf5d30_e0b452ae_b84111f1_1e2798e5;
end

endmodule