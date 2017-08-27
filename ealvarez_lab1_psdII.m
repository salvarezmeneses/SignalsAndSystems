% Lab 1 - PSD II
% Estefany Alvarez Meneses 

% Diseñe una rutina en Matlab que, para una señal en formato *.wav que ingrese el usuario:

%  a. (50 puntos) En la ventana de comando se indique a cuál de las tres palabras
%anteriores corresponde. A continuación, se ilustra cómo debe verse la ventana
%de comando cuando se ejecute el programa:
%% b. (15 puntos) Se grafique la señal de audio que ingresa el usuario
%% c. (15 puntos) Se grafique la señal de audio existente a la que más se parece
%% d. (20 puntos) Se grafique la correlación cruzada entre ambas señales %%

clc       %borra toda la pantalla pero deja internamente el valor de las variables.
clear all % Elimine todas las variables del Workspace
close all %cierra todas las figuras

%%%%%%%%%%%%%% Adquirir los 9 audios de la carpeta %%%%%%%%%%%%
% audioread lee la señal y frec de muestreo contenida en cada string.wav
[audio_1,Fs1] = audioread('micro1.wav');  
[audio_2,Fs2]  = audioread('micro2.wav');  
[audio_3,Fs3]  = audioread('micro3.wav');  
[audio_4,Fs4]  = audioread('opposit1.wav');
[audio_5,Fs5]  = audioread('opposit2.wav');
[audio_6,Fs6]  = audioread('opposit3.wav');
[audio_7,Fs7]  = audioread('temp1.wav');
[audio_8,Fs8]  = audioread('temp2.wav');
[audio_9,Fs9]  = audioread('temp3.wav');
%%%%%%%%%%%%%%%%%% Final adquisición audios %%%%%%%

%%Adquirir el audio que elija el usuario, para comparar con los otros %%%%%%%%

nuevoaudio = input('Digite el audio que desea comparar: ' ) %Se digita entre '' nombre 
[audio_new,Fsnew] = audioread(nuevoaudio); %Se extrae el audio desde nuevoaudio y se almacena los datos en audio_new y Fsnew

for i=1:9 % ciclo para recorrer los 9 audios

   if i==1
      [acor,lag] = xcorr(audio_new, audio_1);    %calcula corr y la guarda acor, lag(retardo)

      [rxy,I] = max(abs(acor));                  %rxy guarda max muestra de corr e índice(para ver la similitud audios)
                Rxy(i)=rxy;                      %almacena el máximo valor de correlación en este indice i.
                lagDiff(i) = lag(I);             %lagDiff,es el lag de diferencia para ver el retardo entre audios en este ciclo
                Acor_aud(1:length(acor),i)=acor; %Almacenamos los acor en el vector Acor segun el indice i                                     
                Lag_aud(1:length(lag),i)=lag;    %Almacenamos los lag según el indice i 

elseif i==2
      [acor,lag] = xcorr(audio_new, audio_2);    %calcula corr y la guarda acor, lag(retardo)
            
      [rxy,I] = max(abs(acor));                  %rxy guarda la max muestra de corr,e indice (para ver la similitud audios) 
                Rxy(i)=rxy;                      %almacena Maximo de correlacion en este indice i.
                lagDiff(i) = lag(I);             %lagDiff,es el lag de diferencia para ver el retardo entre audios en este ciclo
                Acor_aud(1:length(acor),i)=acor; %Almacenamos los acor en el vector Acor segun el indice i 
                Lag_aud(1:length(lag),i)=lag;    %Almacenamos los lag segun el indice i 

elseif i==3
      [acor,lag] = xcorr(audio_new, audio_3);    %calcula corr y la guarda acor, lag(retardo)

      [rxy,I] = max(abs(acor));                  %rxy guarda la max muestra de corr,e indice (para ver la similitud audios)
                Rxy(i)=rxy;                      %Almacena Maximo de correlacion en este indice i.
                lagDiff(i) = lag(I);             %lagDiff,es el lag de diferencia para ver el retardo entre audios en este ciclo
                Acor_aud(1:length(acor),i)=acor; %Almacenamos los acor en el vector Acor segun el indice i
                Lag_aud(1:length(lag),i)=lag;    %Almacenamos los lag segun el indice i 

