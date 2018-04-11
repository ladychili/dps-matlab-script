function signal = myChirp(f1,f2,dur,fs)
if (nargin < 4)
    fs = 8000;
end
t = linspace(0,dur,fs*dur);
a = (f2 - f1)/dur;
psi = 2*pi*(a/2*t.*t + f1*t);
signal = sin(psi);