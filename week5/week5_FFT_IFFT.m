close all
clear;clc

fs = 44100;

t = linspace(0,1,fs);


f = [1000, 5000, 10000];
a = [0.75, 0.5, 0.3];

s = zeros(1,length(t)); % declare 's' b4 loop 

for n = 1:3
    s = s + (a(n)*sin(2*pi*f(n)*t));
end

% plot(t,s)

%% FFT
N = 2^15;
X = fft(s,N); % N-point DFT

phi = angle(X);  % phase response
mag = abs(X);    % magnitude response
fullbins = linspace(0,fs,N); % symmetrical at N/2
halfbins = linspace(0,fs/2,N/2); 

subplot(2,2,1),plot(halfbins,mag(1:N/2));grid on;title('Magnitude Spectrum');
subplot(2,2,3),plot(halfbins,phi(1:N/2));grid on;title('Phase Spectrum');
subplot(2,2,2),plot(fullbins,mag(1:N));grid on;title('Full Magnitudes Spectrum');
subplot(2,2,4),plot(fullbins,phi(1:N));grid on;title('Full Phase Spectrum');


%% IFFT
s2 = ifft(X,N);
% subplot(211),plot(s2),grid on,title('IFFT');
% subplot(212),plot(s),grid on,title('original');
