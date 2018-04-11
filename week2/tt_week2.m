close; clear; clc;
%% Q1. 5s noise, fz=22050;
dur = 5;
f = 22050;
t = linspace(0,dur,dur*f);
noise = randn(size(t));

%% Q2. Scale signal with ramps
dur = 1;
fs = 22050;
t = linspace(0,dur,fs);

A = 1;
f = 5;
s = A*sin(2*pi*f*t);

ramp1 = linspace(1,0,length(s));
ramp2 = linspace(0.25,0.75,length(s));

half = linspace(0,1,length(s)/2);
ramp3 = [half fliplr(half)]; % flip left-right; flipud = flip up-down

attack = linspace(0,0.8,length(s)/4); 
decay = linspace(0.8,0.5,round(length(s)/4)); 
sustain = linspace(0.5,0.5,length(s)/4); 
release = linspace(0.5,0,round(length(s)/4)); 
ramp4 = [attack decay sustain release];

sramped1 = s.*ramp1;
sramped2 = s.*ramp2;
sramped3 = s.*ramp3;
sramped4 = s.*ramp4;
subplot(4,1,1),plot(t,sramped1),title('Ramped from 100% to 0%');
subplot(4,1,2),plot(t,sramped2),title('Ramped from 25% to 75%');
subplot(4,1,3),plot(t,sramped3),title('Fade in and fade out');
subplot(4,1,4),plot(t,sramped4),title('attack decay sustain release');
