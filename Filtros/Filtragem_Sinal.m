clc 
clear all

%% Importando audio
load audio_gravado.mat

% Tempo e numero de amostra do audio original
N_audio = length(Y);
t_audio = 0:1/FS:(N_audio-1)/FS;

%% Reproducao audio
sound(y_fir,FS);

%% Plot do audio original no tempo
figure
hold all
plot(t_audio,Y,'Color',[0.8 0.8 0.8]);
plot(t_audio,y_iir,'r');
xlabel('Tempo (s)');
ylabel('Amplitude');
title('Audio filtro IIR - Butterworth');
legend({'Sinal com ruído', 'Sinal sem ruído'});
grid on

figure
hold all
plot(t_audio,Y,'Color',[0.8 0.8 0.8]);
plot(t_audio,y_fir,'r');
xlabel('Tempo (s)');
ylabel('Amplitude');
title('Audio filtro FIR');
legend({'Sinal com ruído', 'Sinal sem ruído'});
grid on

%% Filtro iir
% Rp = 1;
% Rs = 40;
% Wp = 1500/fN;
% Ws = 1680/fN;
% [n,Wn] = buttord(Wp,Ws,Rp,Rs);

% Frequencia de Nyquist
fN = FS/2; 
% Frequencia de corte
fstop = [1542 1650]; 
% Ordem do filtro
order = 2;

% Filtro butterworth
[b,a] = butter(order,fstop/fN,'stop');

% Aplicando o filtro ao audio
y_iir = filtfilt(b, a, Y); 

% Plot do espectro do sinal filtrado
[f,H_filtrado_irr] = obterEspectro(y_iir,t_audio);
[f, H] = obterEspectro(Y, t_audio);

figure;
hold all
plot(f, H, 'Color',[0.8 0.8 0.8]);
plot(f,H_filtrado_irr,'r');
xlabel('Frequência (Hz)');
ylabel('|H(\Omega)|');
title('Espectro filtro IIR - Butterworth');
legend({'Espectro com ruído', 'Espectro sem ruído'});
grid on

%% Filtro FIR
% Frequencia de Nyquist
fN = FS/2; 
% Frequencia de corte
fstop = [1500 1680];
a = [1 0];
dev = [0.001 0.1];

% Encontrar a ordem
[n,Wn,beta,ftype] = kaiserord(fstop,a,dev,FS);

w = window(@hamming, n+1);
b = fir1(n,fstop/fN,'stop',w);
y_fir = conv(Y,b,'same');

% Plot do espectro do sinal filtrado
[f,H_filtrado_fir] = obterEspectro(y_fir,t_audio);
[f, H] = obterEspectro(Y, t_audio);

figure;
hold all
plot(f, H, 'Color',[0.8 0.8 0.8]);
plot(f,H_filtrado_fir,'r');
xlabel('Frequência (Hz)');
ylabel('|H(\Omega)|');
title('Espectro filtro FIR');
legend({'Espectro com ruído', 'Espectro sem ruído'});
grid on

%% Função do Espectro
function [f, H] = obterEspectro(x,t)
    F = fft(x);
    magH = abs(F);
    magH = magH(1:end/2+1);
    magH(2:end) = magH(2:end)*2;

    H = magH;
    Ts = t(2) - t(1);
    fs = 1/Ts;

    f = (0:length(magH)-1)*(fs/2)/length(magH);
end




