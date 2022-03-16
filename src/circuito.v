module Circuito (a, b, c, d, reset, tb_b8, tb_b7, tb_b6, tb_b5, tb_b4, tb_b3, tb_b2, tb_b1);

    reg [3:0] estadoAtual = 4'b0000;
    reg finalizado = 1'b0;
    reg [6:0] entrada;
    output a, b, c, d;
    input reset, tb_b8, tb_b7, tb_b6, tb_b5, tb_b4, tb_b3, tb_b2, tb_b1;

    always @(*) begin

        entrada = {tb_b7, tb_b6, tb_b5, tb_b4, tb_b3, tb_b2, tb_b1};

        if (reset == 1'b1) begin
            estadoAtual = 4'b0000;
            finalizado = 1'b0;
        end
        if (tb_b8 == 1'b1 && finalizado != 1'b1) begin
            if ( entrada == 7'b1011000) begin
                if (estadoAtual == 4'b0000 || estadoAtual == 4'b0010) begin // for igual a 0 ou 2
                    estadoAtual = 4'b0001; //1
                end else begin
                    estadoAtual = 4'b1001; //7
                    finalizado = 1'b1;
                end
            end
            if ( entrada == 7'b1101011) begin
                if (estadoAtual == 4'b0000 || estadoAtual == 4'b0001 || estadoAtual == 4'b0011) begin // for igual a 0 ou 1 ou 3
                    estadoAtual = 4'b0010; //2
                end else begin
                    estadoAtual = 4'b1001; //7
                    finalizado = 1'b1;
                end
            end
            if ( entrada == 7'b1001111) begin
                if (estadoAtual == 4'b0000 || estadoAtual == 4'b0010 || estadoAtual == 4'b0100) begin // for igual a 0 ou 2 ou 4
                    estadoAtual = 4'b0011; //3
                end else begin
                    estadoAtual = 4'b1001; //7
                    finalizado = 1'b1;
                end
            end
            if ( entrada == 7'b0101000) begin
                if (estadoAtual == 4'b0000 || estadoAtual == 4'b0011 || estadoAtual == 4'b0101) begin // for igual a 0 ou 3 ou 5
                    estadoAtual = 4'b0100; //4
                end else begin
                    estadoAtual = 4'b1001; //7
                    finalizado = 1'b1;
                end
            end
            if ( entrada == 7'b0001100) begin
                if (estadoAtual == 4'b0000 || estadoAtual == 4'b0100) begin // for igual a 0 ou 4
                    estadoAtual = 4'b0101; //5
                end else begin
                    estadoAtual = 4'b1001; //7
                    finalizado = 1'b1;
                end
            end
            if ( entrada == 7'b0110010) begin
                if (estadoAtual == 4'b0001 || estadoAtual == 4'b0010 || estadoAtual == 4'b0011) begin // for igual 1 ou 2 ou 3
                    estadoAtual = 4'b1000; //6
                    finalizado = 1'b1;
                end
            end
            if ( entrada == 7'b0010110) begin
                estadoAtual = 4'b1001; //7
                finalizado = 1'b1;
            end
            if ( entrada == 7'b0100011 && estadoAtual != 4'b0000) begin
                if (estadoAtual == 4'b0100 || estadoAtual == 4'b0101) begin // for igual 4 ou 5
                    estadoAtual = 4'b1010; //8
                    finalizado = 1'b1;
                end
            end
        end
    end
    assign {a, b, c, d} = estadoAtual;
endmodule