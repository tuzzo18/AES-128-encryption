module keyschedule_tb;

reg [127:0] in_key;
wire [127:0] sk0;
wire [127:0] sk1;
wire [127:0] sk2;
wire [127:0] sk3;
wire [127:0] sk4;
wire [127:0] sk5;
wire [127:0] sk6;
wire [127:0] sk7;
wire [127:0] sk8;
wire [127:0] sk9;
wire [127:0] sk10;


aes_128_key_schedule ks (in_key, sk0, sk1, sk2, sk3, sk4, sk5, sk6, sk7, sk8, sk9, sk10);

initial begin
    $monitor("input_key= %h, sub_key0 = %h, sub_key1 = %h, sub_key2 = %h, sub_key3 = %h, sub_key4 = %h, sub_key5 = %h, sub_key6 = %h, sub_key7 = %h, sub_key8 = %h, sub_key9 = %h, sub_key10 = %h", 
    in_key, sk0, sk1, sk2, sk3, sk4, sk5, sk6, sk7, sk8, sk9, sk10);
    in_key=128'h_2b7e1516_28aed2a6_abf71588_09cf4f3c;
end

endmodule