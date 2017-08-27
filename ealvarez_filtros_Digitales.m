% Laboratorio 4 - Filtros Digitales
% Estefany Alvarez Meneses.


clc,
clear all,
close all,
 
ingrese_nombre_audio = input('Ingrese el nombre del archivo de audio: ');
[audio_name, ruta] = uigetfile('.wav', ingrese_nombre_audio); % Carga el archivo de audio con nombre y ruta especifica
sonido_1 = [ruta, audio_name];  %Concatenar ruta con nombre de archivo para detectarlo bien para audioread
[audio_1, Fs_1] = audioread(sonido_1); % El audio de Matlab es la variable audio_1 con frec de muestreo Fs_1

F = [31.25, 62.5, 125, 250, 500, 1000, 2000, 4000, 8000, 16000]; % frecuencias de corte en Hz

N = [10, 10, 10, 10, 10, 10, 10, 10, 10, 10]; %Diez veces el orden (Cualquier orden, ej 10)

%Ingreso de Ganancias
for i=1:10
  mensaje= ['Ingrese la ganancia en dB a  ', num2str(F(i)), ' Hz ' ];
   G(i) = input(mensaje); %Ingresa ganancias en este vector G
end

%%%%  II Segunda parte designParam  %%%%%%%%%%%%%%%%%%%%%

bandwidth = [31.25, 31.25, 62.5, 125, 250, 500, 1000, 2000, 4000, 8000]; %Al principio dos veces el mismo valor 31.25 de ancho de banda pues la primera es de 0 a 31.25 y debe tener BW 31.25, luego 62.5 - 31.25 = 31.25 es el BW en la segunda banda

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% cálculo de la frecuencia central con la formula de la media geométrica f0_geo = sqrt(f1*f2)
% http://www.sengpielaudio.com/calculator-geommean.htm
 FC = [0, 44.194, 88.38, 176.77, 353.55, 707.10, 1414.21, 2828.42, 5656.85, 11313.708]; % se debe normalizar mas abajo, para quedar entre 0 a 1

%%%%%%%%%%%%  Normalizar la FC  y el bandwidth tambien %%%%%%%%%%%%%%%%%%%%%%%%%%%
FC_norma = FC/(Fs_1/2);  %Normalizar a FC

bandwidth_norma = bandwidth/(Fs_1/2); %Normalizar ancho de banda
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[B, A] = designParamEQ(N, G, FC_norma, bandwidth_norma); % Genera los coeficientes del filtro utilizando los parámetros especificados.
SOS = [B', [ones(sum(N)/2, 1), A']]; %Implementa el equalizador como Filtros en segundo orden en cascada

fvtool(SOS, 'Fs', Fs_1) % Grafiqua la respuesta en frecuencia del EQ, en decibelios.
title('Respuesta en frecuencia')
%%%%% filtrar el audio original con los coeficientes B y A, y Escuchar el audio final %%%%%

Y = sosfilt(SOS, audio_1); %Filtra segun el SOS que teniamos ya antes 
player = audioplayer(Y, Fs_1); %Crea un objeto audioplayer para la señal Y, usando la frecuencia de muestreo Fs_1
play(player); 

 