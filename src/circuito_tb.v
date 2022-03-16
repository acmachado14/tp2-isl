`include "circuito.v"

module values_TB;
    wire a, b, c, d;
    reg reset, tb_b8, tb_b7, tb_b6, tb_b5, tb_b4, tb_b3, tb_b2, tb_b1;
    Circuito dut( a, b, c, d, reset, tb_b8, tb_b7, tb_b6, tb_b5, tb_b4, tb_b3, tb_b2, tb_b1);
    initial begin
        $monitor("Entrada = %b%b%b%b%b%b%b%b | Estado Atual = %b%b%b%b", tb_b8, tb_b7, tb_b6, tb_b5, tb_b4, tb_b3, tb_b2, tb_b1, a, b, c, d);
        reset = 0; tb_b8 = 1;  tb_b7 = 1; tb_b6 = 0; tb_b5 = 1;  tb_b4 = 1; tb_b3 = 0; tb_b2 = 0; tb_b1 = 0; #1
        reset = 0; tb_b8 = 1;  tb_b7 = 1; tb_b6 = 1; tb_b5 = 0;  tb_b4 = 1; tb_b3 = 0; tb_b2 = 1; tb_b1 = 1; #1
        reset = 0; tb_b8 = 1;  tb_b7 = 1; tb_b6 = 0; tb_b5 = 0;  tb_b4 = 1; tb_b3 = 1; tb_b2 = 1; tb_b1 = 1; #1
        reset = 0; tb_b8 = 1;  tb_b7 = 0; tb_b6 = 1; tb_b5 = 0;  tb_b4 = 1; tb_b3 = 0; tb_b2 = 0; tb_b1 = 0; #1
        reset = 0; tb_b8 = 1;  tb_b7 = 0; tb_b6 = 0; tb_b5 = 0;  tb_b4 = 1; tb_b3 = 1; tb_b2 = 0; tb_b1 = 0; #1
        reset = 0; tb_b8 = 1;  tb_b7 = 0; tb_b6 = 1; tb_b5 = 1;  tb_b4 = 0; tb_b3 = 0; tb_b2 = 1; tb_b1 = 0; #1
        reset = 0; tb_b8 = 1;  tb_b7 = 0; tb_b6 = 0; tb_b5 = 1;  tb_b4 = 0; tb_b3 = 1; tb_b2 = 1; tb_b1 = 0; #1
        reset = 0; tb_b8 = 1;  tb_b7 = 0; tb_b6 = 1; tb_b5 = 0;  tb_b4 = 0; tb_b3 = 0; tb_b2 = 1; tb_b1 = 1; #1;

        reset = 1; tb_b8 = 0;  tb_b7 = 0; tb_b6 = 1; tb_b5 = 0;  tb_b4 = 0; tb_b3 = 0; tb_b2 = 1; tb_b1 = 1; #1;
        reset = 0; tb_b8 = 0;  tb_b7 = 0; tb_b6 = 1; tb_b5 = 0;  tb_b4 = 0; tb_b3 = 0; tb_b2 = 1; tb_b1 = 0; #1;
    end
endmodule