close; clear; clc;
%% Generate chirp signal
Fs = 10000;
A = 1;
t = linspace(0,1,Fs);
psi = 2*pi*(500*t.*t+200*t+100); % 200=f0, 500=a/2, square of t has to be .*
chirp = A*sin(psi);              % f(t)=1000t+200, start at 200Hz, end at 1200Hz

N = 2^nextpow2(length(chirp));   % minimum power of 2 greater than chirp length
X = fft(chirp,N);
mag = abs(X);
plot(mag(1:N/2),'k'); grid on;

%% Generate chirp use user-defined function
cc = myChirp(100,500,1,8000);
figure;
subplot(121),plot(cc),grid on; 
nfft = 2^nextpow2(length(cc));
X = fft(cc, nfft);
subplot(122),plot(abs(X(1:(nfft/2)))),grid on;
soundsc(cc, 8000);