// Va effettuato poi lo XOR tra gli 8 bit più a sinistra dell'output ed rcon! (implementato nel modulo aes_128_key_schedule)
module g_function(data_in, data_out);

    input [31:0] data_in;
    output [31:0] data_out;

    wire [7:0] v0, v1, v2, v3;

    assign v0 = data_in[31:24];
    assign v1 = data_in[23:16];
    assign v2 = data_in[15:8];
    assign v3 = data_in[7:0];

    // Sostituzione tramite s-box + spostamento del byte
    sbox s1(v0, data_out[7:0]);
    sbox s2(v1, data_out[31:24]);
    sbox s3(v2, data_out[23:16]);
    sbox s4(v3, data_out[15:8]);

endmodule