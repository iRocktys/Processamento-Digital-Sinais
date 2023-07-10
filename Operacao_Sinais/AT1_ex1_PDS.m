clear all
clc

%% Funcao continua

w = 2*pi; %frequencia angular
T = 2*pi/w; %Periodo
N = 3; % Numero de periodos
passo = 0.00001; 
t_cont = 0:passo:N*T; % tempo de amostragem
x_cont = sin(2*pi*t_cont);

% Plotando o sinal contínuo 
figure;
plot(t_cont,x_cont,'r');
xlabel('Tempo (s)');
ylabel('Amplitude');
title('Sinal senoidal contínuo');
legend('Sinal contínuo');
ylim([-1.5 1.5]);
grid on

% Periodo de amostragem
Ts = [0.1, 0.2, 0.3, 0.4, 0.5];

for i = 1:length(Ts)
    figure;

    % Funcao continua
    plot(t_cont,x_cont,'r');

    n = 0:ceil(N*T/Ts(i))-1;
    x_disc = sin(2*pi*n*Ts(i));
    
    hold all
    
    % Plota grafico discreto
    stem(n*Ts(i), x_disc,'black');
    
    % Plota aliassing
    w_alias = 2*pi*(1/Ts(i)); 
    x_alias = sin(((2*pi)+w_alias)*t_cont);
    plot(t_cont, x_alias, 'b--');
   
    % Legendas
    title(sprintf('Sinal senoidal amostrado (Ts = %d ms)', Ts(i)*1000));
    xlabel('Tempo (s)');
    ylabel('Amplitude');
    legend('Sinal contínuo','Sinal discreto', 'Aliasing');
    ylim([-1.5 1.5]);
    grid on;
end




