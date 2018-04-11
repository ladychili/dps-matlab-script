close all;
clear;
clc;

sample_rate = 220250;       % Sample rate per sec
freq = 5;                   % Cycles per sec
dur = 1;                    % Sec
amplitude = 1;              % peak(+/-)

timeindex = linspace(0,dur,sample_rate*dur);

sineWave1 = amplitude*sin(2*pi*freq*timeindex);
A = linspace(0,1,length(timeindex)/4+1);
D = linspace(1,0.7,length(timeindex)/4);
S = linspace(0.7,0.7,length(timeindex)/4+1);
R = linspace(0.7,0,length(timeindex)/4);
envelope =[A D S R];
sineWave2 = sineWave1.*envelope;

subplot(3,1,1),plot(timeindex,sineWave1),grid,
title('the original signal');
subplot(3,1,2),plot(timeindex,envelope),grid,
title('the ramp');
subplot(3,1,3),plot(timeindex,sineWave2),grid,
title('the ramped signal');