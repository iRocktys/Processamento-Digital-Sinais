clear all
clc


%%
% Definindo a frequência da onda senoidal
w = 2*pi*60; %frequencia angular
T = 2*pi/w; %Periodo
N = 10; % Numero de periodos
passo = 0.00001; 
t_cont = 0:passo:N*T; % tempo de amostragem
x_cont = 127*sqrt(3)*sin(2*pi*60*t_cont);

% Esboçando a função contínua
figure;
plot(t_cont,x_cont,'r');
xlabel('Tempo (s)');
ylabel('Amplitude');
title('Sinal senoidal contínuo');
%ylim([-500, 500]);
grid on

% Frequencia de amostragem
fs = [20, 50, 100, 200, 500, 1000];

for i = 1:length(fs)
    figure;
    % Periodo de amostragem
    Ts = 1/fs(i);
    % Funcao continua
    plot(t_cont,x_cont,'r');

    n = 0:ceil(N*T/Ts)-1;
    x_disc = 127*sqrt(3)*sin(2*60*pi*n*Ts);
    hold all
    
    % Plota grafico discreto
    stem(n*Ts, x_disc,'black');

    % Plota aliassing
    w_alias = 2*pi*(1/Ts); 
    x_alias = 127*sqrt(3)*sin(((2*pi*60)+w_alias)*t_cont);
    plot(t_cont, x_alias, 'b--');
    
    % Legendas
    title(['Sinal senoidal amostrado (fs = ' num2str(1/Ts) 'Hz)']);
    xlabel('Tempo (s)');
    ylabel('Amplitude');
    legend('Sinal contínuo','Sinal discreto', 'Aliasing');
    %ylim([-500, 500]);
    grid on
end


