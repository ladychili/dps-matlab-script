clear all
clc

fs = 44100;
t = linspace(0,0.5,0.5*fs);

N= length(t);
noise = rand(N,1);

plot(t, noise);