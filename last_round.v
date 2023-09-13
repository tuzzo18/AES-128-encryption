// Ultimo round AES (round 10): non presenta il MixColumn Layer
module last_round(data_in,key_in,data_out_last);
    
    input [127:0] data_in;
    input [127:0] key_in;
    output [127:0] data_out_last;

    wire [127:0] sub_data_out, shift_data_out;

    subbytes s1(data_in,sub_data_out);
    shiftrows s2(sub_data_out,shift_data_out);

    assign data_out_last = shift_data_out ^ key_in;

endmodule

