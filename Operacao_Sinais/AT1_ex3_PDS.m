clear all
clc


%%
% Definindo as frequências das senoidais
f1 = 1/8;
f2 = -7/8;

% Definindo o tempo de amostragem
Ts = 1;

% Gerando o vetor de tempo contínuo
t_cont = 0:0.0001:10;

% Gerando as funções senoidais contínuas
x1_cont = sin(2*pi*f1*t_cont);
x2_cont = sin(2*pi*f2*t_cont);

% Plotando as funções senoidais contínuas
figure;
plot(t_cont, x1_cont, 'r');
hold all
plot(t_cont, x2_cont, 'b');
title('Funções Senoidais Contínuas');
xlabel('Tempo (s)');
ylabel('Amplitude');

% Realizando a amostragem das funções senoidais
t_disc = 0:Ts:10;
x1_disc = sin(2*pi*f1*t_disc);
x2_disc = sin(2*pi*f2*t_disc);

% Plotando as amostras das funções senoidais
stem(t_disc, x1_disc, 'k','LineWidth',1.1);
stem(t_disc, x2_disc, 'r');
title('Amostras das Funções Senoidais');
xlabel('Tempo (s)');
ylabel('Amplitude');
legend('x1(t) = sin(2\pif1t)', 'x2(t) = sin(2\pif2t)','x1[n]', 'x2[n]');
ylim([-1.5 1.5]);
grid on;
