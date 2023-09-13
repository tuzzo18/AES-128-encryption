// multiplication by 02 in GF(2^8)
module mul_2(data_in, data_out);
    input [7:0] data_in;
    output [7:0] data_out;
    
    //{data_in[6:0],1'b0} è uno shift a sinistra di 1 bit ({} is a concatenation operation)
    assign data_out = {data_in[6:0],1'b0} ^ (8'h1b & {8{data_in[7]}});
endmodule

//multiplication by 03 in GF(2^8)
module mul_3(data_in,data_out);
    input [7:0] data_in;
    output [7:0] data_out;
    wire [7:0] tmp_out;

    // Multiply by 03 means multiply by 02 and add (XOR) the original value
    mul_2 m1(data_in, tmp_out);
    assign data_out = tmp_out ^ data_in;
endmodule

module mul_32(m_data_in, m_data_out);
    input [31:0] m_data_in;
    output [31:0] m_data_out;

    wire [7:0] tmp1, tmp2, tmp3, tmp4;
    wire [7:0] ma0, ma1, ma2, ma3;
    wire [7:0] m2_tmp_out1, m2_tmp_out2, m2_tmp_out3, m2_tmp_out4;
    wire [7:0] m3_tmp_out1, m3_tmp_out2, m3_tmp_out3, m3_tmp_out4;

    // B0
    assign tmp1 = m_data_in[31:24];
    // B5
    assign tmp2 = m_data_in[23:16];
    // B10
    assign tmp3 = m_data_in[15:8];
    // B15
    assign tmp4 = m_data_in[7:0];

    // Multiplication by 02
    mul_2 m1 (tmp1,m2_tmp_out1);
    mul_2 m2 (tmp2,m2_tmp_out2);
    mul_2 m3 (tmp3,m2_tmp_out3);
    mul_2 m4 (tmp4,m2_tmp_out4);

    // Multiplication by 03
    mul_3 m5(tmp1,m3_tmp_out1);
    mul_3 m6(tmp2,m3_tmp_out2);
    mul_3 m7(tmp3,m3_tmp_out3);
    mul_3 m8(tmp4,m3_tmp_out4);

    assign ma0 = m2_tmp_out1 ^ m3_tmp_out2 ^ tmp3 ^ tmp4;
    assign ma1 = tmp1 ^ m2_tmp_out2 ^ m3_tmp_out3 ^ tmp4;
    assign ma2 = tmp1 ^ tmp2 ^ m2_tmp_out3 ^ m3_tmp_out4;
    assign ma3 = m3_tmp_out1 ^ tmp2 ^ tmp3 ^ m2_tmp_out4;

    assign m_data_out = {ma0,ma1,ma2,ma3};
endmodule

module mixcolumn(data_in, data_out);
    input [127:0] data_in;
    output  [127:0] data_out;

    wire  [31:0] n1, n2, n3, n4;
    wire  [31:0] n_tmp_out1, n_tmp_out2, n_tmp_out3, n_tmp_out4;

    assign n1 = data_in[127:96];
    assign n2 = data_in[95:64];
    assign n3 = data_in[63:32];
    assign n4 = data_in[31:0];

    mul_32 m1 (n1,n_tmp_out1);
    mul_32 m2 (n2,n_tmp_out2);
    mul_32 m3 (n3,n_tmp_out3);
    mul_32 m4 (n4,n_tmp_out4);

    assign data_out={n_tmp_out1,n_tmp_out2,n_tmp_out3,n_tmp_out4};
endmodule

