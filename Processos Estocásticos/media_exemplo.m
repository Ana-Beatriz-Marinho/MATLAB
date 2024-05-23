clear all;
close all;
clc

% Exemplo de matriz
matriz_exemplo = [1, 2, 3; 4, 5, 6; 7, 8, 9];

% Calcular a m�dia ao longo das colunas (dimens�o 2)
media_colunas = mean(matriz_exemplo, 1);

% Calcular a m�dia ao longo das linhas (dimens�o 1)
media_linhas = mean(matriz_exemplo, 2);

disp('Matriz Original:');
disp(matriz_exemplo);

disp('M�dia ao Longo das Colunas:');
disp(media_colunas);

disp('M�dia ao Longo das Linhas:');
disp(media_linhas);
