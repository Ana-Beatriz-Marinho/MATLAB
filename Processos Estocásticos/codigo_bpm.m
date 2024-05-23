clear all;
close all;
clc

% Par�metros
fs = 1000;  % Taxa de amostragem em Hz
limiar_pico = 0.5;  % Ajuste conforme necess�rio
distancia_minima = 0.6 * fs;  % Ajuste conforme necess�rio para evitar detec��o de picos pr�ximos

%Plote do primeiro sinal ECG
%load('MIT-BIH Arrhythmia Database/100m.mat');
load('MIT-BIH Arrhythmia Database/101m.mat');
ecg_signal =(val(1,:));
%figure;
%plot(sinal_original);

% Detectar picos R
[~, picos] = findpeaks(ecg_signal, 'MinPeakHeight', limiar_pico, 'MinPeakDistance', distancia_minima);

% Calcular intervalos RR (intervalos entre picos consecutivos)
intervalos_rr = diff(picos) / fs;

% Calcular frequ�ncia card�aca em bpm
frequencia_cardiaca = 60 / mean(intervalos_rr);

% Mostrar resultado
disp(['Frequ�ncia Card�aca: ', num2str(frequencia_cardiaca), ' bpm']);

% Plotar sinal ECG com picos detectados
figure;
plot((1:length(ecg_signal))/fs, ecg_signal);
hold on;
plot(picos/fs, ecg_signal(picos), 'ro', 'MarkerSize', 10);
title('Sinal ECG com Detec��o de Picos R');
xlabel('Tempo (s)');
ylabel('Amplitude');
legend('Sinal ECG', 'Picos R');
