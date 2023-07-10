clear all
clc

A = 0.5;
B = 2;
n = -10:10; 

% Criando degrau
degrau = zeros(size(n)); % Inicializando o sinal com zeros
degrau(n>=0) = 1; % Atribuindo o valor 1 a partir do índice 0

% Criando impulso
impulso = zeros(size(n)); % inicializa um vetor com zeros
impulso(n == 0) = 1; % atribui o valor 1 à posição correspondente ao índice 0

%% Aplicando impulso ao sistema
% Atribuindo impulso na entrada
x = impulso;

% Sistema
y = A*x + B;

% Entrada x[n]
figure;
subplot(2,1,1); 
stem(n, x,'filled', 'Color','k', 'LineWidth', 0.8); % plotagem do impulso unitário
title('x[n] = δ[n]');
xlabel('n');
ylabel('y[n]');
ylim([0.0 3.0]);
legend('δ[n]');
grid on;

% Plot da resposta do sistema y[n]
subplot(2,1,2);
stem(n, y,'filled', 'Color','k', 'LineWidth', 0.8); 
title(sprintf('y[n] = %.2f x[n] + %d', A, B));
xlabel('n');
ylabel('y[n]');
ylim([0.0 4.0]);
legend('y[n]');
grid on;


%% Aplicando degrau ao sistema
% Atribuindo degrau na entrada
x = degrau;

% Sistema
y = A*x + B;

% Entrada x[n]
figure;
subplot(2,1,1); 
stem(n, x,'filled', 'Color','k', 'LineWidth', 0.8); % plotagem do impulso unitário
title('x[n] = u[n]');
xlabel('n');
ylabel('y[n]');
ylim([0.0 3.0]);
legend('u[n]');
grid on;

% Plot da resposta do sistema y[n]
subplot(2,1,2);
stem(n, y,'filled', 'Color','k', 'LineWidth', 0.8); 
title(sprintf('y[n] = %.2f x[n] + %d', A, B));
xlabel('n');
ylabel('y[n]');
ylim([0.0 4.0]);
legend('y[n]');
grid on;

%% Aplicando cosseno unitário f=pi/2 ao sistema
% Atribuindo cosseno na entrada
x = cos((pi/2)*n);

% Sistema
y = A*x + B;

% Entrada x[n]
figure;
subplot(2,1,1); 
stem(n, x,'filled', 'Color','k', 'LineWidth', 0.8); % plotagem do impulso unitário
title('x[n] = cos[(π/2)*n]');
xlabel('n');
ylabel('y[n]');
ylim([-3.0 3.0]);
legend('cos[(π/2)*n]');
grid on;

% Plot da resposta do sistema y[n]
subplot(2,1,2);
stem(n, y,'filled', 'Color','k', 'LineWidth', 0.8); 
title(sprintf('y[n] = %.2f x[n] + %d', A, B));
xlabel('n');
ylabel('y[n]');
ylim([0.0 4.0]);
legend('y[n]');
grid on;

%% Mostrando não linearidade
% Homogenidade
fator = 2;
x = cos((pi/2)*n); % Entrada
x2 = cos(fator*((pi/2)*n)); % Entrada com nova amplitude

% Sistema
y1 = A*x + B;
y2 = A*x2 + B; 
y3 = y1*fator;

% Plotando o resultado
figure;
subplot(2,1,1); 
stem(n, y2,'filled', 'Color','k', 'LineWidth', 0.8); 
title(sprintf('%d*x[n]', fator));
xlabel('n');
ylabel('y[n]');
ylim([0.0 4.0]);
legend('y[n]');
grid on;

subplot(2,1,2); 
stem(n, y3,'filled', 'Color','k', 'LineWidth', 0.8); 
title(sprintf('%d*y[n]', fator));
xlabel('n');
ylabel('y[n]');
ylim([0.0 6.0]);
legend(sprintf('%d*y[n]', fator));
grid on;

% Aditividade
x1 = impulso;
x2 = degrau;

% Sistema
y1 = A*(x1 + x2) + B;
y2 = A*x1 + B;
y3 = A*x2 + B;
y_resultante = y2 + y3;

% Plotando o resultado
figure;
subplot(2,1,1); 
stem(n, y1,'filled', 'Color','k', 'LineWidth', 0.8); 
title(sprintf('y[x1 + x2]'));
xlabel('n');
ylabel('y[n]');
ylim([0.0 4.0]);
legend('y[n]');
grid on;

subplot(2,1,2); 
stem(n, y_resultante,'filled', 'Color','k', 'LineWidth', 0.8); 
title(sprintf('y[x1] + y[x2]'));
xlabel('n');
ylabel('y[n]');
ylim([0.0 6.0]);
legend(sprintf('y[n]'));
grid on;


%% Ivariante no Tempo
x = cos((pi/2)*n); % Entrada
x2 = cos(((pi/2)*(n-fator))); % Entrada deslocada

% Sistema
y1 = A*x + B;
y2 = A*x2 + B; 
y3 = y1-fator;

figure;
subplot(3,1,1); 
stem(n, x,'filled', 'Color','k', 'LineWidth', 0.8); % plotagem do impulso unitário
title('x[n] = cos[(π/2)*n]');
xlabel('n');
ylabel('y[n]');
ylim([-3.0 3.0]);
legend('cos[(π/2)*n]');
grid on;

subplot(3,1,2); 
stem(n, y2,'filled', 'Color','k', 'LineWidth', 0.8); 
title(sprintf('x[n-%d]', fator));
xlabel('n');
ylabel('y[n]');
ylim([0.0 4.0]);
legend('y[n]');
grid on;

subplot(3,1,3); 
stem(n, y3,'filled', 'Color','k', 'LineWidth', 0.8); 
title(sprintf('y[n-%d]', fator));
xlabel('n');
ylabel('y[n]');
ylim([0.0 6.0]);
legend(sprintf('y[n-%d]', fator));
grid on;



