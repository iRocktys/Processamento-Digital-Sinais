clc 
clear all

%% Conectando dispositivo móvel
m = mobiledev;

%% Gravando áudio
m.Logging = 1; % Inicia gravação
pause(5); % Tempo de gravação
audio = readAudio(m,'OutputFormat','timetable'); 
m.Logging = 0; % Termina gravação

% Pegar a frequência do áudio após gravação
audio_data = audio.Right;
fs_audio = audio.Properties.SampleRate;

%% Importando áudio gravado
% Importa áudio e frequência
[audio_data, fs_audio] = audioread('C:\Users\leandro\MATLAB Drive\Processamento_Digital\Aula_filtro\MI.wav');
% Quantidade de amostras do áudio
N_audio = length(audio_data);
% Tempo do áudio
t_audio = 0:1/fs_audio:(N_audio-1)/fs_audio;

%% Visualizar o áudio
figure
plot(t_audio,audio_data,'k');
xlabel('Tempo (s)');
ylabel('Amplitude');
title('Áudio Original');
grid on

%% Visualizar o espectro
% Função para visualizar o espectro
[f,H] = obterEspectro(audio_data,t_audio);

figure
plot(f,H,'k');
xlabel('Frequência (Hz)');
ylabel('|H(\Omega)|');
grid on

%% Análise da frequência usando Transformada de Fourier
L = length(audio_data);
Y = fft(audio_data);
P2 = abs(Y / L);
P1 = P2(1:L / 2 + 1);
P1(2:end - 1) = 2 * P1(2:end - 1);
f = fs_audio * (0:(L / 2)) / L;

% Encontra a frequência dominante
[valor_pico, indice_pico] = max(P1);
frequencia_dominante = f(indice_pico);


%% Encontrando acorde
tolerancia = 2.5; % Dispersão em relação a multiplicacao das oitavas
conta_oitava = 1; % Contar qual oitava está a nota e controlar o maximo de oitvas
controlador = true; % Utilizado para encerrar laço caso encontrar a nota

% Vetor com as 1 oitavas
acorde = [32,34,36,38,41,43,46,49,52,55,58,61];
fix(frequencia_dominante)
while conta_oitava < 15 && controlador
   
    if ((fix(frequencia_dominante) >= acorde(1)-tolerancia) && (fix(frequencia_dominante) <= acorde(1)+tolerancia))
        fprintf('NOTA:  C | %dª Oitava\n', conta_oitava);
        controlador = false;
    end 

    if ((fix(frequencia_dominante) > acorde(2)-tolerancia) && (fix(frequencia_dominante) < acorde(2)+tolerancia))
        fprintf('NOTA:  C# | %dª Oitava\n', conta_oitava);
        controlador = false;
    end 

    if fix(frequencia_dominante) >= acorde(3)-tolerancia && fix(frequencia_dominante) <= acorde(3)+tolerancia
        fprintf('NOTA:  D | %dª Oitava\n', conta_oitava);
        controlador = false;
    end 
    
    if fix(frequencia_dominante) > acorde(4)-tolerancia && fix(frequencia_dominante) < acorde(4)+tolerancia
        fprintf('NOTA:  D# | %dª Oitava\n', conta_oitava);
        controlador = false;
    end 

    if fix(frequencia_dominante) > acorde(5)-tolerancia && fix(frequencia_dominante) < acorde(5)+tolerancia
        fprintf('NOTA:  E | %dª Oitava\n', conta_oitava);
        controlador = false;
    end 

    if fix(frequencia_dominante) >= acorde(6)-tolerancia && fix(frequencia_dominante) <= acorde(6)+tolerancia
        fprintf('NOTA:  F | %dª Oitava\n', conta_oitava);
        controlador = false;
    end 
     if fix(frequencia_dominante) > acorde(7)-tolerancia && fix(frequencia_dominante) < acorde(7)+tolerancia
        fprintf('NOTA:  F# | %dª Oitava\n', conta_oitava);
        controlador = false;
    end 

    if fix(frequencia_dominante) >= acorde(8)-tolerancia && fix(frequencia_dominante) <= acorde(8)+tolerancia
        fprintf('NOTA:  G | %dª Oitava\n', conta_oitava);
        controlador = false;
    end 

    if fix(frequencia_dominante) > acorde(9)-tolerancia && fix(frequencia_dominante) < acorde(9)+tolerancia
        fprintf('NOTA:  G# | %dª Oitava\n', conta_oitava);
        controlador = false;
    end 
     if fix(frequencia_dominante) >= acorde(10)-tolerancia && fix(frequencia_dominante) <= acorde(10)+tolerancia
        fprintf('NOTA:  A | %dª Oitava\n', conta_oitava);
        controlador = false;
    end 

    if fix(frequencia_dominante) > acorde(11)-tolerancia && fix(frequencia_dominante) < acorde(11)+tolerancia
        fprintf('NOTA:  A# | %dª Oitava\n', conta_oitava);
        controlador = false;
    end 

    if (fix(frequencia_dominante) > acorde(12)-tolerancia) && (fix(frequencia_dominante) < acorde(12)+tolerancia)
        fprintf('NOTA:  B | %dª Oitava\n', conta_oitava);
        controlador = false;
    end 
    
    % Para contar e efetuar a multiplicação das oitavas
    acorde = acorde*2;
    conta_oitava = conta_oitava + 1; 
end

% Exibir que não foi encontrado a nota
if conta_oitava == 15 && controlador == true
    disp('Nota não encontrada');
end

%% Reprouzir audio original
sound(audio_data, fs_audio);

%% Função do Espectro
function [f, H] = obterEspectro(x,t)

    F = fft(x);
    N = length(x);

    magH = abs(F);
    magH = magH(1:end/2+1);
    magH(2:end) = magH(2:end)*2;
    H = magH;
    
    Ts = t(2) - t(1);
    fs = 1/Ts;

    f = (0:length(magH)-1)*(fs/2)/length(magH);
end




