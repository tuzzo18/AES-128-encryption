# AES-128 encryption Implementation in Verilog

I file sono stati scritti nel seguente ordine:
- sbox.v
- subbytes.v
- shiftrows.v
- mixcolumn.v
- key_schedule.v
- round.v
- last_round.v
- aes_main.v

Il corretto funzionamento dei vari moduli è stato testato eseguendo i relativi testbench tramite il compilatore Icarus per Windows.
https://bleyer.org/icarus/

Per eseguire i testbench è necessario seguire i seguenti step:
1) Aprire il terminale e recarsi nel path in cui si trova il compilatore e i vari codici sorgente (file con estensione .v): "C:\iverilog\bin"
2) Eseguire il seguente comando per produrre il file ogetto:\
   .\iverilog -o <nome_file_output> <nome_file.v>
4) Per eseguire il file lanciare il comando:\
   .\vvp <nome_file_output>

Ad esempio, per eseguire il testbench relativo al file mixcolumn.v è necessario lanciare i seguenti comandi:

.\iverilog -o mixcolumn_tb mixcolumn_tb.v mixcolumn.v
\
.\vvp mixcolumn_tb

Per testare il modulo principale aes_main (per verificare che il ciphertext generato sia corretto) lanciare i seguenti comandi:\

.\iverilog -o aes_main_tb aes_main_tb.v aes_main.v g_function.v mixcolumn.v round.v last_round.v sbox.v subbytes.v shiftrows.v key_schedule.v
\
.\vvp aes_main_tb
