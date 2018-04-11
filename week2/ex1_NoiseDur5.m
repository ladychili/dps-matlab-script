close all;
clear;
clc;

NoiseFs = 22050;    % sampling frequency
NoiseDur = 5;       % duration
t = linspace(0,NoiseDur,NoiseFs*NoiseDur);
noise = randn(1,length(t));
plot(t,noise);



