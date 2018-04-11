close; clear; clc;
%% Q1. Display 4th using FOR loop;
z = [5,4,3,2,1];
for i=1:length(z) % for i=1:5:
    if i == 4
        disp(z(i))
    end
end

%% Q2. random noise 0.5s, 44100Hz
f = 44100;
t = linspace(0,0.5,0.5*f);
SignalNoize = rand(length(t),1);
plot(t,SignalNoize);

%% Q3. root mean square
X = [1 2 3 4 5 6 7];
sum = 0;
for i = 1:length(X)
    sum = sum + X(i)*X(i);
end
mean = sum/length(X);
rms = sqrt(mean);
disp(rms);