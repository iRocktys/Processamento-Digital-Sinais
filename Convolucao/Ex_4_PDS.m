clear all
clc

%% Convolução de Sinais
n = -15:15;
% Criando x[n]
x = zeros(size(n));

fator = 1;
for i = -15:15
    if i >= 0 
        x(n == i) = fator;
        fator = fator/2;
    end
end

% Criando h[n]
h = zeros(size(n));
h(n == -1) = 0.5;
h(n == 0) = 1;
h(n == 1) = 0.5;

% Fazendo a convolucao de x[n]*h[n]
y = conv(x, h);

% Plotando os resultados
figure;
% Plot [n]
subplot(3,1,1);
stem(n, x, 'k', 'filled');
ylim([-0.5 1.5]);
xlabel('n');
ylabel('x[n]');
title('Sinal x[n]');
grid on;

% Plot h[n]
subplot(3,1,2);
stem(n, h, 'r', 'filled');
ylim([-0.5 1.5]);
xlabel('n');
ylabel('h[n]');
title('Sinal h[n]');
grid on;

% Plot convolucao
n = -30:30;
subplot(3,1,3);
stem(n, y, 'b', 'filled');
ylim([-0.5 1.5]);
xlabel('n');
ylabel('x[n]*h[n]');
title('Sinal x[n]*h[n]');
grid on;