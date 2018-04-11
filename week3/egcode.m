close;clear;clc;
% ir = zeros(1, 50000); 
% ir([1, 1000, 5000, 10000, 15000]) = [1, 0.8, 0.7, 0.6, 0.5]; % create an impulse response



[sig,fs] = audioread('pluck.wav'); %Read Signal, save sample rate to fs

ir = zeros(1, fs);
ir(round(fs/2)) = 1;

y = conv(sig, ir);  % convolve the two signals 

ts=[1:length(sig)]/fs;
ty=[1:length(y)]/fs;
plot([1:length(ir)]/fs,ir);
% subplot(211), plot(ts,sig);    % signal length divided by fs -> time
% subplot(212), plot(ty,y); 		
% % plot both signals on same figure.
% audiowrite('pluck_echo.wav',y,fs);

sound(sig,fs)
pause
sound(y,fs)