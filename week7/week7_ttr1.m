close; clear; clc;

%% input signal x containing 300Hz 1000Hz
f1 = 300;
f2 = 1000;
fs = 4000;
tt = linspace(-1,1,fs*2);
x = sin(2*pi*f1*tt)+sin(2*pi*f2*tt);

%% define Lowpass sinc filter(with num&den), hamming windowed 
fc = 700;        % cutoff freq
r = fc/(fs/2);   % normalizing fc
t = -256:256;    % 513-tap 
B = sinc(r*t).*hamming(length(t))'; % hamming windowed sinc filter
B = B/sum(B);    % normalizing fiter, to avoid overflow
A = 1;           % denominator
fvtool(B,A);title('Lowpass Filter');    % visualize the lowpass filter

%% Apply the lowpass filter to x
y = filter(B,A,x);   % built-in filtering function, instead of convolution

%% Examine the freq content of input,output.
NFFT = 2^12;
bins = linspace(0,fs/2,NFFT/2);
X = abs(fft(x,NFFT));
subplot(311), plot(bins,X(1:NFFT/2));title('Input Signal Spectrum');      %input freq response
Y = abs(fft(y,NFFT));
subplot(312), plot(bins,Y(1:NFFT/2));title('Output Spectrum(Lowpass)');     %output freq reponse

%% define highpass by spectral inversion
BB = -B;
BB(257) = 1+BB(257); % middle coefficient
yy = filter(BB,A,x);
YY = abs(fft(yy,NFFT));
subplot(313), plot(bins,YY(1:NFFT/2)); title('Output Spectrum(Highpass)')
fvtool(BB,A);title('Highpass Filter');  % visualize the Highpass filter
