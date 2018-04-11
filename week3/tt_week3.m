close; clear; clc;
%% Q1. apply IR downloaded from web
[x,fs] = audioread('bkbe2114_44100Hz.wav');
[ir,irfs] = audioread('ir1.wav');
y = conv(x,ir);

subplot(2,1,1),plot(x);
subplot(2,1,2),plot(y);

%% Q2. Create echo IR with delay taps every 0.5s

[s,f] = audioread('pluck.wav');
echoir = zeros(1,2*f);
echoir([1,f/2,f,f*3/2,2*f]) = [1, 1/2, 1/3, 1/4, 1/5];

echo = conv(echoir,s);
sound(echo)
