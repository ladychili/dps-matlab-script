
%% ex1. Filter 8kHz, 9kHz components;
fs = 44100;
t = linspace(0,1,fs);

f = [100,200,300,8000,9000];
s = zeros(size(t)); % initialize the superposition of sinusoids, same size with the timeindex
for n=1:5
    s = s + sin(2*pi*f(n)*t);
end

a=1;
ss = filter(b,1,s); % Filter s with num(exported from sptool pane),den

N = 2^15;
S = fft(ss,N);
mag = abs(S);
phi = angle(S);
bins = linspace(0,fs/2,N/2);
% subplot(211),plot(bins,mag(1:N/2)),grid on;
% subplot(212),plot(bins,phi(1:N/2)),grid on;

ssi = ifft(S,N);
% subplot(211),plot(ss),grid on;
% subplot(212),plot(ssi),grid on;

%% ex2. 
sampling_rate = 64;
tindex = linspace(0,1,sampling_rate);
fsin = 11;
sinw = sin(2*pi*fsin*tindex);

NN = 32;
SINW = fft(sinw,NN);
magnitude = abs(SINW);
bin = linspace(0,sampling_rate/2,NN/2);
plot(bin,magnitude(1:NN/2));

