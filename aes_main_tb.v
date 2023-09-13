module aes_main_tb;

reg [127:0] plaintext;
reg [127:0] key;
wire [127:0] ciphertext;

aes_main a (plaintext, key, ciphertext);

initial begin
    $monitor("plaintext = 0x%h, ciphertext = %h", plaintext, ciphertext);
    plaintext=128'h_3243f6a8_885a308d_313198a2_e0370734;
    key=128'h_2b7e1516_28aed2a6_abf71588_09cf4f3c;
end

endmodule

