close all;
clear;
clc;

sample_rate = 220250;       % Sample rate per sec
freq = 5;                   % Cycles per sec
dur = 1;                    % Sec
amplitude = 1;              % peak(+/-)
init_amp = 0.25;
final_amp = 0.75;
timeindex = linspace(0,dur,sample_rate*dur);
sineWave1 = amplitude*sin(2*pi*freq*timeindex);
envelope = linspace(init_amp,final_amp,sample_rate*dur);
sineWave2 = sineWave1.*envelope;

subplot(3,1,1),plot(timeindex,sineWave1),
title('the original signal');
subplot(3,1,2),plot(timeindex,envelope),
title('the ramp');
subplot(3,1,3),plot(timeindex,sineWave2),
title('the ramped signal');