elseif i==4
      [acor,lag] = xcorr(audio_new, audio_4);    %calcula corr y la guarda acor, lag(retardo)
                                                   
      [rxy,I] = max(abs(acor));                  %rxy guarda la max muestra de corr,e indice (para ver la similitud audios)    
                Rxy(i)=rxy;                      %Almacena Maximo de correlacion en este indice i.
                lagDiff(i) = lag(I);             %lagDiff,es el lag de diferencia para ver el retardo entre audios en este ciclo
                Acor_aud(1:length(acor),i)=acor; %Almacenamos los acor en el vector Acor segun el indice i
                Lag_aud(1:length(lag),i)=lag;    %Almacenamos los lag segun el indice i 

elseif i==5
      [acor,lag] = xcorr(audio_new, audio_5);    %calcula corr y la guarda acor, lag(retardo)

      [rxy,I] = max(abs(acor));                  %rxy guarda la max muestra de corr,e indice (para ver la similitud audios)
                Rxy(i)=rxy;                      %Almacena Maximo de correlacion en este indice i.
                lagDiff(i) = lag(I);             %lagDiff,es el lag de diferencia para ver el retardo entre audios en este ciclo
                Acor_aud(1:length(acor),i)=acor; %Almacenamos los acor en el vector Acor segun el indice i
                Lag_aud(1:length(lag),i)=lag;    %Almacenamos los lag segun el indice i

elseif i==6
      [acor,lag] = xcorr(audio_new, audio_6);    %calcula corr y la guarda acor, lag(retardo) 

      [rxy,I] = max(abs(acor));                  %rxy guarda la max muestra de corr,e indice (para ver la similitud audios)
                Rxy(i)=rxy;                      %Almacena Maximo de correlacion en este indice i.
                lagDiff(i) = lag(I);             %lagDiff,es el lag de diferencia para ver el retardo entre audios en este ciclo
                Acor_aud(1:length(acor),i)=acor; %Almacenamos los acor en el vector Acor segun el indice i
                Lag_aud(1:length(lag),i)=lag;    %Almacenamos los lag segun el indice i

elseif i==7
      [acor,lag] = xcorr(audio_new, audio_7);    %calcula corr y la guarda acor, lag(retardo)
      
      [rxy,I] = max(abs(acor));                  %rxy guarda la max muestra de corr,e indice (para ver la similitud audios)
                Rxy(i)=rxy;                      %Almacena Maximo de correlacion en este indice i.
                lagDiff(i) = lag(I);             %lagDiff,es el lag de diferencia para ver el retardo entre audios en este ciclo
                Acor_aud(1:length(acor),i)=acor; %Almacenamos los acor en el vector Acor segun el indice i
                Lag_aud(1:length(lag),i)=lag;    %Almacenamos los lag segun el indice i 

elseif i==8
      [acor,lag] = xcorr(audio_new, audio_8);    %calcula corr y la guarda acor, lag(retardo)

      [rxy,I] = max(abs(acor));                  %rxy guarda la max muestra de corr,e indice (para ver la similitud audios)
                Rxy(i)=rxy;                      %Almacena Maximo de correlacion en este indice i.
                lagDiff(i) = lag(I);             %lagDiff,es el lag de diferencia para ver el retardo entre audios en este ciclo
                Acor_aud(1:length(acor),i)=acor; %Almacenamos los acor en el vector Acor segun el indice i
                Lag_aud(1:length(lag),i)=lag;    %Almacenamos los lag segun el indice i 

elseif i==9
      [acor,lag] = xcorr(audio_new, audio_9);    %calcula corr y la guarda acor, lag(retardo)

      [rxy,I] = max(abs(acor));                  %rxy guarda la max muestra de corr,e indice (para ver la similitud audios)
                Rxy(i)=rxy;                      %Almacena Maximo de correlacion en este indice i. 
                lagDiff(i) = lag(I);             %lagDiff,es el lag de diferencia para ver el retardo entre audios en este ciclo
                Acor_aud(1:length(acor),i)=acor; %Almacenamos los acor en el vector Acor segun el indice i
                Lag_aud(1:length(lag),i)=lag;    %Almacenamos los lag segun el indice i 
