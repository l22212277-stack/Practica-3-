clc
clear all
close all

% Leer el archivo Excel (ajusta el nombre)
T = readtable('ecg.xlsx');  

% Extraer la columna "valor"
x = T.valor;

% Definir frecuencia de muestreo
fs = 100;   % Hz

% Crear vector de tiempo (en segundos)
tx = (0:length(x)-1)/fs;


t_inicio = 3;
t_fin    = 5;
idx = (tx >= t_inicio) & (tx <= t_fin);
x = x(idx);
tx = tx(idx);
xdesp = (x+abs(min(x))) ;
xnorm=   ((xdesp/abs(max(xdesp)))*65535);
N=magnitud(max(xnorm));
figure;

for i= 1:16
    subplot(4,4,i);
    txcuantificada = cuantificador2(xnorm,i,16);
    plot(tx,txcuantificada);
    grid on
    xlabel('$Tiempo$','FontSize',10,'FontName','Times New Roman','Interpreter','latex');
    ylabel('$Amplitud$','FontSize',10,'FontName','Times New Roman','Interpreter','latex');
    title(strcat(num2str(i),'$-bits$'),'FontSize',10,'FontName','Times New Roman','Interpreter','latex');
end
