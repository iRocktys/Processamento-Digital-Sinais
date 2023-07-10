clear all
clc

%%
n = -15:15; % Tamanho amostragem

% sinal
x = 0.9.^n .* exp(j*(pi/10)*n);

figure;
subplot(3,1,1); 
stem(n, x,'filled', 'Color','k', 'LineWidth', 0.8); 
title(sprintf('x[n] = 0.9^nexp(j*(π/10)*n)'));
xlabel('n');
ylabel('y[n]');
%ylim([-5.0 5.0]);
legend('0.9^nexp(j*(π/10)*n)');
grid on;

subplot(3,1,2); 
stem(n, real(x),'filled', 'Color','b', 'LineWidth', 0.8); 
title(sprintf('Parte Real'));
xlabel('n');
ylabel('y[n]');
%ylim([-5.0 5.0]);
grid on;

subplot(3,1,3); 
stem(n, imag(x),'filled', 'Color','r', 'LineWidth', 0.8); 
title(sprintf('Parte Imaginária'));
xlabel('n');
ylabel('y[n]');
%ylim([-5.0 5.0]);
grid on;


figure;
subplot(3,1,1); 
stem(n, x,'filled', 'Color','k', 'LineWidth', 0.8); 
title(sprintf('x[n] = 0.9^nexp(j*(π/10)*n)'));
xlabel('n');
ylabel('y[n]');
%ylim([-5.0 5.0]);
legend('0.9^nexp(j*(π/10)*n)');
grid on;

subplot(3,1,2); 
stem(n,abs(x),'filled', 'Color','b', 'LineWidth', 0.8); 
title(sprintf('Módulo do Sinal'));
xlabel('n');
ylabel('y[n]');
%ylim([-5.0 5.0]);
grid on;

subplot(3,1,3); 
stem(n, angle(x),'filled', 'Color','r', 'LineWidth', 0.8); 
title(sprintf('Fase do Sinal'));
xlabel('n');
ylabel('y[n]');
%ylim([-5.0 5.0]);
grid on;


