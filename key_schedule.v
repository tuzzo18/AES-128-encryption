module aes_128_key_schedule(key, sk0, sk1, sk2, sk3, sk4, sk5, sk6, sk7, sk8, sk9, sk10);

    input [127:0] key;
    output [127:0] sk0, sk1, sk2, sk3, sk4, sk5, sk6, sk7, sk8, sk9, sk10;

    wire [31:0]	w0,w1,w2,w3, w4, w5, w6, w7, w8, w9, w10, w11, w12, w13, w14, w15, w16, w17,
                w18, w19, w20, w21, w22, w23, w24, w25, w26, w27, w28, w29, w30, w31, w32, w33,
                w34, w35, w36, w37, w38, w39, w40, w41, w42, w43;

    wire [31:0]	subword1,subword2,subword3,subword4,subword5,subword6,subword7,subword8,subword9,subword10;
    wire [7:0] rcon1,rcon2,rcon3,rcon4,rcon5,rcon6,rcon7,rcon8,rcon9,rcon10;

    assign rcon1 = 8'h01;
    assign rcon2 = 8'h02;
    assign rcon3 = 8'h04;
    assign rcon4 = 8'h08;
    assign rcon5 = 8'h10;
    assign rcon6 = 8'h20;
    assign rcon7 = 8'h40;
    assign rcon8 = 8'h80;
    assign rcon9 = 8'h1b;
    assign rcon10 = 8'h36;

    assign w0 =  key[127:096];
    assign w1 =  key[095:064];
    assign w2 =  key[063:032];
    assign w3 =  key[031:000];

    g_function g1(w3, subword1);
    // Lo XOR con rcon deve essere fatto solo con gli 8 bit più a sinistra della subword:
    // aggiungiamo 24 bit a 0 a destra della costante rcon così lo XOR fa passare inalterati i rispettivi 24 bit della subword
    assign w4 = w0 ^ (subword1 ^ {rcon1, 24'b0});
    assign w5 = w1 ^ w4;
    assign w6 = w2 ^ w5;
    assign w7 = w3 ^ w6;

    g_function g2(w7, subword2);
    assign w8 = w4 ^ (subword2 ^ {rcon2, 24'b0});
    assign w9 = w5 ^ w8;
    assign w10 = w6 ^ w9;
    assign w11 = w7 ^ w10;

    g_function g3(w11, subword3);
    assign w12 = w8 ^ (subword3 ^ {rcon3, 24'b0});
    assign w13 = w9 ^ w12;
    assign w14 = w13 ^ w10;
    assign w15 = w11 ^ w14;

    g_function g4(w15, subword4);
    assign w16 = w12 ^ (subword4 ^ {rcon4, 24'b0});
    assign w17 = w13 ^ w16;
    assign w18 = w14 ^ w17;
    assign w19 = w15 ^ w18;

    g_function g5(w19, subword5);
    assign w20 = w16 ^ (subword5 ^ {rcon5, 24'b0});
    assign w21 = w17 ^ w20;
    assign w22 = w18 ^ w21;
    assign w23 = w19 ^ w22;

    g_function g6(w23, subword6);
    assign w24 = w20 ^ (subword6 ^ {rcon6, 24'b0});
    assign w25 = w21 ^ w24;
    assign w26 = w22 ^ w25;
    assign w27 = w23 ^ w26;

    g_function g7(w27, subword7);
    assign w28 = w24 ^ (subword7 ^ {rcon7, 24'b0});
    assign w29 = w25 ^ w28;
    assign w30 = w26 ^ w29;
    assign w31 = w27 ^ w30;

    g_function g8(w31, subword8);
    assign w32 = w28 ^ (subword8 ^ {rcon8, 24'b0});
    assign w33 = w29 ^ w32;
    assign w34 = w30 ^ w33;
    assign w35 = w31 ^ w34;

    g_function g9(w35, subword9);
    assign w36 = w32 ^ (subword9 ^ {rcon9, 24'b0});
    assign w37 = w33 ^ w36;
    assign w38 = w34 ^ w37;
    assign w39 = w35 ^ w38;

    g_function g10(w39, subword10);
    assign w40 = w36 ^ (subword10 ^ {rcon10, 24'b0});
    assign w41 = w37 ^ w40;
    assign w42 = w38 ^ w41;
    assign w43 = w39 ^ w42;

    // Output
    assign sk0={w0,w1,w2,w3};
    // subkey 1
    assign sk1={w4,w5,w6,w7};
    // subkey 2
    assign sk2={w8,w9,w10,w11};
    // subkey 3
    assign sk3={w12,w13,w14,w15};
    // subkey 4
    assign sk4={w16,w17,w18,w19};
    // subkey 5
    assign sk5={w20,w21,w22,w23};
    // subkey 6
    assign sk6={w24,w25,w26,w27};
    // subkey 7
    assign sk7={w28,w29,w30,w31};
    // subkey 8
    assign sk8={w32,w33,w34,w35};
    // subkey 9
    assign sk9={w36,w37,w38,w39};
    // subkey 10
    assign sk10={w40,w41,w42,w43};

endmodule
