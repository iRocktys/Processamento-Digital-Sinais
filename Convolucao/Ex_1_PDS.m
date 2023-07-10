clear all
clc

N = 30; % período
M = 100; % numero de amostras


%% Demonstrando a periodicidade
% Calcula a quantidade de ciclos 
ciclos = ceil(M/N);

% Vetor de cores 
cores = lines(ciclos);
aux = 1;

for n = 1:M
    x = 2*cos((pi/3)*n) + sin((pi/5)*n); % x[n]
    resto = mod(n, 30); % Resto da divisão
    
    % Alteração da cor de 30 em 30 amostras
    if resto == 0
       aux = aux + 1;
    end
    % Plot das amostras
    title('Sinal original x[n]');
    stem(n, x,'filled','Color', cores(aux,:), 'LineWidth', 0.8);
    xlabel('n');
    ylabel('x[n]');
    ylim([-4.0 4.0]);
    grid on;
    hold on;
end

%% Operações e gráfico - Função x[n]
n = -20:20; % Tamanho amostragem
somatorio = 0; 

% Definindo x[n]
x = 2*cos((pi/3)*n) + sin((pi/5)*n); 

% Calculando a potencia do sinal com N = 30
for i = 1:N
    somatorio = somatorio + (2*cos((pi/3)*i)+sin((pi/5)*i))^2;
end

% Valor da potencia de x[n]
P = somatorio / 30;

% Plot da função x[n]
figure;
stem(n, x,'filled', 'Color', 'k', 'LineWidth', 0.8);
title(sprintf('Sinal original x[n]; Potência = %.2f', P));
xlabel('n');
ylabel('x[n]');
ylim([-4.0 4.0]);
legend('x[n]');
grid on;

%% Função x[2n]
n = -20:20; % Tamanho amostragem
x2 = 2*cos(2*((pi/3)*n)) + sin(2*((pi/5)*n));

% Plot da função x[2n]
figure;
stem(n, x2,'filled', 'Color','k', 'LineWidth', 0.8);
title('Sinal x[2n]');
xlabel('n');
ylabel('x[n]');
ylim([-4.0 4.0]);
legend('x[2n]');
grid on;

%% Função x[-n]
n = -20:20; % Tamanho amostragem
x3 = 2*cos((-1)*((pi/3)*n)) + sin((-1)*((pi/5)*n));

% Plot da função x[-n]
figure;
stem(n, x3,'filled', 'Color','k', 'LineWidth', 0.8);
title('Sinal x[-n]');
xlabel('n');
ylabel('x[n]');
ylim([-4.0 4.0]);
legend('x[-n]');
grid on;

%% Função x[n-2]
n = -20:20; % Tamanho amostragem
x4 = 2*cos(((pi/3)*(n-2))) + sin(((pi/5)*(n-2)));

% Plot da função x[n-2]
figure;
stem(n, x4,'filled', 'Color','k', 'LineWidth', 0.8);
title('Sinal x[n-2]');
xlabel('n');
ylabel('x[n]');
ylim([-4.0 4.0]);
legend('x[n-2]');
grid on;

%% Função 𝑦[𝑛] = 𝑥[𝑛]*𝑐𝑜𝑠(ω*𝑛)], ω = π/2
n = -20:20; % Tamanho amostragem
x5 = x.*cos((pi*n)/2);

% Plot y[𝑛] = 𝑥[𝑛]*𝑐𝑜𝑠(ω*𝑛)], ω = π/2
figure;
stem(n, x5,'filled', 'Color','k', 'LineWidth', 0.8);
title('Sinal x[n]*𝑐𝑜𝑠(ω*𝑛), ω = π/2');
xlabel('n');
ylabel('x[n]');
ylim([-4.0 4.0]);
legend('x[n]*𝑐𝑜𝑠(ω*𝑛), ω = π/2');
grid on;

%% Decomposição em parte par e ímpar
n = -20:20; % Tamanho amostragem

% plot do sinal original x[n]
figure;
subplot(3,1,1)
stem(n, x,'filled', 'Color', 'k', 'LineWidth', 0.8);
title('Sinal original x[n]');
xlabel('n');
ylabel('x[n]');
ylim([-4.0 4.0]);
legend('x[n]');
grid on;

x_par = (x + fliplr(x))/2;
x_impar = (x - fliplr(x))/2;

subplot(3,1,2)
stem(n, x_par,'filled', 'Color','r', 'LineWidth', 0.8);
title('Parte par de x[n]');
xlabel('n');
ylabel('x[n]');
ylim([-4.0 4.0]);
legend('x[n] - Par');
grid on;

subplot(3,1,3)
stem(n, x_impar,'filled', 'Color','b', 'LineWidth', 0.8);
title('Parte impar de x[n]');
xlabel('n');
ylabel('x[n]');
ylim([-4.0 4.0]);
legend('x[n] - Impar');
grid on;








