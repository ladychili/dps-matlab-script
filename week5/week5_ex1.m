close; clear; clc;
%% Generate
fs = 22050;
t = linspace(0,1,fs);

F = [100, 200, 300, 8000, 9000];
A = 3;
s = zeros(1,length(t));
for i = 1:5
    s = s + A*sin(2*pi*F(i)*t);
end

% plot(s);

%% FFT
NFFT = 20480;
X = fft(s,NFFT);

mag = abs(X);
phi = angle(X);
bins = linspace(0,fs/2,NFFT/2);

subplot(211),plot(bins,mag(1:NFFT/2)),grid on,title('Magnitude');
subplot(212),plot(bins,phi(1:NFFT/2)),grid on,title('Phase');

%% IFFT
ss = ifft(X,NFFT);
figure;
subplot(211),plot(ss),grid on,title('IFFT');
subplot(212),plot(s), grid on,title('Original');

