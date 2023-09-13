// Generico round AES (round da 1 a 9)
module round(data_in,key_in,data_out);
    input [127:0] data_in, key_in;
    output [127:0] data_out;

    wire [127:0] sub_data_out, shift_data_out, mix_data_out; 

    subbytes a1(data_in,sub_data_out);
    shiftrows a2(sub_data_out,shift_data_out);
    mixcolumn a3(shift_data_out,mix_data_out);

    assign data_out = mix_data_out ^ key_in;
endmodule