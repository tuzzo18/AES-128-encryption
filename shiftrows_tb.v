module shiftrows_tb;

reg [127:0] in;
wire [127:0] out;

shiftrows sr (in, out);

initial begin
    $monitor("in= %h, out = %h", in, out);
    in=128'h_d42711ae_e0bf98f1_b8b45de5_1e415230;
end

endmodule