end

end

%a. (50 puntos) En la ventana de comando se indique a cuál de las tres palabras
%anteriores corresponde. A continuación, se ilustra cómo debe verse la ventana
%de comando cuando se ejecute el programa:

[~,Indi] = max(abs(Rxy));  %Halla el indice al cual se obtuvo la maxima correlacion de entre todos los 9 audios
     
if (Indi == 1) || (Indi == 2) || (Indi == 3)
    disp('El audio contiene la palabra: microprogram')

elseif (Indi == 4) || (Indi == 5) || (Indi == 6)
     disp('El audio contiene la palabra: oppositipinnate')

elseif (Indi == 7) || (Indi == 8) || (Indi == 9)
     disp('El audio contiene la palabra: temperature')
end

%%%%%%% b. (15 puntos) Se grafique la señal de audio que ingresa el usuario %%%%

t = (0:length(audio_new)-1)/Fsnew;
figure(1), plot(t,audio_new)
title('Señal de audio que ingresa el usuario')   
xlabel('Time (s)')
ylabel('x(t)')  

%%%%%%%% c. (15 puntos) Se grafique la señal de audio existente a la que más se parece
         if Indi == 1 
             t = (0:length(audio_1)-1)/Fs1; % tiempo Continuo 
            figure(2), plot(t,audio_1)        
            title('señal de audio existente a la que más se parece')    
            xlabel('Time (s)')
            ylabel('y(t)')  

          elseif Indi == 2
                t = (0:length(audio_2)-1)/Fs2;
            figure(2), plot(t,audio_2)       
            title('señal de audio existente a la que más se parece')   
            xlabel('Time (s)')
            ylabel('y(t)')   
 
          elseif Indi == 3

              t = (0:length(audio_3)-1)/Fs3;
            figure(2), plot(t,audio_3)
            title('señal de audio existente a la que más se parece')  
            xlabel('Time (s)')
            ylabel('y(t)')  

          elseif Indi == 4
               t = (0:length(audio_4)-1)/Fs4;
            figure(2), plot(t,audio_4)
            title('señal de audio existente a la que más se parece')   
            xlabel('Time (s)')
            ylabel('y(t)')  
          
           elseif Indi == 5
               t = (0:length(audio_5)-1)/Fs5;
            figure(2), plot(t,audio_5)
            title('señal de audio existente a la que más se parece')   
            xlabel('Time (s)')
            ylabel('y(t)')  

          elseif Indi == 6
                t = (0:length(audio_6)-1)/Fs6;
            figure(2), plot(t,audio_6)
            title('señal de audio existente a la que más se parece')   
            xlabel('Time (s)')
            ylabel('y(t)')  %

          elseif Indi == 7

             t = (0:length(audio_7)-1)/Fs7;
            figure(2), plot(t,audio_7)
            title('señal de audio existente a la que más se parece')   
            xlabel('Time (s)')
            ylabel('y(t)')  
          
          elseif Indi == 8
              t = (0:length(audio_8)-1)/Fs8;
            figure(2), plot(t,audio_8)
            title('señal de audio existente a la que más se parece')   
            xlabel('Time (s)')
            ylabel('y(t)')  

          elseif Indi == 9
             t = (0:length(audio_9)-1)/Fs9;
            figure(2), plot(t,audio_9)
            title('señal de audio existente a la que más se parece')   
            xlabel('Time (s)')
            ylabel('y(t)')  %
end
               
%%%%% d. (20 puntos) Se grafique la correlación cruzada entre ambas señales
figure(3), plot(Lag_aud(:, Indi), Acor_aud(:, Indi))

     title('Correlacion cruzada entre ambas senales')   
            xlabel('l')
            ylabel('rxy(l)')  

 


