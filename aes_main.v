module aes_main(data_in,key,data_out);
    
    input [127:0] data_in, key;
    output  [127:0] data_out;

    wire [127:0] key_s,key_s0,key_s1,key_s2,key_s3,key_s4,key_s5,key_s6,key_s7,key_s8,key_s9;
    wire [127:0] r_data_out,r0_data_out,r1_data_out,r2_data_out,r3_data_out,r4_data_out,r5_data_out,r6_data_out,r7_data_out,r8_data_out,r9_data_out;

    assign r_data_out = data_in ^ key_s;


    aes_key_expand_128 a0(key,key_s,key_s0,key_s1,key_s2,key_s3,key_s4,key_s5,key_s6,key_s7,key_s8,key_s9);
    round r0(r_data_out,key_s0,r0_data_out);
    round r1(r0_data_out,key_s1,r1_data_out);
    round r2(r1_data_out,key_s2,r2_data_out);
    round r3(r2_data_out,key_s3,r3_data_out);
    round r4(r3_data_out,key_s4,r4_data_out);
    round r5(r4_data_out,key_s5,r5_data_out);
    round r6(r5_data_out,key_s6,r6_data_out);
    round r7(r6_data_out,key_s7,r7_data_out);
    round r8(r7_data_out,key_s8,r8_data_out);
    last_round r9(r8_data_out,key_s9,r9_data_out);

    assign data_out = r9_data_out;
endmodule