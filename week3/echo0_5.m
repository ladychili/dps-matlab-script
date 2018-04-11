close;clear;clc;

[sig,fs] = audioread('pluck.wav'); %Read Signal, save sample rate to fs
ir = zeros(1, 3*fs); % time 3s multiply fs -> signal length(total samples)
ir([1, round(fs/2), fs, round(3*fs/2), 2*fs, round(5*fs/2)]) = [1, 1/2, 1/3, 1/4, 1/5, 1/6]; % delay taps every 0.5, amp 1/n

y = conv(sig, ir);  % convolve the two signals 

t1=(1:length(sig))/fs;  % signal length(total samples) divided by fs -> time
t2=(1:length(y))/fs;
subplot(211), plot(t1, sig);   
subplot(212), plot(t2, y); 		 
% plot both signals on same figure.
audiowrite('pluck_echo.wav',y,fs);

sound(sig,fs)
pause
sound(y,fs)