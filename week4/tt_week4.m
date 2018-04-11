
%% Superposition of 1100Hz and 250Hz sinusoids, filter it.
fs = 9600;
t = linspace(0,1,fs);
f1 = 1100;
f2 = 250;

sinWav = sin(2*pi*f1*t) + sin(2*pi*f2*t);
a = 1;
filtered = filter(b,a,sinWav);
% subplot(211),plot(t,sinWav),title('Original signal');
% subplot(212),plot(t,filtered),title('filtered signal');

fvtool(sinWav);
fvtool(filtered); % the 1100Hz component was fitered out. only 250Hz left.