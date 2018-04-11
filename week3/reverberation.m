close;clear;clc;

[x,fs] = audioread('bkbe2114_44100Hz.wav');
[ir,irfs] = audioread('ir1.wav');

y = conv(x,ir);

tx = (1:length(x))/fs;
ty = (1:length(y))/fs;
subplot(211),plot(tx,x);
subplot(212),plot(ty,y);
sound(x,fs)
pause
sound(y,fs)