module subbytes_tb;

reg [127:0] in;
wire [127:0] out;

subbytes sb (in, out);

initial begin
    $monitor("in= %h, out = %h", in, out);
    in=128'h_193de3be_a0f4e22b_9ac68d2a_e9f84808;
end

endmodule