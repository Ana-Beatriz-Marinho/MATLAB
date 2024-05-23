clear all;
close all;
clc

% Carregar sinal de ECG a partir do arquivo .mat
load('MIT-BIH Arrhythmia Database/101m.mat');
sinal_original =(val(1,:));

% Frequ�ncia de amostragem
fs = 1000;  % Supondo uma frequ�ncia de amostragem de 1000 Hz

% Calcular PSD usando FFT
N = length(sinal_original);
frequencias = (0:N-1) * fs / N;

% Aplicar FFT e calcular PSD
psd = abs(fft(sinal_original)).^2 / N;

% Plotar o espectro de frequ�ncia
figure;
plot(frequencias, 10*log10(psd));
title('Espectro de Frequ�ncia do Sinal de ECG');
xlabel('Frequ�ncia (Hz)');
ylabel('Pot�ncia (dB)');
grid on;

% Encontrar a frequ�ncia que corresponde ao pico m�ximo no espectro
[~, idx_max] = max(psd);
best_frequency = frequencias(idx_max);

fprintf('A frequ�ncia dominante no sinal � aproximadamente %.2f Hz.\n', best_frequency);
