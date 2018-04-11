close; clear; clc;

fs = 1024;
N = 10;
x = -N:1/fs:N;
fc = 0.7; % cutoff freq(normalized to fs/2)

sinc = sin(pi*fc.*x)./(pi*fc.*x);
win = blackman(length(sinc))';
y = sinc.*win;
