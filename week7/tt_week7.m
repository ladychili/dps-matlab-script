close; clear; clc;

%% 300,100 Hz input x
fs = 4000;
tt = linspace(-1,1,fs*2);

f1 = 300;
f2 = 1000;
x = sin(2*pi*f1*tt)+sin(2*pi*f2*tt);
%% sinc lowpass fc=700
fc = 700;
r = fc/(fs/2);
t = -256:256; % 513 tap
B = sinc(r*t).*hamming(length(t))'; % !!!!!! DON'T forget '
B = B/sum(B); % normalize
A = 1;
fvtool(B,A)   % check the hamming sinc 700Hz lowpass

%% filter x!
y = filter(B,A,x);

%% check lowpass output
N = 2^12;
X = abs(fft(x,N));
Y = abs(fft(y,N));
bins = linspace(0,fs/2,N/2);
subplot(311),plot(bins,X(1:N/2));grid on;
subplot(312),plot(bins,Y(1:N/2));grid on;

%% spectral inversion highpass
BB = -B;
BB(257) = 1-B(257); % Impulse - B
yy = filter(BB,A,x);
YY = abs(fft(yy,N));
subplot(313),plot(bins,YY(1:N/2));grid on;


