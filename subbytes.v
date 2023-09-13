// In a 128-bit block (data_in) each byte is replaced with its value in S-box
module subbytes(data_in, sb_data_out);

	// 128-bit input signal (In AES the size of each block is 128 bit)
	input [127:0] data_in;
	output [127:0] sb_data_out;
	
	// Internal wire used for data taken out from each S-box and finally assigned to sb_data_out as 128 bit
	wire [127:0] tmp_out;

	// The sbox module takes 8 bits as input data --> 128/8 = 16
	// So we need the sbox module 16 times
	
	sbox s0(data_in[127:120], tmp_out[127:120]);
	sbox s1(data_in[119:112], tmp_out[119:112]);
	sbox s2(data_in[111:104], tmp_out[111:104]);
	sbox s3(data_in[103:96], tmp_out[103:96]);

	sbox s4(data_in[95:88], tmp_out[95:88]);
	sbox s5(data_in[87:80], tmp_out[87:80]);
	sbox s6(data_in[79:72], tmp_out[79:72]);
	sbox s7(data_in[71:64], tmp_out[71:64]);

	sbox s8(data_in[63:56], tmp_out[63:56]);
	sbox s9(data_in[55:48], tmp_out[55:48]);
	sbox s10(data_in[47:40], tmp_out[47:40]);
	sbox s11(data_in[39:32], tmp_out[39:32]);

	sbox s12(data_in[31:24], tmp_out[31:24]);
	sbox s13(data_in[23:16], tmp_out[23:16]);
	sbox s14(data_in[15:8], tmp_out[15:8]);
	sbox s15(data_in[7:0], tmp_out[7:0]);
	
	assign sb_data_out = tmp_out;
	
endmodule
	
	
	