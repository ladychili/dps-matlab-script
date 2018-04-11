clear; clc;

fs = 64;
t = linspace(0,1,fs);
f = 10;
sinewave = sin(2*pi*f*t);
subplot(211),plot(t,sinewave);
%% DFT
NFFT = 32;   % fs/2 pointed FFT
X = fft(sinewave,NFFT);  % 32-pointed
mag = abs(X);

% reso = fs/NFFT; % 64/32 = 2
bins = linspace(0,fs/2,NFFT/2); % 12
% freq = reso*bins;

subplot(212),plot(bins,mag(1:NFFT/2));grid on;
